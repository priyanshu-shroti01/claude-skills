#!/usr/bin/env bash
# Claude OS — repository self-validation.
# Verifies internal consistency: structure, syntax, manifest cross-checks,
# links, secrets. Run after changing system files. Used by tests/.
#
# Usage: scripts/verify.sh [--section structure|syntax|agents|skills|workflows|links|secrets|all]
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

SECTION="all"
[ "${1:-}" = "--section" ] && SECTION="${2:-all}"

if ! have python3; then
  echo "FAIL  python3 is required for verify.sh" >&2
  exit 1
fi

# ── Shell syntax + executability (bash-side checks) ─────────────────
shell_checks() {
  local rc=0 f
  while IFS= read -r f; do
    if bash -n "$f" 2>/dev/null; then
      pass "bash syntax: $f"
    else
      fail "bash syntax error: $f"; rc=1
    fi
  done < <(find scripts tests .claude/hooks -name '*.sh' -type f 2>/dev/null | sort)
  while IFS= read -r f; do
    case "$f" in
      scripts/lib/*) continue ;;  # sourced, not executed
    esac
    if [ -x "$f" ]; then
      pass "executable: $f"
    else
      fail "not executable: $f (chmod +x)"; rc=1
    fi
  done < <(find scripts tests .claude/hooks -name '*.sh' -type f 2>/dev/null | sort)
  return $rc
}

if [ "$SECTION" = "syntax" ] || [ "$SECTION" = "all" ]; then
  shell_checks
fi

# ── Everything else in python (yaml/json/md aware) ──────────────────
python3 - "$SECTION" <<'PYEOF'
import json, os, re, sys
import yaml

section = sys.argv[1]
counts = {"pass": 0, "warn": 0, "fail": 0}

def pr(kind, msg):
    counts[kind] += 1
    print(f"{kind.upper():4}  {msg}")

SKIP_DIRS = {".git", "node_modules", "vendor", ".next", "dist", "build",
             "__pycache__", ".sandbox"}

def walk_files(exts=None):
    for dirpath, dirnames, filenames in os.walk("."):
        dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS]
        for fn in filenames:
            if exts and not any(fn.endswith(e) for e in exts):
                continue
            yield os.path.normpath(os.path.join(dirpath, fn))

def load_yaml(path):
    with open(path, encoding="utf-8") as f:
        return yaml.safe_load(f)

def frontmatter(path):
    with open(path, encoding="utf-8") as f:
        text = f.read()
    if not text.startswith("---"):
        return None, text
    parts = text.split("---", 2)
    if len(parts) < 3:
        return None, text
    try:
        return yaml.safe_load(parts[1]), parts[2]
    except yaml.YAMLError:
        return None, text

manifest = None
try:
    manifest = load_yaml("SYSTEM_MANIFEST.yaml")
except Exception as e:
    pr("fail", f"SYSTEM_MANIFEST.yaml unparseable: {e}")

# ── structure ───────────────────────────────────────────────────────
if section in ("structure", "all"):
    required = [
        "README.md", "CLAUDE.md", "AGENTS.md", "DESIGN.md", "SECURITY.md",
        "PRODUCTION_READINESS.md", "SYSTEM_MANIFEST.yaml", "VERSION",
        "CHANGELOG.md", "LICENSE", ".gitignore", ".env.example",
        ".claude/settings.json",
        "config/permissions/permission-levels.yaml",
        "config/permissions/approval-required.yaml",
        "config/skills/external-skills.yaml",
        "config/agents/agent-manifest.yaml",
        "config/providers/media.yaml",
        "docs/dependencies.md",
        "docs/architecture/skill-overlap.md",
        "scripts/bootstrap.sh", "scripts/doctor.sh", "scripts/install.sh",
        "scripts/update.sh", "scripts/sync.sh", "scripts/uninstall.sh",
        "scripts/project-init.sh", "scripts/verify.sh", "scripts/status.sh",
        "tests/run-all.sh",
    ]
    for p in required:
        if os.path.exists(p):
            pr("pass", f"exists: {p}")
        else:
            pr("fail", f"missing required file: {p}")
    # VERSION == manifest version
    if manifest:
        v_file = open("VERSION", encoding="utf-8").read().strip() if os.path.exists("VERSION") else "?"
        v_man = str(manifest.get("system", {}).get("version", "?"))
        if v_file == v_man:
            pr("pass", f"VERSION matches manifest ({v_file})")
        else:
            pr("fail", f"VERSION ({v_file}) != SYSTEM_MANIFEST system.version ({v_man})")

# ── syntax: json + yaml ─────────────────────────────────────────────
if section in ("syntax", "all"):
    for p in sorted(walk_files((".json",))):
        try:
            json.load(open(p, encoding="utf-8"))
            pr("pass", f"json: {p}")
        except Exception as e:
            pr("fail", f"json invalid: {p}: {e}")
    for p in sorted(walk_files((".yaml", ".yml"))):
        try:
            load_yaml(p)
            pr("pass", f"yaml: {p}")
        except Exception as e:
            pr("fail", f"yaml invalid: {p}: {e}")

# ── agents cross-check ──────────────────────────────────────────────
if section in ("agents", "all") and manifest:
    man_agents = list(manifest.get("agents") or [])
    try:
        agent_manifest = load_yaml("config/agents/agent-manifest.yaml")
        am_entries = {a["name"]: a for a in agent_manifest.get("agents", [])}
    except Exception as e:
        am_entries = {}
        pr("fail", f"agent-manifest unreadable: {e}")
    try:
        perms = load_yaml("config/permissions/permission-levels.yaml")
        ceilings = perms.get("agent_ceilings", {}) or {}
    except Exception as e:
        ceilings = {}
        pr("fail", f"permission-levels unreadable: {e}")

    for name in man_agents:
        op = f".claude/agents/{name}.md"
        ch = f"agents/{name}/README.md"
        ok = True
        if not os.path.exists(op):
            pr("fail", f"agent {name}: missing {op}"); ok = False
        else:
            fm, _ = frontmatter(op)
            if not fm or fm.get("name") != name:
                pr("fail", f"agent {name}: frontmatter name mismatch in {op}"); ok = False
            elif not fm.get("description"):
                pr("fail", f"agent {name}: missing description in {op}"); ok = False
        if not os.path.exists(ch):
            pr("fail", f"agent {name}: missing charter {ch}"); ok = False
        if name not in am_entries:
            pr("fail", f"agent {name}: missing from config/agents/agent-manifest.yaml"); ok = False
        cname = name if name in ceilings else None
        if cname is None:
            pr("fail", f"agent {name}: no ceiling in permission-levels.yaml"); ok = False
        elif name in am_entries and am_entries[name].get("ceiling") != ceilings[cname]:
            pr("fail", f"agent {name}: ceiling mismatch manifest={am_entries[name].get('ceiling')} perms={ceilings[cname]}"); ok = False
        if ok:
            pr("pass", f"agent: {name}")
    # extras
    for f in sorted(os.listdir(".claude/agents")):
        n = f[:-3] if f.endswith(".md") else None
        if n and n not in man_agents:
            pr("warn", f"agent file not in SYSTEM_MANIFEST: .claude/agents/{f}")
    for n in sorted(os.listdir("agents")):
        if os.path.isdir(f"agents/{n}") and n not in man_agents:
            pr("warn", f"agent dir not in SYSTEM_MANIFEST: agents/{n}")

# ── skills cross-check ──────────────────────────────────────────────
if section in ("skills", "all") and manifest:
    man_skills = manifest.get("skills") or {}
    seen_names = set()
    listed_paths = set()
    for cat, names in man_skills.items():
        for name in names or []:
            p = f"skills/{cat}/{name}/SKILL.md"
            listed_paths.add(os.path.normpath(p))
            if not os.path.exists(p):
                pr("fail", f"skill {cat}/{name}: missing {p}")
                continue
            fm, body = frontmatter(p)
            if not fm:
                pr("fail", f"skill {cat}/{name}: no valid frontmatter"); continue
            if fm.get("name") != name:
                pr("fail", f"skill {cat}/{name}: frontmatter name '{fm.get('name')}' != dir"); continue
            desc = fm.get("description") or ""
            if not desc.strip():
                pr("fail", f"skill {cat}/{name}: empty description"); continue
            if len(desc) > 1024:
                pr("warn", f"skill {cat}/{name}: description >1024 chars")
            if name in seen_names:
                pr("fail", f"skill name collision: {name}")
            seen_names.add(name)
            if len(body.strip()) < 200:
                pr("warn", f"skill {cat}/{name}: body suspiciously short")
            pr("pass", f"skill: {cat}/{name}")
    for p in walk_files(("SKILL.md",)):
        if p.startswith("skills/") and os.path.normpath(p) not in listed_paths:
            pr("warn", f"skill on disk not in SYSTEM_MANIFEST: {p}")

# ── workflows cross-check ───────────────────────────────────────────
if section in ("workflows", "all") and manifest:
    man_wf = list(manifest.get("workflows") or [])
    for name in man_wf:
        p = f"workflows/{name}/WORKFLOW.md"
        if not os.path.exists(p):
            pr("fail", f"workflow {name}: missing {p}")
        elif os.path.getsize(p) < 300:
            pr("warn", f"workflow {name}: suspiciously short")
        else:
            pr("pass", f"workflow: {name}")
    for n in sorted(os.listdir("workflows")):
        if os.path.isdir(f"workflows/{n}") and n not in man_wf:
            pr("warn", f"workflow dir not in SYSTEM_MANIFEST: workflows/{n}")
    # external refs resolve
    try:
        reg = load_yaml("config/skills/external-skills.yaml").get("registry", {})
        def scan_refs(node):
            if isinstance(node, dict):
                if "ref" in node and isinstance(node["ref"], str):
                    yield node["ref"]
                for v in node.values():
                    yield from scan_refs(v)
        missing = set()
        known_virtual = {"image-provider", "video-provider"}  # provider-abstracted
        for ref in scan_refs(manifest):
            if ref not in reg and ref not in known_virtual:
                missing.add(ref)
        if missing:
            for r in sorted(missing):
                pr("fail", f"manifest ref '{r}' not in external-skills registry")
        else:
            pr("pass", "all manifest external refs resolve in registry")
    except Exception as e:
        pr("fail", f"external registry unreadable: {e}")

# ── markdown links ──────────────────────────────────────────────────
if section in ("links", "all"):
    link_re = re.compile(r"\[[^\]]*\]\(([^)\s]+)\)")
    bad = 0
    for p in sorted(walk_files((".md",))):
        # external/ holds vendored third-party skills whose relative links
        # point into their own upstream repos; they are not ours to resolve.
        if p.startswith("external/"):
            continue
        in_fence = False
        for i, line in enumerate(open(p, encoding="utf-8"), 1):
            if line.strip().startswith("```"):
                in_fence = not in_fence
                continue
            if in_fence:
                continue
            for m in link_re.finditer(line):
                target = m.group(1).split("#")[0]
                if not target or target.startswith(("http://", "https://", "mailto:")):
                    continue
                base = "." if target.startswith("/") else os.path.dirname(p)
                resolved = os.path.normpath(os.path.join(base, target.lstrip("/")))
                if not os.path.exists(resolved):
                    pr("fail", f"broken link in {p}:{i} -> {m.group(1)}")
                    bad += 1
    if bad == 0:
        pr("pass", "markdown links resolve")

# ── secret scan ─────────────────────────────────────────────────────
if section in ("secrets", "all"):
    patterns = [
        ("anthropic key", re.compile(r"sk-ant-[A-Za-z0-9_-]{30,}")),
        ("openai-style key", re.compile(r"sk-[A-Za-z0-9]{40,}")),
        ("github token", re.compile(r"ghp_[A-Za-z0-9]{36}")),
        ("github fine-grained", re.compile(r"github_pat_[A-Za-z0-9_]{30,}")),
        ("aws key id", re.compile(r"AKIA[0-9A-Z]{16}")),
        ("slack token", re.compile(r"xox[baprs]-[A-Za-z0-9-]{10,}")),
        ("google api key", re.compile(r"AIza[0-9A-Za-z_-]{35}")),
        ("private key block", re.compile(r"-----BEGIN [A-Z]+ PRIVATE KEY-----")),
    ]
    hits = 0
    for p in sorted(walk_files()):
        if p.endswith((".png", ".jpg", ".jpeg", ".gif", ".woff", ".woff2", ".ico")):
            continue
        try:
            text = open(p, encoding="utf-8", errors="ignore").read()
        except OSError:
            continue
        for label, rx in patterns:
            for m in rx.finditer(text):
                # documentation placeholders (AIzaXXXX..., A1B2C3D4...) are not keys
                if re.search(r"X{8,}|A1B2C3D4|0123456789|EXAMPLE", m.group(0)):
                    continue
                pr("fail", f"possible secret ({label}) in {p}: {m.group(0)[:12]}…")
                hits += 1
    if hits == 0:
        pr("pass", "no credential patterns found in tree")
    # .gitignore essentials
    gi = open(".gitignore", encoding="utf-8").read() if os.path.exists(".gitignore") else ""
    for pat in (".env", "node_modules/", "vendor/", "*.pem", "*.key"):
        if pat in gi:
            pr("pass", f".gitignore covers {pat}")
        else:
            pr("fail", f".gitignore missing {pat}")

print()
print(f"verify[{section}]: {counts['pass']} pass, {counts['warn']} warn, {counts['fail']} fail")
sys.exit(1 if counts["fail"] else 0)
PYEOF
PY_RC=$?

# Combine bash-side counter with python exit
if [ "${N_FAIL:-0}" -gt 0 ] || [ "$PY_RC" -ne 0 ]; then
  exit 1
fi
exit 0
