#!/usr/bin/env bash
# Workflows: manifest cross-check + structural sanity (stages present).
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

OUT="$(bash scripts/verify.sh --section workflows 2>&1)"
RC=$?
if [ "$RC" -ne 0 ]; then
  printf '%s\n' "$OUT" | grep '^FAIL'
  exit 1
fi
COUNT="$(printf '%s\n' "$OUT" | grep -c '^PASS  workflow:')"
[ "$COUNT" -eq 15 ] || { echo "expected 15 workflows, got $COUNT"; exit 1; }

# Every workflow has stages and an owner/orchestrator line
for wf in workflows/*/WORKFLOW.md; do
  grep -qE '^## (Stages|Cycle|Amplified stages)' "$wf" || { echo "$wf: no stages section"; exit 1; }
  grep -qiE '(Orchestrator|Lead)' "$wf" || { echo "$wf: no orchestrator/lead"; exit 1; }
done
exit 0
