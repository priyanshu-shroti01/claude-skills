#!/usr/bin/env bash
# Secret scan + .gitignore coverage (verify.sh secrets section).
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$(bash "$ROOT/scripts/verify.sh" --section secrets 2>&1)"
RC=$?
if [ "$RC" -ne 0 ]; then
  printf '%s\n' "$OUT" | grep '^FAIL'
  exit 1
fi
# .env must never be trackable
cd "$ROOT"
if [ -f .env ] && ! git check-ignore -q .env; then
  echo ".env exists and is not ignored"; exit 1
fi
exit 0
