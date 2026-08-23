---
name: graph-knowledge
description: Using the codebase knowledge graph (Graphify) for architecture discovery, dependency relationships, data/auth flow, and impact analysis. Use when exploring unfamiliar code, planning structural changes, or assessing blast radius.
---

# Graph Knowledge (Graphify conventions)

Claude OS uses **Graphify** as the structural project-knowledge layer
(installation: `integrations/graphify/README.md`). The graph answers
*structural* questions about code as it is now. Historical context
(why decisions were made) lives in memory — do not confuse the two.

## Lifecycle

1. **After project init** (`scripts/project-init.sh`): generate the graph,
   write `GRAPH_REPORT.md` (see below).
2. **Before structural work**: query the graph instead of grepping blind.
3. **After major structural changes**: regenerate; refresh GRAPH_REPORT.md.
4. **During review/audit**: use impact queries to scope blast radius.

## GRAPH_REPORT.md (project artifact)

- Architecture overview: modules/layers and their dependency directions.
- Entry points: routes/handlers/jobs and what they reach.
- Data flow: where data enters, is validated, stored, leaves.
- Auth flow: where identity is established and where it's enforced.
- Hotspots: most-depended-upon nodes (change carefully), cycles,
  orphans.
- Useful queries: the 5–10 graph queries this project's agents will
  actually reuse, with their purpose.

## Standard queries agents should reach for

- "What depends on X?" — before changing X (impact analysis).
- "What does X depend on?" — before extracting/reusing X.
- "Path from route R to table T" — data-flow tracing.
- "Where is <auth middleware> applied — and where not?" — auth audit.
- "What changed structurally since <ref>?" — post-refactor verification.

## Rules

- Unfamiliar repository? Graph first, then read code — reading without a
  map wastes context on the wrong files.
- The graph is generated locally and is *derived state*: never commit it;
  regenerate rather than hand-edit; treat staleness as a doctor WARN.
- Never feed secrets/config values into graph annotations.

## If Graphify is not installed

Degrade gracefully: build a manual GRAPH_REPORT.md from inspection
(slower, same headings), and flag the missing integration in doctor
output.
