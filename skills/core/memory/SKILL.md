---
name: memory
description: Conventions for persistent memory (claude-mem) - what to record, what never to record, and how to phrase memories so they stay useful. Use when recording decisions/lessons or recalling project history.
---

# Memory (claude-mem conventions)

Claude OS uses **claude-mem** as the persistent memory layer (installation:
`integrations/claude-mem/README.md`). Memory is *historical*: decisions,
lessons, preferences, mistakes, project history. Structural code knowledge
belongs to the knowledge graph (`skills/core/graph-knowledge/`) — do not
duplicate it into memory.

## Record (worth remembering next month)

- **Decisions** with rationale: "Chose SSG for the marketing site because
  content changes weekly and TTFB budget is 800ms."
- **Lessons**: cause → effect → prevention. Specific, reusable.
- **Recurring preferences** of the human: stack tastes, tone, review
  style, risk tolerance — as observed, not assumed.
- **Mistakes** and their prevention notes.
- **Project milestones**: what shipped, when, key constraints.
- **Discoveries**: gotchas in tools/APIs that cost real time.

## Never record

- Secrets, credentials, tokens, connection strings — under any phrasing.
- Personal data beyond what identifies the working context.
- Transient state (current bug, today's todo) — that's the task ledger.
- Anything you'd be uncomfortable seeing injected into a future session's
  context verbatim.

## Phrasing rules

- One memory = one fact/decision/lesson. Composite memories rot.
- Include the *why*; a decision without rationale can't be safely revisited.
- Date-sensitive facts carry their date ("as of 2026-08").
- Supersede, don't contradict: when reality changes, update the memory and
  note what it replaces.

## Recall discipline

- At task start: recall relevant project + global memories before
  re-deriving old decisions (the session hook reminds you).
- Treat recalled memories as evidence with a date, not eternal truth —
  verify against the current repo when it matters.

## If claude-mem is not installed

Degrade gracefully: keep a `MEMORY.md` in the project (same rules), and
flag the missing integration in doctor output. Do not silently lose
lessons.
