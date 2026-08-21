# Reference: ADR Template

Significant architectural decisions get an ADR (CLAUDE.md prime directive
9). Copy this into `docs/architecture/decisions/NNNN-<slug>.md` (this
repo) or the project's `docs/decisions/`.

```markdown
# NNNN. <Decision title>

Date: YYYY-MM-DD
Status: proposed | accepted | superseded by NNNN
Deciders: <agents/humans involved>

## Context

What forces are at play — requirements, constraints, existing
conventions, measurements. Enough that a future reader understands why
this needed deciding.

## Options considered

1. <Option> — pros / cons (one line each)
2. <Option> — pros / cons
(2–4 options; a decision with one option is a description, not a decision)

## Decision

What we chose, stated plainly.

## Consequences

- What becomes easier
- What becomes harder / what we're accepting
- What would trigger revisiting (falsifiable condition)
```

Rules: one decision per ADR · never edit an accepted ADR's decision —
supersede it · link the ADR from the change that implements it.
