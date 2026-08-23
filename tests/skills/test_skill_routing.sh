#!/usr/bin/env bash
# Skill routing: the router's routing table must reference real skills, and
# skill discovery (install.sh linking) must expose every authored skill.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

ROUTER="skills/core/skill-router/SKILL.md"
[ -f "$ROUTER" ] || { echo "router skill missing"; exit 1; }

# Every internal skill name mentioned in the router must exist on disk;
# and the router should reference a healthy majority of the library.
MENTIONED=0; MISSING=0; TOTAL=0
for dir in skills/*/*/; do
  [ -f "${dir}SKILL.md" ] || continue
  TOTAL=$((TOTAL+1))
  name="$(basename "$dir")"
  if grep -q "$name" "$ROUTER"; then
    MENTIONED=$((MENTIONED+1))
  fi
done
[ "$TOTAL" -eq 27 ] || { echo "expected 27 skills on disk, got $TOTAL"; exit 1; }
[ "$MENTIONED" -ge $((TOTAL * 2 / 3)) ] || {
  echo "router references only $MENTIONED/$TOTAL skills — routing table stale"; exit 1; }

# Names in the router's routing table that look like skills must exist
while IFS= read -r name; do
  found=0
  for dir in skills/*/"$name"/; do
    [ -f "${dir}SKILL.md" ] && found=1 && break
  done
  if [ "$found" -eq 0 ]; then
    echo "router references nonexistent skill: $name"; MISSING=$((MISSING+1))
  fi
done < <(grep -oE '\b(skill-router|quality-pipeline|memory|graph-knowledge|design-direction|anti-slop|design-review|frontend-standards|component-quality|api-standards|data-safety|research-intelligence|competitor-analysis|secure-coding|secrets-hygiene|functional-qa|visual-qa|technical-seo|geo|image-generation|video-generation|r3f-scenes|exploded-views|growth-analysis|lead-research|production-readiness|deployment-gates)\b' "$ROUTER" | sort -u)
[ "$MISSING" -eq 0 ] || exit 1

# Discovery: after install.sh, every authored skill is linked
bash scripts/install.sh >/dev/null 2>&1
for dir in skills/*/*/; do
  [ -f "${dir}SKILL.md" ] || continue
  name="$(basename "$dir")"
  [ -L ".claude/skills/$name" ] || { echo "skill not linked by install.sh: $name"; exit 1; }
done
exit 0
