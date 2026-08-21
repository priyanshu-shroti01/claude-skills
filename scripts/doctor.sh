#!/usr/bin/env bash
# Claude OS — health check. Clear PASS/WARN/FAIL report; exit 0 iff no FAIL.
# FAIL = hard requirement broken. WARN = degraded (external dep missing,
# optional not configured). Run any time; safe and read-only.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

note "Claude OS doctor — $(head -1 VERSION 2>/dev/null || echo '?') — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo

# ── Core toolchain ──────────────────────────────────────────────────
if have claude; then pass "claude CLI ($(claude --version 2>/dev/null | head -1))"
else warn "claude CLI missing — npm install -g @anthropic-ai/claude-code"; fi

if have node && version_ge "$(node_version)" "20.0.0"; then pass "node $(node_version)"
elif have node; then fail "node $(node_version) < 20 (required)"
else fail "node missing (>= 20 required)"; fi

if have npm; then pass "npm $(npm --version 2>/dev/null)"
else fail "npm missing"; fi

if have python3 && version_ge "$(python_version)" "3.10.0"; then pass "python3 $(python_version)"
elif have python3; then fail "python3 $(python_version) < 3.10 (required)"
else fail "python3 missing (>= 3.10 required)"; fi

if python3 -c 'import yaml' 2>/dev/null; then pass "python3 pyyaml"
else warn "pyyaml missing — python3 -m pip install --user pyyaml (verify.sh needs it)"; fi

if have git && version_ge "$(git_version)" "2.30.0"; then pass "git $(git_version)"
else fail "git >= 2.30 required"; fi

if have jq; then pass "jq $(jq --version 2>/dev/null)"
else warn "jq missing (recommended)"; fi

# ── Repository integrity ────────────────────────────────────────────
for f in CLAUDE.md SECURITY.md DESIGN.md SYSTEM_MANIFEST.yaml .claude/settings.json; do
  if [ -f "$f" ]; then pass "repo file: $f"; else fail "repo file missing: $f"; fi
done

# ── Skills linked ───────────────────────────────────────────────────
SKILL_SRC="$(find skills -name SKILL.md -type f 2>/dev/null | wc -l | tr -d ' ')"
SKILL_LNK="$(find .claude/skills -maxdepth 1 -type l 2>/dev/null | wc -l | tr -d ' ')"
if [ "$SKILL_LNK" -ge "$SKILL_SRC" ] && [ "$SKILL_SRC" -gt 0 ]; then
  pass "skills linked ($SKILL_LNK/$SKILL_SRC)"
elif [ "$SKILL_LNK" -gt 0 ]; then
  warn "skills partially linked ($SKILL_LNK/$SKILL_SRC) — run scripts/install.sh"
else
  warn "skills not linked — run scripts/install.sh"
fi

# ── Agents present ──────────────────────────────────────────────────
AGENTS="$(find .claude/agents -name '*.md' -type f 2>/dev/null | wc -l | tr -d ' ')"
if [ "$AGENTS" -ge 29 ]; then pass "agents defined ($AGENTS)"
else fail "agents incomplete ($AGENTS/29) — repo corrupted?"; fi

# ── Hooks ───────────────────────────────────────────────────────────
for h in .claude/hooks/pre-tool-guard.sh .claude/hooks/session-start.sh; do
  if [ -x "$h" ]; then pass "hook executable: $h"
  elif [ -f "$h" ]; then fail "hook not executable: $h (chmod +x)"
  else fail "hook missing: $h"; fi
done

# ── MCP configuration ───────────────────────────────────────────────
if [ -f ".mcp.json" ]; then
  if python3 -c 'import json;json.load(open(".mcp.json"))' 2>/dev/null; then
    pass ".mcp.json valid ($(python3 -c 'import json;print(",".join(json.load(open(".mcp.json")).get("mcpServers",{})))' 2>/dev/null))"
  else fail ".mcp.json invalid JSON"; fi
else
  warn ".mcp.json missing — run scripts/install.sh"
fi
for t in config/mcp/playwright.json config/mcp/shadcn.json config/mcp/github.json config/mcp/figma.json; do
  if python3 -c "import json;json.load(open('$t'))" 2>/dev/null; then pass "mcp template: $t"
  else fail "mcp template invalid/missing: $t"; fi
done

# ── External integrations ───────────────────────────────────────────
if have claude-mem || [ -d "$HOME/.claude-mem" ]; then pass "claude-mem installed"
else warn "claude-mem not installed — scripts/bootstrap.sh installs it (memory degrades to MEMORY.md convention)"; fi

if have graphify; then pass "graphify installed"
else warn "graphify not installed — scripts/bootstrap.sh installs it (graph degrades to manual GRAPH_REPORT.md)"; fi

if have lighthouse; then pass "lighthouse installed"
else warn "lighthouse not installed — npm install -g lighthouse@13.4.1"; fi

# Browser tooling
if [ -n "${PLAYWRIGHT_BROWSERS_PATH:-}" ] && [ -d "${PLAYWRIGHT_BROWSERS_PATH:-/nonexistent}" ]; then
  pass "playwright browsers (PLAYWRIGHT_BROWSERS_PATH=$PLAYWRIGHT_BROWSERS_PATH)"
elif [ -d "$HOME/.cache/ms-playwright" ]; then
  pass "playwright browsers (~/.cache/ms-playwright)"
else
  warn "playwright browsers not detected — npx playwright install chromium (or bootstrap --with-browsers)"
fi

# ── Environment & filesystem ────────────────────────────────────────
if [ -f ".env" ]; then
  pass ".env present (values not inspected)"
  if git check-ignore -q .env 2>/dev/null; then pass ".env is gitignored"
  else fail ".env NOT gitignored — fix .gitignore immediately"; fi
else
  warn ".env missing — cp .env.example .env (only if you need credentials)"
fi

AUTONOMY="${CLAUDE_OS_MAX_AUTONOMY:-3}"
case "$AUTONOMY" in
  [0-3]) pass "CLAUDE_OS_MAX_AUTONOMY=$AUTONOMY" ;;
  [4-5]) warn "CLAUDE_OS_MAX_AUTONOMY=$AUTONOMY — L4/L5 still require per-action human approval" ;;
  *) fail "CLAUDE_OS_MAX_AUTONOMY invalid: $AUTONOMY" ;;
esac

if [ -d "$CLAUDE_OS_HOME" ] && [ -w "$CLAUDE_OS_HOME" ]; then
  pass "state dir writable: $CLAUDE_OS_HOME"
else
  warn "state dir missing: $CLAUDE_OS_HOME — bootstrap creates it"
fi

DISK_FREE="$(df -Pk . 2>/dev/null | awk 'NR==2{print int($4/1024)}')"
if [ -n "$DISK_FREE" ] && [ "$DISK_FREE" -lt 500 ]; then
  warn "low disk space: ${DISK_FREE}MB free"
else
  pass "disk space: ${DISK_FREE:-?}MB free"
fi

report_summary "doctor"
