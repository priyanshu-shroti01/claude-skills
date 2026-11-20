#!/usr/bin/env python3
"""Export first-party skills as a pinned, platform-neutral runtime catalog.

    python3 scripts/export-runtime-catalog.py                 # write dist/runtime-catalog/
    python3 scripts/export-runtime-catalog.py --check         # validate only, write nothing
    python3 scripts/export-runtime-catalog.py --out DIR       # write elsewhere

Output: catalog.json (format 1, deterministic: sorted keys, the commit date as
exportedAt) and catalog.json.sha256. A runtime pins the sha256 of the exact
bytes; see docs/architecture/runtime-catalog.md.

What is exported: each skills/<category>/<name>/SKILL.md body (the
instructions) with its frontmatter description, and the runtime metadata from
config/skills/runtime-export.yaml. What is never exported: scripts or any other
file beside a SKILL.md, Claude Code hooks, commands or settings, and third-party
skills in external/ (listed under "excluded" with the reason).

Exit status: 0 ok, 1 validation errors (all listed), 2 usage or environment.
Needs Python 3.9+ and PyYAML (as scripts/verify.sh does).
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys

try:
    import yaml
except ImportError:  # pragma: no cover
    print("export-runtime-catalog: PyYAML is required (pip install pyyaml)", file=sys.stderr)
    sys.exit(2)

FORMAT = 1
REPO = "priyanshu-shroti01/claude-skills"
ID_RE = re.compile(r"^[a-z0-9][a-z0-9-]{0,62}[a-z0-9]$")
SEMVER_RE = re.compile(r"^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$")
RISKS = ("low", "medium", "high")
MIN_BODY, MAX_BODY, MAX_DESC = 200, 24000, 1024

# Instruction-shaped text that tries to act as authority. Mirrors the runtime's
# screen (shrotihost-agents src/lib/os/skill-catalog.ts); a match fails the export
# so a poisoned skill never reaches a release.
SUSPICIOUS = [
    (r"\bignore (all |any |the )?(previous|prior|above|earlier|system) (instructions|rules|prompts?|policies)\b", "tells the model to ignore its instructions"),
    (r"\b(you are|you're) (now )?(authori[sz]ed|allowed|permitted) to (bypass|skip|override|ignore)\b", "claims to authorise a bypass"),
    (r"\b(bypass|skip|override|disable|circumvent) (the )?(approval|policy engine|permission checks?|audit log|broker|guardrails?)\b(?![^.\n]{0,40}\b(is|are) (never|not) )", "asks for a control to be bypassed"),
    (r"\b(grant|give) (yourself|itself|the agent) [^.\n]{0,30}\b(permission|right|access|privilege)s?\b", "asks the agent to grant itself rights"),
    (r"\bcurl\b[^\n|]{0,200}\|\s*(sudo\s+)?(ba|z)?sh\b", "pipes a download into a shell"),
    (r"\b(print|echo|send|post|upload|exfiltrate) [^.\n]{0,40}\b(\.env|api[_ -]?keys?|secrets?|tokens?|passwords?|private keys?)\b[^.\n]{0,40}\b(to|into) (https?:|a (url|webhook|remote))", "sends secrets somewhere"),
    (r"</?(system|assistant|founder|ceo|tool_result|untrusted|skill)\b[^>]*>", "contains role or wrapper markup"),
    (r"\b(as|from) the (founder|ceo|system)\s*:", "speaks as the founder, the CEO or the system"),
]
SUSPICIOUS = [(re.compile(p, re.I), why) for p, why in SUSPICIOUS]


def screen(text):
    return [why for rx, why in SUSPICIOUS if rx.search(text)]


def sha256(text):
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def split_frontmatter(raw):
    if not raw.startswith("---\n"):
        return None, raw
    end = raw.find("\n---\n", 4)
    if end < 0:
        return None, raw
    try:
        meta = yaml.safe_load(raw[4:end]) or {}
    except yaml.YAMLError:
        return None, raw
    return (meta if isinstance(meta, dict) else None), raw[end + 5:]


def git(root, *args):
    try:
        return subprocess.check_output(["git", "-C", root] + list(args), stderr=subprocess.DEVNULL, text=True).strip()
    except (OSError, subprocess.CalledProcessError):
        return ""


def agents_mentioning(root, name):
    """claude-skills agents whose charter or definition names the skill (informational)."""
    found = set()
    for base, suffix in (("agents", "README.md"), (".claude/agents", "")):
        d = os.path.join(root, base)
        if not os.path.isdir(d):
            continue
        for entry in sorted(os.listdir(d)):
            path = os.path.join(d, entry, suffix) if suffix else os.path.join(d, entry)
            if not os.path.isfile(path):
                continue
            with open(path, encoding="utf-8") as f:
                if re.search(r"(?<![a-z0-9-])" + re.escape(name) + r"(?![a-z0-9-])", f.read()):
                    found.add(entry[:-3] if entry.endswith(".md") else entry)
    return sorted(found)


def find_cycles(deps):
    bad, state = set(), {}

    def visit(node, stack):
        if state.get(node) == 2:
            return
        if state.get(node) == 1:
            bad.update(stack[stack.index(node):])
            return
        state[node] = 1
        for d in deps.get(node, []):
            visit(d, stack + [node])
        state[node] = 2

    for n in sorted(deps):
        visit(n, [])
    return bad


def build(root, commit=None, date=None):
    errors = []
    version_file = os.path.join(root, "VERSION")
    version = open(version_file, encoding="utf-8").read().strip() if os.path.isfile(version_file) else ""
    if not SEMVER_RE.match(version):
        errors.append("VERSION is missing or not semver")
    commit = commit or git(root, "rev-parse", "HEAD")
    date = date or git(root, "log", "-1", "--format=%cI")
    if not re.match(r"^[0-9a-f]{7,40}$", commit or ""):
        errors.append("not a git checkout (pass --source-commit)")
    if not date:
        errors.append("no commit date (pass --source-date)")

    meta_path = os.path.join(root, "config", "skills", "runtime-export.yaml")
    try:
        with open(meta_path, encoding="utf-8") as f:
            runtime_meta = (yaml.safe_load(f) or {}).get("skills") or {}
    except (OSError, yaml.YAMLError) as e:
        runtime_meta = {}
        errors.append("config/skills/runtime-export.yaml: %s" % e)

    skills, excluded, seen = [], [], {}
    skills_dir = os.path.join(root, "skills")
    for category in sorted(os.listdir(skills_dir)) if os.path.isdir(skills_dir) else []:
        cdir = os.path.join(skills_dir, category)
        if not os.path.isdir(cdir):
            continue
        for name in sorted(os.listdir(cdir)):
            sdir = os.path.join(cdir, name)
            sfile = os.path.join(sdir, "SKILL.md")
            if not os.path.isfile(sfile):
                continue
            rel = "skills/%s/%s/SKILL.md" % (category, name)
            if os.path.islink(sdir) or os.path.islink(sfile):
                errors.append("%s: symlinks are not exported" % rel)
                continue
            with open(sfile, encoding="utf-8") as f:
                fm, body = split_frontmatter(f.read())
            problems = []
            if fm is None:
                errors.append("%s: no valid YAML frontmatter" % rel)
                continue
            if fm.get("name") != name:
                problems.append("frontmatter name %r is not the folder name" % fm.get("name"))
            if not ID_RE.match(name):
                problems.append("name is not lower-case letters, digits and hyphens")
            if not ID_RE.match(category):
                problems.append("category %r is malformed" % category)
            desc = fm.get("description")
            if not isinstance(desc, str) or not desc.strip() or len(desc) > MAX_DESC:
                problems.append("description is empty or longer than %d characters" % MAX_DESC)
            m = runtime_meta.get(name)
            if not isinstance(m, dict):
                problems.append("no entry in config/skills/runtime-export.yaml")
                m = {}
            if name in seen:
                problems.append("duplicate name (also %s)" % seen[name])
            seen[name] = rel
            if problems:
                errors.extend("%s: %s" % (rel, p) for p in problems)
                continue
            if m.get("runtime") is False:
                excluded.append({"path": rel, "reason": "Claude Code only (runtime: false in runtime-export.yaml)"})
                continue
            instructions = body.strip("\n") + "\n"
            risk, triggers, depends = m.get("risk"), m.get("triggers", []), m.get("depends_on", [])
            if risk not in RISKS:
                problems.append("risk must be one of %s" % ", ".join(RISKS))
            if not (isinstance(triggers, list) and all(isinstance(t, str) and 0 < len(t) <= 60 for t in triggers) and len(triggers) <= 40):
                problems.append("triggers must be a list of short phrases")
            if not (isinstance(depends, list) and all(isinstance(d, str) and ID_RE.match(d) for d in depends) and len(depends) <= 10):
                problems.append("depends_on must be a list of skill names")
            if len(instructions.strip()) < MIN_BODY:
                problems.append("instructions shorter than %d characters" % MIN_BODY)
            if len(instructions) > MAX_BODY:
                problems.append("instructions longer than %d characters" % MAX_BODY)
            for why in screen(desc + "\n" + instructions):
                problems.append("suspicious text: %s" % why)
            if problems:
                errors.extend("%s: %s" % (rel, p) for p in problems)
                continue
            other_files = [f for f in os.listdir(sdir) if f != "SKILL.md"]
            skills.append({
                "id": name,
                "name": name.replace("-", " ").capitalize(),
                "description": " ".join(desc.split()),
                "version": version,
                "category": category,
                "path": rel,
                "license": "MIT",
                "origin": "first-party",
                "risk": risk,
                "agents": agents_mentioning(root, name),
                "dependsOn": sorted(depends),
                "triggers": [t.strip().lower() for t in triggers],
                "hasScripts": any(os.path.isdir(os.path.join(sdir, f)) or os.access(os.path.join(sdir, f), os.X_OK) for f in other_files),
                "sha256": sha256(instructions),
                "instructions": instructions,
            })

    for name in sorted(set(runtime_meta) - set(seen)):
        errors.append("runtime-export.yaml names %s, which has no SKILL.md" % name)

    ids = {s["id"] for s in skills}
    for s in skills:
        for d in s["dependsOn"]:
            if d not in ids:
                errors.append("%s: depends on %s, which is not exported" % (s["path"], d))
    for n in sorted(find_cycles({s["id"]: s["dependsOn"] for s in skills})):
        errors.append("%s: dependency cycle" % n)

    ext = os.path.join(root, "external")
    for name in sorted(os.listdir(ext)) if os.path.isdir(ext) else []:
        d = os.path.join(ext, name)
        if name.startswith(".") or not os.path.isfile(os.path.join(d, "SKILL.md")):
            continue
        lic = any(os.path.isfile(os.path.join(d, f)) for f in ("LICENSE", "LICENSE.txt", "LICENSE.md"))
        excluded.append({
            "path": "external/%s" % name,
            "reason": "third-party: not reviewed for runtime use (licence file %s)" % ("present" if lic else "missing"),
        })

    catalog = {
        "format": FORMAT,
        "source": {"repo": REPO, "commit": commit, "version": version, "exportedAt": date},
        "skills": sorted(skills, key=lambda s: s["id"]),
        "excluded": excluded,
    }
    return catalog, errors


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--root", default=os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
    ap.add_argument("--out", default=None)
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--allow-dirty", action="store_true")
    ap.add_argument("--source-commit", default=None)
    ap.add_argument("--source-date", default=None)
    a = ap.parse_args()

    root = os.path.abspath(a.root)
    if not a.check and not a.allow_dirty and not a.source_commit and git(root, "status", "--porcelain", "--", "skills", "config/skills", "VERSION"):
        print("export-runtime-catalog: skills/, config/skills or VERSION has uncommitted changes; commit first (or --allow-dirty)", file=sys.stderr)
        return 2
    catalog, errors = build(root, a.source_commit, a.source_date)
    if errors:
        for e in errors:
            print("FAIL  %s" % e)
        print("export-runtime-catalog: %d error(s); nothing written" % len(errors))
        return 1
    text = json.dumps(catalog, indent=1, sort_keys=True, ensure_ascii=False) + "\n"
    digest = sha256(text)
    print("PASS  %d skills exported, %d excluded; sha256 %s" % (len(catalog["skills"]), len(catalog["excluded"]), digest))
    if a.check:
        return 0
    out = os.path.abspath(a.out or os.path.join(root, "dist", "runtime-catalog"))
    os.makedirs(out, exist_ok=True)
    with open(os.path.join(out, "catalog.json"), "w", encoding="utf-8", newline="\n") as f:
        f.write(text)
    with open(os.path.join(out, "catalog.json.sha256"), "w", encoding="utf-8", newline="\n") as f:
        f.write("%s  catalog.json\n" % digest)
    print("wrote %s/catalog.json" % out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
