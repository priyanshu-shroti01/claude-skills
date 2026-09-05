#!/usr/bin/env bash
# Claude OS — pack installer / printer.
#
# Reads config/skills/external-skills.yaml and prints exactly what to run
# for each tier, grouped by whether it is a shell command or an
# interactive Claude Code /plugin command.
#
# It PRINTS by default and only executes shell installs with --run.
# Plugin-marketplace installs are interactive inside Claude Code and are
# always printed, never executed here.
#
# Usage:
#   scripts/install-pack.sh                 # required tier, print only
#   scripts/install-pack.sh --optional      # include optional tier
#   scripts/install-pack.sh --all           # include evaluation/blocked (as warnings)
#   scripts/install-pack.sh --run           # execute the shell installs
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

TIERS="required"
RUN=0
for arg in "$@"; do
  case "$arg" in
    --optional) TIERS="required optional" ;;
    --all)      TIERS="required optional evaluation blocked" ;;
    --run)      RUN=1 ;;
    -h|--help)  sed -n '2,18p' "$0"; exit 0 ;;
    *)          echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

if ! have python3; then
  echo "FAIL  python3 is required" >&2; exit 1
fi

note "Claude OS pack — tiers: $TIERS"
echo

python3 - "$TIERS" <<'PYEOF'
import sys, yaml

tiers = sys.argv[1].split()
reg = yaml.safe_load(open("config/skills/external-skills.yaml"))["registry"]

shell, plugin, manual = [], [], []
for name, e in sorted(reg.items()):
    if e["status"] not in tiers:
        continue
    cmd = str(e.get("install", "")).strip()
    low = cmd.lower()
    if e["status"] == "blocked":
        manual.append((name, "DO NOT INSTALL — see docs/dependencies.md"))
    elif low.startswith("do not install") or low.startswith("evaluate"):
        manual.append((name, cmd))
    elif low.startswith("reference-only") or low.startswith("per project")     \
         or low.startswith("per component") or low.startswith("per-project")   \
         or low.startswith("config/"):
        # config-file wiring and per-project installs are not runnable here
        manual.append((name, cmd))
    elif cmd.startswith("/plugin") or "/plugin " in cmd:
        plugin.append((name, cmd))
    elif "(" in cmd:
        # prose alternatives inside the field ("… (or copy …)") are not a
        # shell command — print, never exec.
        manual.append((name, cmd))
    else:
        shell.append((name, cmd))

def block(title, items):
    if not items:
        return
    print(f"── {title} " + "─" * max(0, 58 - len(title)))
    for name, cmd in items:
        print(f"  {name}")
        print(f"    {cmd}")
    print()

block("Shell installs", shell)
block("Interactive — run these INSIDE a Claude Code session", plugin)
block("Per-project / reference-only / manual — never auto-run", manual)

print("── One marketplace for the vetted pack " + "─" * 22)
print("  /plugin marketplace add priyanshu-shroti01/claude-skills")
print("  /plugin install claude-os@claude-os")
print("  then: no-ai-slop | superseo | mattpocock-selected | lets-scroll")
print()
print("Before adopting ANYTHING not already registered here: SECURITY.md §4")
print("(canonical source -> licence -> maintenance -> read what executes ->")
print("pin -> record in the registry AND docs/dependencies.md).")
print("Install counts and stars are popularity, not an audit.")

with open(".pack-shell-cmds", "w", encoding="utf-8") as f:
    for _, cmd in shell:
        f.write(cmd + "\n")
PYEOF

if [ "$RUN" -eq 1 ]; then
  echo
  note "--run: executing shell installs only (plugin installs stay manual)"
  while IFS= read -r cmd; do
    [ -z "$cmd" ] && continue
    echo "+ $cmd"
    sh -c "$cmd" || warn "failed: $cmd"
  done < .pack-shell-cmds
fi
rm -f .pack-shell-cmds
