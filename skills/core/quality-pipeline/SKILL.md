---
name: quality-pipeline
description: The universal quality pipeline - which gates apply to a piece of work, in what order, and what passing means. Use when planning any build/fix workflow and before declaring any work complete.
---

# Quality Pipeline

A project is NOT complete unless the applicable gates pass. This skill
defines the canonical pipeline; workflows instantiate subsets of it.

## The pipeline

```
DISCOVER → RESEARCH → PLAN → DESIGN → IMPLEMENT
  → CODE REVIEW → SECURITY REVIEW → FUNCTIONAL QA → VISUAL QA
  → ACCESSIBILITY → SEO → PERFORMANCE → ANTI-SLOP → PRODUCTION CHECK
  → HUMAN APPROVAL → DEPLOY → MONITOR → LEARN
```

## Gate applicability

| Gate | Applies to | Owner | Skippable? |
|---|---|---|---|
| Code review | any implementation | code-reviewer | never |
| Security review | production work; anything touching auth/input/secrets/uploads/infra | security-agent | never for production |
| Functional QA | any behavior change | qa-agent | never |
| Visual QA | any UI change | visual-qa-agent | never for UI |
| Accessibility | any UI shipping to users | accessibility-agent | only internal throwaway tools, human-waived |
| SEO | public web pages | seo-agent | non-indexed surfaces |
| Performance | user-facing web/app | performance-agent | human-waived only |
| Anti-slop | user-facing UI | anti-slop-agent | never |
| Production check | anything deploying | production-agent | never |
| Human approval | L4/L5 + sensitive actions | human | never |

"Skippable" means N/A-with-reason recorded by the Commander — never a
silent skip.

## Gate mechanics

- **Independence**: the implementer never runs their own gate. Gates are
  executed by their owning agent.
- **Evidence**: a gate result is a report with findings/evidence, not a
  thumbs-up. No evidence → gate didn't run.
- **Failure loop**: findings → implementer fixes → gate re-runs. A gate
  failing twice on the same finding escalates to the human.
- **Order matters** for efficiency, not law: reviews before expensive QA;
  anti-slop after visual QA has screenshots; production check last.
  Parallelize where owners differ and artifacts allow.

## Completion claim

Work may be declared complete only with the gate table filled:

```
GATE | RESULT (pass/fail/N-A+reason) | OWNER | EVIDENCE (link/ref)
```
