#!/usr/bin/env bash
# Claude OS — test suite runner. Runs every test script; reports per-test
# pass/fail; exit 0 iff all pass.
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT" || exit 1

PASS=0; FAIL=0; FAILED_TESTS=""

for t in tests/*/test_*.sh; do
  [ -f "$t" ] || continue
  printf '── %s ' "$t"
  if OUT="$(bash "$t" 2>&1)"; then
    echo "✔"
    PASS=$((PASS+1))
  else
    echo "✘"
    printf '%s\n' "$OUT" | sed 's/^/   │ /'
    FAIL=$((FAIL+1))
    FAILED_TESTS="$FAILED_TESTS $t"
  fi
done

echo
echo "tests: $PASS passed, $FAIL failed"
if [ "$FAIL" -gt 0 ]; then
  echo "failed:$FAILED_TESTS"
  exit 1
fi
