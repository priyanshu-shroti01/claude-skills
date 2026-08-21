#!/usr/bin/env bash
# project-init.sh: initializes the fixture project; idempotent on re-run.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SANDBOX="$ROOT/tests/.sandbox/project-init"
rm -rf "$SANDBOX"; mkdir -p "$SANDBOX"
cp -r "$ROOT/tests/fixtures/sample-project" "$SANDBOX/proj"

bash "$ROOT/scripts/project-init.sh" "$SANDBOX/proj" > "$SANDBOX/out.log" 2>&1 || {
  echo "project-init failed:"; cat "$SANDBOX/out.log"; exit 1; }

for f in CLAUDE.md DESIGN.md PRODUCTION_READINESS.md PROJECT_REPORT.md \
         .claude/settings.json .claude/hooks/pre-tool-guard.sh .mcp.json .gitignore; do
  [ -e "$SANDBOX/proj/$f" ] || { echo "missing after init: $f"; exit 1; }
done
[ -x "$SANDBOX/proj/.claude/hooks/pre-tool-guard.sh" ] || { echo "hook not executable"; exit 1; }
# Stack detection (fixture is react+vite)
grep -q "react-vite" "$SANDBOX/proj/PROJECT_REPORT.md" || { echo "stack not detected"; exit 1; }
# Skills linked
LINKS="$(find "$SANDBOX/proj/.claude/skills" -maxdepth 1 -type l | wc -l | tr -d ' ')"
[ "$LINKS" -ge 7 ] || { echo "expected >=7 linked skills, got $LINKS"; exit 1; }
# .env safety in gitignore
grep -q '^\.env$' "$SANDBOX/proj/.gitignore" || { echo ".gitignore missing .env"; exit 1; }
# Refuses to init the OS repo itself
if bash "$ROOT/scripts/project-init.sh" "$ROOT" >/dev/null 2>&1; then
  echo "should refuse to init the Claude OS repo"; exit 1
fi

# Idempotency: second run leaves no .claude-os-new clutter for identical content
bash "$ROOT/scripts/project-init.sh" "$SANDBOX/proj" > "$SANDBOX/out2.log" 2>&1 || {
  echo "second run failed"; cat "$SANDBOX/out2.log"; exit 1; }
NEW="$(find "$SANDBOX/proj" -name '*.claude-os-new' | wc -l | tr -d ' ')"
[ "$NEW" -eq 0 ] || { echo "second run produced $NEW .claude-os-new files (not idempotent)"; exit 1; }
exit 0
