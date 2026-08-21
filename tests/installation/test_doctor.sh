#!/usr/bin/env bash
# doctor.sh must produce a PASS/WARN/FAIL report and exit 0 when core
# requirements (node, python3, git, repo files) are satisfied — external
# integrations may be WARN in a fresh environment.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$(bash "$ROOT/scripts/doctor.sh" 2>&1)"
RC=$?
printf '%s\n' "$OUT" | grep -qE '^PASS' || { echo "no PASS lines in doctor output"; exit 1; }
printf '%s\n' "$OUT" | grep -q 'doctor:' || { echo "no summary line"; exit 1; }
if [ "$RC" -ne 0 ]; then
  echo "doctor reported FAILs in a supposedly healthy environment:"
  printf '%s\n' "$OUT" | grep '^FAIL'
  exit 1
fi
exit 0
