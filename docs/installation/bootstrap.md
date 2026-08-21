# Installation & Bootstrap

Take a fresh machine to a working Claude OS. Everything here is executed
by `scripts/bootstrap.sh`; this page explains what it does and the manual
steps it cannot do for you.

## Requirements

| Requirement | Minimum | Check |
|---|---|---|
| OS | Linux or macOS (Windows: **WSL2** — native PowerShell isn't supported yet; the scripts are bash) | `uname -s` |
| Node | 20 (22 recommended) | `node -v` |
| Python | 3.10 (+ pyyaml for verify) | `python3 -V` |
| Git | 2.30 | `git --version` |
| Claude Code | 2.x | `claude --version` |

## Fresh machine, start to finish

```bash
# 1. Clone the OS
git clone https://github.com/priyanshu-shroti01/claude-skills.git claude-os
cd claude-os

# 2. Bootstrap (idempotent — safe to re-run any time)
scripts/bootstrap.sh                # add --with-browsers for chromium
                                    # add --dry-run to preview only

# 3. Interactive plugin installs (inside a Claude Code session — the
#    /plugin flow is interactive and can't be scripted):
#    /plugin install superpowers@claude-plugins-official
#    /plugin marketplace add anthropics/skills → install example-skills
#    /plugin marketplace add pbakaus/impeccable → install impeccable

# 4. Credentials you actually need (never committed)
cp .env.example .env   # bootstrap does this if missing; fill selectively

# 5. Health check
scripts/doctor.sh
```

## What bootstrap does (steps 1–14)

detect OS → check node/python/git versions → detect package managers →
check claude CLI → create `~/.claude-os/{state,logs,locks,vendor}` →
run `install.sh` (skill links, hook exec bits, `.mcp.json` assembly) →
scaffold `.env` → install pinned external deps (claude-mem 13.15.3 via
npx, Graphify via pip `graphifyy==0.9.48`, Lighthouse 13.4.1) → print
the interactive plugin commands → run `verify.sh` → run `doctor.sh` →
print next steps. Every step checks before acting; **running it twice
changes nothing the second time.**

## Flags

`--dry-run` (report only) · `--with-optional` (note: R3F/GSAP-class deps
are per-project, installed by templates) · `--with-browsers` (chromium
download) · `--skip-external` (repo-local setup only, no network).

## After bootstrap

- `scripts/status.sh` — dashboard · `scripts/doctor.sh` — health
- `scripts/project-init.sh <dir>` — put a project on the OS
- `scripts/update.sh` — pull + relink + health · `scripts/sync.sh` — drift
- `scripts/uninstall.sh` — remove machine-local pieces

## Troubleshooting

| Symptom | Fix |
|---|---|
| doctor FAIL node/python/git | install/upgrade via your package manager; re-run bootstrap |
| WARN skills not linked | `scripts/install.sh` |
| WARN claude-mem/graphify missing | re-run `scripts/bootstrap.sh` (network needed); their integration READMEs have manual steps |
| `/mcp` shows nothing | `.mcp.json` missing → `scripts/install.sh`; restart Claude Code |
| pyyaml missing | `python3 -m pip install --user pyyaml` |
| hook blocks something legitimate | that's the point — do it yourself or adjust `.claude/hooks/pre-tool-guard.sh` via a reviewed, human-approved change |

## What cannot be verified from a dev container

Plugin installs (`/plugin` is interactive), provider credentials, staging/
production deploy hooks, and Figma OAuth are machine/human-specific: the
scripts and templates for them are tested; their live use is verified by
doctor on YOUR machine after you provide access.
