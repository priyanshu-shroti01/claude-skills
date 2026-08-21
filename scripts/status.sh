#!/usr/bin/env bash
# Claude OS — system dashboard (CLI). Read-only snapshot of the OS state.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

VER="$(head -1 VERSION 2>/dev/null | tr -d '[:space:]')"
AGENTS="$(find .claude/agents -name '*.md' -type f 2>/dev/null | wc -l | tr -d ' ')"
SKILLS_SRC="$(find skills -name SKILL.md -type f 2>/dev/null | wc -l | tr -d ' ')"
SKILLS_LNK="$(find .claude/skills -maxdepth 1 -type l 2>/dev/null | wc -l | tr -d ' ')"
WORKFLOWS="$(find workflows -name WORKFLOW.md -type f 2>/dev/null | wc -l | tr -d ' ')"
LAST_COMMIT="$(git log -1 --format='%h %ad %s' --date=short 2>/dev/null || echo 'no commits')"
BRANCH="$(git branch --show-current 2>/dev/null || echo '?')"

yn() { if "$@" >/dev/null 2>&1; then echo "${C_GREEN}ok${C_RESET}"; else echo "${C_YELLOW}missing${C_RESET}"; fi; }

note "╔══ Claude OS v${VER} ══════════════════════════════════════"
echo "║ branch: $BRANCH"
echo "║ last update: $LAST_COMMIT"
echo "╠══ Inventory"
echo "║ agents:    $AGENTS defined"
echo "║ skills:    $SKILLS_SRC authored, $SKILLS_LNK linked into .claude/skills"
echo "║ workflows: $WORKFLOWS defined"
echo "╠══ Integrations"
echo "║ claude CLI:  $(yn command -v claude)"
echo "║ claude-mem:  $(yn sh -c 'command -v claude-mem || test -d "$HOME/.claude-mem"')"
echo "║ graphify:    $(yn command -v graphify)"
echo "║ lighthouse:  $(yn command -v lighthouse)"
echo "║ mcp config:  $(yn test -f .mcp.json)"
echo "║ browsers:    $(yn sh -c 'test -d "${PLAYWRIGHT_BROWSERS_PATH:-$HOME/.cache/ms-playwright}"')"
echo "╠══ Security"
echo "║ hooks:       $(yn test -x .claude/hooks/pre-tool-guard.sh)"
echo "║ .env ignored:$(yn sh -c '! test -f .env || git check-ignore -q .env')"
echo "║ autonomy:    L${CLAUDE_OS_MAX_AUTONOMY:-3} max (L4/L5 always human-approved)"
echo "╠══ Health"
if bash scripts/doctor.sh >/dev/null 2>&1; then
  echo "║ doctor:      ${C_GREEN}no failures${C_RESET} (run scripts/doctor.sh for detail)"
else
  echo "║ doctor:      ${C_RED}FAILURES${C_RESET} — run scripts/doctor.sh"
fi
if bash scripts/verify.sh >/dev/null 2>&1; then
  echo "║ verify:      ${C_GREEN}consistent${C_RESET}"
else
  echo "║ verify:      ${C_RED}INCONSISTENT${C_RESET} — run scripts/verify.sh"
fi
if [ -f "$CLAUDE_OS_HOME/logs/claude-os.log" ]; then
  echo "║ last op log: $(tail -1 "$CLAUDE_OS_HOME/logs/claude-os.log" 2>/dev/null | cut -c1-70)"
fi
note "╚══════════════════════════════════════════════════════════"
