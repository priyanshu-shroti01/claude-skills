---
description: Run the Claude OS health check and triage failures
allowed-tools: Bash(scripts/doctor.sh:*), Read
---

Run `scripts/doctor.sh` from the repository root. Summarize the PASS/WARN/
FAIL report for the user. For each FAIL, give the exact remediation command
or doc link (docs/installation/bootstrap.md). Do not attempt remediation
yourself unless the user asks — doctor diagnoses, the human decides.
