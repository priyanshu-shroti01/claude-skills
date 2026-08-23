#!/usr/bin/env bash
# Claude OS — drift report: installed machine state vs. the manifest/registry.
# Read-only by default; --apply re-runs the installers for drifted items.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

APPLY=0
[ "${1:-}" = "--apply" ] && APPLY=1

note "Claude OS sync — machine vs. manifest $( [ "$APPLY" -eq 1 ] && echo '(apply mode)' )"
echo

DRIFT=0

# Skills: authored vs. linked
SRC="$(find skills -name SKILL.md -type f | wc -l | tr -d ' ')"
LNK="$(find .claude/skills -maxdepth 1 -type l 2>/dev/null | wc -l | tr -d ' ')"
if [ "$LNK" -eq "$SRC" ]; then
  pass "skills in sync ($LNK linked)"
else
  warn "skill drift: $SRC authored, $LNK linked"
  DRIFT=1
fi

# Pinned external versions vs. installed
check_pin() {
  local name="$1" pin="$2" current="$3"
  if [ -z "$current" ]; then
    warn "$name: pinned $pin, not installed"
    DRIFT=1
  elif [ "$current" = "$pin" ]; then
    pass "$name: $current (matches pin)"
  else
    warn "$name: installed $current, pin is $pin"
    DRIFT=1
  fi
}

LH_VER="$(lighthouse --version 2>/dev/null || true)"
check_pin "lighthouse" "13.4.1" "$LH_VER"

GRAPHIFY_VER="$(python3 -m pip show graphifyy 2>/dev/null | awk '/^Version:/{print $2}' || true)"
check_pin "graphify (pypi graphifyy)" "0.9.48" "$GRAPHIFY_VER"

CM_VER="$(claude-mem --version 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || true)"
check_pin "claude-mem" "13.15.3" "$CM_VER"

# Manifest internal consistency
if bash scripts/verify.sh >/dev/null 2>&1; then
  pass "repo internally consistent"
else
  warn "repo inconsistency — run scripts/verify.sh"
  DRIFT=1
fi

echo
if [ "$DRIFT" -eq 0 ]; then
  note "no drift."
elif [ "$APPLY" -eq 1 ]; then
  note "applying: re-running install + bootstrap external step"
  bash scripts/install.sh
  bash scripts/bootstrap.sh --skip-external >/dev/null 2>&1 || true
  info "re-run scripts/sync.sh to confirm; external pins update via scripts/bootstrap.sh"
else
  note "drift found — review above; scripts/sync.sh --apply to reconcile (or bootstrap.sh for external installs)"
fi
os_log sync "drift=$DRIFT apply=$APPLY"
[ "$DRIFT" -eq 0 ]
