#!/usr/bin/env bash
# Claude OS — initialize a project to run on Claude OS.
# Idempotent: never overwrites existing project files (writes .claude-os-new
# variants beside them instead).
#
# Usage: scripts/project-init.sh /path/to/project
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  echo "usage: scripts/project-init.sh /path/to/project" >&2
  exit 2
fi
mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"
if [ "$TARGET" = "$ROOT" ]; then
  echo "refusing to project-init the Claude OS repo itself" >&2
  exit 2
fi

PROJECT_NAME="$(basename "$TARGET")"
DATE="$(date -u +%Y-%m-%d)"
OS_VERSION="$(head -1 "$ROOT/VERSION" | tr -d '[:space:]')"

note "Claude OS project-init: $PROJECT_NAME ($TARGET)"
cd "$TARGET" || exit 1

# ── Inspect the project ─────────────────────────────────────────────
STACK="unknown"; PKG_MGR="unknown"; TEST_CMD="unknown"; BUILD_CMD="unknown"; DEV_CMD="unknown"
if [ -f package.json ]; then
  PKG_MGR="npm"; [ -f pnpm-lock.yaml ] && PKG_MGR="pnpm"; [ -f yarn.lock ] && PKG_MGR="yarn"
  if have python3; then
    STACK="$(python3 - <<'PYEOF'
import json
try:
    pkg = json.load(open("package.json"))
except Exception:
    print("node"); raise SystemExit
deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}
if "next" in deps: print("nextjs")
elif "react" in deps and "vite" in deps: print("react-vite")
elif "react" in deps: print("react")
elif "express" in deps or "fastify" in deps or "hono" in deps: print("node-backend")
else: print("node")
PYEOF
)"
    for s in test build dev start; do
      CMD="$(python3 -c "import json;print(json.load(open('package.json')).get('scripts',{}).get('$s',''))" 2>/dev/null)"
      [ -n "$CMD" ] && case "$s" in
        test) TEST_CMD="$PKG_MGR run test" ;;
        build) BUILD_CMD="$PKG_MGR run build" ;;
        dev) DEV_CMD="$PKG_MGR run dev" ;;
        start) [ "$DEV_CMD" = "unknown" ] && DEV_CMD="$PKG_MGR run start" ;;
      esac
    done
  fi
elif [ -f pyproject.toml ] || [ -f requirements.txt ]; then
  STACK="python"; PKG_MGR="pip"
fi
GIT_STATE="none"
[ -d .git ] && GIT_STATE="repo"
info "detected: stack=$STACK pkg=$PKG_MGR git=$GIT_STATE"

# ── Helper: install a file without clobbering ───────────────────────
install_file() {  # install_file <content-cmd...> -- <dest>
  local dest="${*: -1}"
  local tmp; tmp="$(mktemp)"
  "${@:1:$#-2}" > "$tmp"
  if [ -f "$dest" ]; then
    if cmp -s "$tmp" "$dest"; then
      info "$dest unchanged"
      rm -f "$tmp"; return 0
    fi
    warn "$dest exists with different content — writing ${dest}.claude-os-new for manual merge"
    dest="${dest}.claude-os-new"
  fi
  mv "$tmp" "$dest"
  pass "wrote $dest"
}

render_template() {  # render_template <template-path>
  sed -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
      -e "s|{{PROJECT_DESCRIPTION}}|TODO — one paragraph|g" \
      -e "s|{{PROJECT_STACK}}|$STACK|g" \
      -e "s|{{CLAUDE_OS_PATH}}|$ROOT|g" \
      -e "s|{{CLAUDE_OS_VERSION}}|$OS_VERSION|g" \
      -e "s|{{PACKAGE_MANAGER}}|$PKG_MGR|g" \
      -e "s|{{TEST_COMMAND}}|$TEST_CMD|g" \
      -e "s|{{BUILD_COMMAND}}|$BUILD_CMD|g" \
      -e "s|{{DEV_COMMAND}}|$DEV_CMD|g" \
      -e "s|{{DATE}}|$DATE|g" \
      "$1"
}

# ── Core docs ───────────────────────────────────────────────────────
install_file render_template "$ROOT/templates/project/CLAUDE.md.template" -- "CLAUDE.md"
install_file render_template "$ROOT/templates/project/DESIGN.md.template" -- "DESIGN.md"
install_file cat "$ROOT/PRODUCTION_READINESS.md" -- "PRODUCTION_READINESS.md"

# ── .claude configuration ───────────────────────────────────────────
mkdir -p .claude/hooks .claude/skills
if [ ! -f .claude/settings.json ]; then
  cp "$ROOT/.claude/settings.json" .claude/settings.json
  pass "wrote .claude/settings.json (hooks + permission baseline)"
else
  info ".claude/settings.json exists — left as-is"
fi
for h in pre-tool-guard.sh session-start.sh; do
  if [ ! -f ".claude/hooks/$h" ]; then
    cp "$ROOT/.claude/hooks/$h" ".claude/hooks/$h"
    chmod +x ".claude/hooks/$h"
    pass "installed hook: $h"
  fi
