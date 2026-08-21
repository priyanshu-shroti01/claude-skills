#!/usr/bin/env bash
# Claude OS — shared script helpers. Source, don't execute.

set -o pipefail

# ── Paths ────────────────────────────────────────────────────────────
# Resolve repo root from any script in scripts/ or tests/.
claude_os_root() {
  local src="${BASH_SOURCE[1]:-$0}"
  local dir
  dir="$(cd "$(dirname "$src")" && pwd)"
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/SYSTEM_MANIFEST.yaml" ] && [ -f "$dir/VERSION" ]; then
      printf '%s\n' "$dir"; return 0
    fi
    dir="$(dirname "$dir")"
  done
  echo "ERROR: cannot locate Claude OS repo root" >&2
  return 1
}

CLAUDE_OS_HOME="${CLAUDE_OS_HOME:-$HOME/.claude-os}"

ensure_state_dirs() {
  mkdir -p "$CLAUDE_OS_HOME"/{state,logs,locks,vendor}
}

# ── Output ───────────────────────────────────────────────────────────
if [ -t 1 ]; then
  C_GREEN=$'\033[32m'; C_YELLOW=$'\033[33m'; C_RED=$'\033[31m'
  C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'; C_RESET=$'\033[0m'
else
  C_GREEN=""; C_YELLOW=""; C_RED=""; C_BOLD=""; C_DIM=""; C_RESET=""
fi

info()  { printf '%s\n' "${C_DIM}·${C_RESET} $*"; }
note()  { printf '%s\n' "${C_BOLD}$*${C_RESET}"; }

# Check counters (doctor/verify style)
N_PASS=0; N_WARN=0; N_FAIL=0
pass() { N_PASS=$((N_PASS+1)); printf '%s\n' "${C_GREEN}PASS${C_RESET}  $*"; }
warn() { N_WARN=$((N_WARN+1)); printf '%s\n' "${C_YELLOW}WARN${C_RESET}  $*"; }
fail() { N_FAIL=$((N_FAIL+1)); printf '%s\n' "${C_RED}FAIL${C_RESET}  $*"; }

report_summary() {
  local label="${1:-Report}"
  echo
  note "${label}: ${N_PASS} pass, ${N_WARN} warn, ${N_FAIL} fail"
  [ "$N_FAIL" -eq 0 ]
}

# ── Detection helpers ────────────────────────────────────────────────
detect_os() {
  case "$(uname -s)" in
    Linux*)  echo linux ;;
    Darwin*) echo macos ;;
    *)       echo unsupported ;;
  esac
}

have() { command -v "$1" >/dev/null 2>&1; }

# version_ge <have> <need> — true if have >= need (dotted numerics)
version_ge() {
  [ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -1)" = "$2" ]
}

node_version()   { node --version 2>/dev/null | sed 's/^v//'; }
python_version() { python3 -c 'import sys;print("%d.%d.%d"%sys.version_info[:3])' 2>/dev/null; }
git_version()    { git --version 2>/dev/null | awk '{print $3}'; }

# ── Locking (24/7 operation) ─────────────────────────────────────────
# acquire_lock <name> [stale_minutes] — mkdir-based, stale-aware.
acquire_lock() {
  local name="$1" stale="${2:-180}"
  local lock="$CLAUDE_OS_HOME/locks/$name.lock"
  mkdir -p "$CLAUDE_OS_HOME/locks"
  if mkdir "$lock" 2>/dev/null; then
    printf '%s\n' "$$" > "$lock/pid"
    date -u +%Y-%m-%dT%H:%M:%SZ > "$lock/at"
    return 0
  fi
  # Stale?
  if [ -d "$lock" ] && find "$lock" -maxdepth 0 -mmin +"$stale" | grep -q .; then
    echo "WARN: removing stale lock $name (> ${stale}m old)" >&2
    rm -rf "$lock"
    acquire_lock "$name" "$stale"
    return $?
  fi
  return 1
}

release_lock() {
  local name="$1"
  rm -rf "$CLAUDE_OS_HOME/locks/$name.lock"
}

# ── Logging (24/7 operation) ─────────────────────────────────────────
os_log() {
  local tag="$1"; shift
  mkdir -p "$CLAUDE_OS_HOME/logs"
  printf '%s [%s] %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$tag" "$*" \
    >> "$CLAUDE_OS_HOME/logs/claude-os.log"
}

# ── Retry with backoff ───────────────────────────────────────────────
# retry <attempts> <base_sleep_s> -- cmd...
retry() {
  local attempts="$1" base="$2"; shift 2
  [ "$1" = "--" ] && shift
  local i=1
  while true; do
    if "$@"; then return 0; fi
    if [ "$i" -ge "$attempts" ]; then return 1; fi
    local wait=$(( base * (2 ** (i - 1)) ))
    echo "retry $i/$attempts failed; waiting ${wait}s" >&2
    sleep "$wait"
    i=$((i+1))
  done
}
