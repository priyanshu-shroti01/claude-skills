#!/usr/bin/env bash
# Skill manifests: SKILL.md frontmatter validity + manifest cross-check.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$(bash "$ROOT/scripts/verify.sh" --section skills 2>&1)"
RC=$?
if [ "$RC" -ne 0 ]; then
  printf '%s\n' "$OUT" | grep '^FAIL'
  exit 1
fi
COUNT="$(printf '%s\n' "$OUT" | grep -c '^PASS  skill:')"
[ "$COUNT" -eq 42 ] || { echo "expected 42 verified skills, got $COUNT"; exit 1; }
exit 0
