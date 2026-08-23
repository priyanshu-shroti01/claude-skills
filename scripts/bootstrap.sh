#!/usr/bin/env bash
# Claude OS — bootstrap a machine from this repository.
# Idempotent: running twice never destroys anything.
#
# Usage: scripts/bootstrap.sh [--dry-run] [--with-optional] [--with-browsers] [--skip-external]
#   --dry-run        detect + report, install nothing
#   --with-optional  also install optional external deps (lighthouse etc. are required)
#   --with-browsers  run `npx playwright install chromium` (large download)
#   --skip-external  skip all network installs (repo-local setup only)
set -u
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
. "$SCRIPT_DIR/lib/common.sh"
ROOT="$(claude_os_root)" || exit 1
cd "$ROOT" || exit 1

DRY=0; WITH_OPTIONAL=0; WITH_BROWSERS=0; SKIP_EXTERNAL=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY=1 ;;
    --with-optional) WITH_OPTIONAL=1 ;;
    --with-browsers) WITH_BROWSERS=1 ;;
    --skip-external) SKIP_EXTERNAL=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

run() {
  if [ "$DRY" -eq 1 ]; then
    info "[dry-run] would run: $*"
  else
    info "run: $*"
    "$@"
  fi
}

note "Claude OS bootstrap $( [ "$DRY" -eq 1 ] && echo '(dry run)' )"
echo

# ── 1-4. Detection ──────────────────────────────────────────────────
OS="$(detect_os)"
case "$OS" in
  linux|macos) pass "OS: $OS (supported)" ;;
  *) fail "OS: $(uname -s) — unsupported (Windows: use WSL2, see docs/installation/bootstrap.md)"; report_summary "bootstrap"; exit 1 ;;
esac

if have node && version_ge "$(node_version)" "20.0.0"; then
  pass "node $(node_version) (>= 20 required)"
else
  fail "node >= 20 required — install via your package manager or https://nodejs.org"
fi

if have python3 && version_ge "$(python_version)" "3.10.0"; then
  pass "python3 $(python_version) (>= 3.10 required)"
else
  fail "python3 >= 3.10 required"
fi

if have git && version_ge "$(git_version)" "2.30.0"; then
  pass "git $(git_version)"
else
  fail "git >= 2.30 required"
fi

PKG_MANAGERS=""
for pm in npm pnpm yarn pip3 brew apt-get dnf; do
  have "$pm" && PKG_MANAGERS="$PKG_MANAGERS $pm"
done
info "package managers detected:${PKG_MANAGERS:- none}"

if have claude; then
  pass "claude CLI: $(claude --version 2>/dev/null | head -1)"
else
  warn "claude CLI not found — install: npm install -g @anthropic-ai/claude-code"
fi

if [ "$N_FAIL" -gt 0 ]; then
  report_summary "bootstrap (preflight failed — fix the FAILs above and re-run)"
  exit 1
fi

# ── 5. State dirs ───────────────────────────────────────────────────
if [ "$DRY" -eq 0 ]; then
  ensure_state_dirs
fi
pass "state dirs: $CLAUDE_OS_HOME/{state,logs,locks,vendor}"

# ── 6-8. Repo-local install (skills, hooks, MCP) ────────────────────
run bash scripts/install.sh

# ── 9. .env scaffold ────────────────────────────────────────────────
if [ -f ".env" ]; then
  pass ".env exists (never committed — verify against .env.example for new vars)"
else
  run cp .env.example .env
  warn ".env created from template — fill in only what you need"
fi

# ── 10-11. External dependencies (per config/skills/external-skills.yaml)
if [ "$SKIP_EXTERNAL" -eq 1 ]; then
  warn "external installs skipped (--skip-external)"
else
  # claude-mem (required)
  if have claude-mem || [ -d "$HOME/.claude-mem" ]; then
    pass "claude-mem present"
  else
    run npx -y claude-mem@13.15.3 install || warn "claude-mem install failed — see integrations/claude-mem/README.md"
  fi
  # graphify (required)
  if have graphify; then
    pass "graphify present"
  else
    run python3 -m pip install --user 'graphifyy==0.9.48' || warn "graphify pip install failed — see integrations/graphify/README.md"
    if [ "$DRY" -eq 0 ] && have graphify; then
      run graphify install || warn "graphify skill registration failed"
    fi
  fi
  # lighthouse (required)
  if have lighthouse; then
    pass "lighthouse present ($(lighthouse --version 2>/dev/null))"
  else
    run npm install -g lighthouse@13.4.1 || warn "lighthouse install failed"
  fi
  # playwright browsers (opt-in: large)
  if [ "$WITH_BROWSERS" -eq 1 ]; then
    run npx -y playwright install chromium || warn "playwright browser install failed"
  else
    info "playwright browsers: skipped (pass --with-browsers to install chromium)"
  fi
  # plugin-marketplace installs are interactive inside Claude Code:
  echo
  note "Run these inside a Claude Code session (plugin installs are interactive):"
  echo "  /plugin install superpowers@claude-plugins-official"
  echo "  /plugin marketplace add anthropics/skills   → /plugin install example-skills@anthropic-agent-skills"
  echo "  /plugin marketplace add pbakaus/impeccable  → install impeccable"
  echo "  (optional) see config/skills/external-skills.yaml for evaluation-status items"
  echo
  if [ "$WITH_OPTIONAL" -eq 1 ]; then
    info "optional deps are project-scoped (R3F, drei, GSAP…) — installed per project by project-init/templates"
  fi
fi

# ── 12-13. Validate + health check ──────────────────────────────────
if [ "$DRY" -eq 1 ]; then
  info "[dry-run] would run: scripts/verify.sh && scripts/doctor.sh"
else
  if bash scripts/verify.sh >/dev/null 2>&1; then
    pass "repository self-validation (scripts/verify.sh)"
  else
    warn "verify.sh reported issues — run it directly for details"
  fi
  bash scripts/doctor.sh || true
fi

# ── 14. Next steps ──────────────────────────────────────────────────
echo
note "Next steps"
cat <<'EOF'
  1. Fill .env with the credentials you actually need (never commit it).
  2. Run the interactive /plugin installs listed above inside Claude Code.
  3. scripts/doctor.sh          — verify health any time
  4. scripts/project-init.sh <dir> — initialize a project with Claude OS
  5. Open Claude Code in this repo: CLAUDE.md takes over from there.
EOF
report_summary "bootstrap"
