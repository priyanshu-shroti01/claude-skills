#!/usr/bin/env bash
# bootstrap.sh --dry-run must succeed in a sandbox and touch nothing outside it.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SANDBOX="$ROOT/tests/.sandbox/bootstrap"
rm -rf "$SANDBOX"; mkdir -p "$SANDBOX"

CLAUDE_OS_HOME="$SANDBOX/os-home" bash "$ROOT/scripts/bootstrap.sh" --dry-run > "$SANDBOX/out.log" 2>&1
RC=$?
if [ "$RC" -ne 0 ]; then
  echo "bootstrap --dry-run exited $RC"; cat "$SANDBOX/out.log"; exit 1
fi
grep -q "dry run" "$SANDBOX/out.log" || { echo "dry-run banner missing"; exit 1; }
grep -q "OS:" "$SANDBOX/out.log" || { echo "OS detection missing"; exit 1; }
grep -q "Next steps" "$SANDBOX/out.log" || { echo "next-steps missing"; exit 1; }
# dry-run must not perform npm/pip installs
if grep -qE '^· run: (npm|npx|python3 -m pip)' "$SANDBOX/out.log"; then
  echo "dry-run executed an installer"; exit 1
fi
# idempotency: second dry-run also succeeds
CLAUDE_OS_HOME="$SANDBOX/os-home" bash "$ROOT/scripts/bootstrap.sh" --dry-run > "$SANDBOX/out2.log" 2>&1 || {
  echo "second bootstrap run failed"; exit 1; }
exit 0
