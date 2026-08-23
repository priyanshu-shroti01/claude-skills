#!/usr/bin/env bash
# Claude OS — uninstall machine-local pieces. The repository itself is left
# untouched (delete it yourself if you mean it). Asks before removing state.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

YES=0
[ "${1:-}" = "--yes" ] && YES=1

note "Claude OS uninstall (repo is preserved)"

# 1. Remove skill symlinks
COUNT=0
for link in .claude/skills/*; do
  [ -L "$link" ] || continue
  rm "$link"; COUNT=$((COUNT+1))
done
pass "removed $COUNT skill links from .claude/skills"

# 2. Remove generated .mcp.json (templates in config/mcp remain)
if [ -f ".mcp.json" ]; then
  rm .mcp.json
  pass "removed generated .mcp.json"
fi

# 3. State dir (ask)
if [ -d "$CLAUDE_OS_HOME" ]; then
  if [ "$YES" -eq 1 ]; then
    REPLY=y
  else
    printf 'Remove state dir %s (logs, locks, vendor)? [y/N] ' "$CLAUDE_OS_HOME"
    read -r REPLY
  fi
  case "$REPLY" in
    y|Y) rm -rf "$CLAUDE_OS_HOME"; pass "removed $CLAUDE_OS_HOME" ;;
    *) info "kept $CLAUDE_OS_HOME" ;;
  esac
fi

echo
note "Not touched (remove manually if desired):"
cat <<'EOF'
  - claude-mem        → see integrations/claude-mem/README.md for its uninstall
  - graphify          → python3 -m pip uninstall graphifyy
  - lighthouse        → npm uninstall -g lighthouse
  - Claude Code plugins (superpowers, etc.) → /plugin uninstall inside Claude Code
  - your .env         → contains YOUR credentials; delete it yourself
EOF
