#!/usr/bin/env bash
# Agent definitions: manifest cross-check (files, frontmatter, ceilings).
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$(bash "$ROOT/scripts/verify.sh" --section agents 2>&1)"
RC=$?
if [ "$RC" -ne 0 ]; then
  printf '%s\n' "$OUT" | grep '^FAIL'
  exit 1
fi
# sanity: all 29 agents verified
COUNT="$(printf '%s\n' "$OUT" | grep -c '^PASS  agent:')"
[ "$COUNT" -eq 29 ] || { echo "expected 29 verified agents, got $COUNT"; exit 1; }
exit 0
