# Workflow: Bug Fix

**Trigger**: a defect report. **Orchestrator**: commander (or the routed
engineer directly for small, clear defects — gates still apply).

## Stages

1. **Reproduce first** — qa-agent (or the engineer): reproduce the bug in
   the running system; capture exact steps + evidence. Can't reproduce →
   gather environment details, don't guess-fix. *Gate: written repro.*
2. **Root-cause** — the routed engineer: trace to the actual cause
   (knowledge graph for impact/dependency context). Fixing the symptom
   without naming the cause is not a fix. Security-relevant cause →
   security-agent immediately.
3. **Regression test** — write the test that fails because of the bug,
   before the fix. It proves the diagnosis and guards the future.
4. **Fix minimally** — smallest change that removes the cause; refactors
   ride separate branches. Data-touching fixes follow data-safety rules
   (backups, approval for anything destructive).
5. **Verify** — regression test green + the original repro steps re-run
   clean + the surrounding behavior spot-checked (blast radius from the
   graph). UI bugs additionally get a scoped visual-qa pass.
6. **Review** — code-reviewer (always; a bug means the last review missed
   something — say what). Security-agent if the fix touches its domains.
7. **Ship** — per the project's release path; production hotfixes go
   through deployment-gates (yes, including approval — urgency is not
   authorization).
8. **Learn** — recurring-class bugs get a learning-agent note: cause
   pattern → prevention (new checklist item, lint rule, test pattern).

## Rules

- No fix without a repro; no merge without the regression test.
- Severity honesty: a production data-integrity bug outranks everything
  and goes to the human immediately.