done

# ── Relevant skills (routing by detected stack) ─────────────────────
link_skill() {
  local path="$1" name; name="$(basename "$path")"
  [ -e ".claude/skills/$name" ] && return 0
  ln -s "$ROOT/skills/$path" ".claude/skills/$name" 2>/dev/null && info "linked skill: $name"
}
# Core always
for s in core/skill-router core/quality-pipeline core/memory core/graph-knowledge \
         security/secure-coding security/secrets-hygiene qa/functional-qa; do
  link_skill "$s"
done
case "$STACK" in
  nextjs|react*|node)
    for s in design/design-direction design/anti-slop design/design-review \
             frontend/frontend-standards frontend/component-quality qa/visual-qa \
             seo/technical-seo seo/geo production/production-readiness \
             production/deployment-gates; do link_skill "$s"; done ;;
  node-backend|python)
    for s in backend/api-standards backend/data-safety \
             production/deployment-gates; do link_skill "$s"; done ;;
  *)
    info "unknown stack — core skills only; run the skill-router for more" ;;
esac
pass "skills linked: $(find .claude/skills -maxdepth 1 -type l | wc -l | tr -d ' ')"

# ── MCP config ──────────────────────────────────────────────────────
if [ ! -f .mcp.json ] && have python3; then
  python3 - "$ROOT" <<'PYEOF'
import json, sys
root = sys.argv[1]
merged = {"mcpServers": {}}
for name in ("playwright", "shadcn"):
    with open(f"{root}/config/mcp/{name}.json", encoding="utf-8") as f:
        merged["mcpServers"].update(json.load(f).get("mcpServers", {}))
with open(".mcp.json", "w", encoding="utf-8") as f:
    json.dump(merged, f, indent=2); f.write("\n")
PYEOF
  pass "wrote .mcp.json (playwright, shadcn)"
fi

# ── .gitignore safety net ───────────────────────────────────────────
if [ -f .gitignore ]; then
  grep -q '^\.env$' .gitignore 2>/dev/null || { printf '\n# Claude OS\n.env\n.env.*\n!.env.example\n' >> .gitignore; pass "appended .env rules to .gitignore"; }
else
  printf '.env\n.env.*\n!.env.example\nnode_modules/\ndist/\n.next/\n' > .gitignore
  pass "wrote .gitignore"
fi

# ── Knowledge graph ─────────────────────────────────────────────────
if have graphify; then
  info "generating knowledge graph (graphify)…"
  if graphify . >/dev/null 2>&1 || graphify build >/dev/null 2>&1; then
    pass "graph generated — write GRAPH_REPORT.md per skills/core/graph-knowledge"
  else
    warn "graphify present but generation failed — run manually, see integrations/graphify"
  fi
else
  warn "STATUS: BLOCKED — graphify not installed (bootstrap installs it). ALTERNATIVE: manual GRAPH_REPORT.md per skills/core/graph-knowledge"
fi

# ── Memory ──────────────────────────────────────────────────────────
if have claude-mem || [ -d "$HOME/.claude-mem" ]; then
  pass "claude-mem available — memory conventions per skills/core/memory"
else
  warn "claude-mem not installed — falling back to MEMORY.md convention"
  [ -f MEMORY.md ] || { printf '# %s — Memory (fallback)\n\nclaude-mem not installed; record decisions/lessons here per skills/core/memory rules. No secrets.\n' "$PROJECT_NAME" > MEMORY.md; pass "wrote MEMORY.md (fallback)"; }
fi

# ── Architecture report skeleton ────────────────────────────────────
if [ ! -f PROJECT_REPORT.md ]; then
  cat > PROJECT_REPORT.md <<EOF
# $PROJECT_NAME — Architecture Report

Generated by project-init on $DATE (Claude OS v$OS_VERSION). Expand via
graph-knowledge after the graph exists.

## Detected

- Stack: $STACK · package manager: $PKG_MGR · git: $GIT_STATE
- Test: \`$TEST_CMD\` · build: \`$BUILD_CMD\` · dev: \`$DEV_CMD\`

## Relevant agents (initial routing)

- Always: commander, skill-router, code-reviewer, qa-agent, security-agent
- Stack-routed: $( case "$STACK" in
    nextjs|react*) echo "design-director, ux-designer, visual-designer, frontend-architect, frontend-engineer, visual-qa-agent, seo-agent, accessibility-agent, performance-agent, anti-slop-agent, production-agent" ;;
    node-backend|python) echo "backend-architect, backend-engineer, production-agent" ;;
    *) echo "run the skill-router with a task brief to determine" ;;
  esac )

## Architecture overview

TODO — from graph + inspection (entry points, layers, data flow, auth flow).

## Open questions

TODO
EOF
  pass "wrote PROJECT_REPORT.md"
fi

echo
note "Project initialized. Next:"
cat <<'EOF'
  1. Open the project in Claude Code — CLAUDE.md governs from here.
  2. Fill DESIGN.md via the design-direction skill before UI work.
  3. Start with the workflow that fits (workflows/ in the Claude OS repo).
EOF
report_summary "project-init"
