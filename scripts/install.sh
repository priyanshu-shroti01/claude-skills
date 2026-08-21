#!/usr/bin/env bash
# Claude OS — repo-local installation: link skills into .claude/skills,
# make hooks/scripts executable, assemble .mcp.json from required templates.
# Idempotent. Called by bootstrap.sh; safe to run standalone.
#
# Usage: scripts/install.sh [--force-mcp]
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

FORCE_MCP=0
[ "${1:-}" = "--force-mcp" ] && FORCE_MCP=1

note "Claude OS install — linking skills, hooks, MCP config"

# ── 1. Executable bits ──────────────────────────────────────────────
chmod +x scripts/*.sh .claude/hooks/*.sh tests/*.sh tests/*/*.sh 2>/dev/null
info "executable bits set on scripts, hooks, tests"

# ── 2. Link skills: skills/<cat>/<name> -> .claude/skills/<name> ────
mkdir -p .claude/skills
linked=0
for skill_dir in skills/*/*/; do
  [ -f "${skill_dir}SKILL.md" ] || continue
  name="$(basename "$skill_dir")"
  target=".claude/skills/$name"
  rel="../../${skill_dir%/}"
  if [ -L "$target" ]; then
    current="$(readlink "$target")"
    if [ "$current" = "$rel" ]; then
      continue
    fi
    rm "$target"
  elif [ -e "$target" ]; then
    echo "WARN: $target exists and is not a symlink — skipping (author skills in skills/, not here)" >&2
    continue
  fi
  ln -s "$rel" "$target"
  linked=$((linked+1))
done
total="$(find .claude/skills -maxdepth 1 -type l | wc -l | tr -d ' ')"
info "skills linked: $total total ($linked new/updated)"

# Prune dangling links (skill removed/renamed upstream)
pruned=0
for link in .claude/skills/*; do
  [ -L "$link" ] || continue
  if [ ! -e "$link" ]; then
    rm "$link"; pruned=$((pruned+1))
  fi
done
[ "$pruned" -gt 0 ] && info "pruned $pruned dangling skill links"

# ── 3. Assemble .mcp.json from required templates ───────────────────
if [ -f ".mcp.json" ] && [ "$FORCE_MCP" -eq 0 ]; then
  info ".mcp.json exists — leaving as-is (use --force-mcp to regenerate)"
else
  if have python3; then
    python3 - <<'PYEOF'
import json, glob
merged = {"mcpServers": {}}
required = ["config/mcp/playwright.json", "config/mcp/shadcn.json"]
for path in required:
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
    merged["mcpServers"].update(data.get("mcpServers", {}))
with open(".mcp.json", "w", encoding="utf-8") as f:
    json.dump(merged, f, indent=2)
    f.write("\n")
print(f"· .mcp.json written with servers: {', '.join(merged['mcpServers'])}")
PYEOF
  else
    echo "WARN: python3 missing — copy config/mcp/*.json into .mcp.json manually" >&2
  fi
fi

note "install complete"
