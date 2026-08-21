---
description: Show Claude OS system status (version, skills, agents, MCP, health)
allowed-tools: Bash(scripts/status.sh:*), Read
---

Run `scripts/status.sh` from the repository root and present its output to
the user. If it reports warnings, briefly explain each one and the fix
(usually `scripts/bootstrap.sh` or `scripts/doctor.sh`). Do not re-derive
status by hand — the script is the source of truth.
