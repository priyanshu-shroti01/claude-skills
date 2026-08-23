#!/usr/bin/env bash
# Claude OS — update the system from the repository.
# Pulls the current branch (ff-only), re-links skills, shows what changed,
# re-runs health checks. Never force-updates; conflicts go to the human.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

note "Claude OS update"
BRANCH="$(git branch --show-current)"
OLD_HEAD="$(git rev-parse HEAD 2>/dev/null || echo none)"
OLD_VER="$(head -1 VERSION 2>/dev/null)"

if ! git diff --quiet || ! git diff --cached --quiet; then
  fail "working tree has uncommitted changes — commit or stash first"
  exit 1
fi

info "fetching origin/$BRANCH…"
if ! retry 4 2 -- git fetch origin "$BRANCH"; then
  fail "fetch failed after retries"
  exit 1
fi

if ! git merge --ff-only "origin/$BRANCH"; then
  fail "cannot fast-forward — local commits diverge from origin. Resolve manually."
  exit 1
fi

NEW_HEAD="$(git rev-parse HEAD)"
NEW_VER="$(head -1 VERSION 2>/dev/null)"

if [ "$OLD_HEAD" = "$NEW_HEAD" ]; then
  pass "already up to date ($NEW_VER)"
else
  pass "updated: $OLD_VER → $NEW_VER"
  echo
  note "Changes:"
  git log --oneline "$OLD_HEAD..$NEW_HEAD" | head -30
  echo
  note "CHANGELOG (top):"
  awk '/^## /{n++} n==2{exit} n>=1{print}' CHANGELOG.md | head -30
fi

echo
bash scripts/install.sh
bash scripts/verify.sh >/dev/null 2>&1 && pass "verify clean" || warn "verify reported issues — run scripts/verify.sh"
bash scripts/doctor.sh || true
os_log update "updated $OLD_VER($OLD_HEAD) -> $NEW_VER($NEW_HEAD)"
