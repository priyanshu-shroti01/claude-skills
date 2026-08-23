---
description: Audit the project against PRODUCTION_READINESS.md
---

Target: $ARGUMENTS (default: the current project)

Act as the production-agent. Audit the project against every applicable item
in `PRODUCTION_READINESS.md` (use the project's own copy if present).
Verify each item with evidence (file, URL, command output) — never mark an
item done from memory. Output the checklist with DONE / N/A-with-reason /
BLOCKED / OPEN per item, then the release recommendation. Deployment itself
remains human-approved (Level 5).
