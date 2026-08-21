# Claude OS — Architecture Overview

## What this repository is

The versioned, executable definition of an AI software/design agency:
who works (agents), what they know how to do (skills), how work flows
(workflows), what's non-negotiable (rules/gates), and how a machine
becomes ready to run it (scripts). GitHub-first: a fresh machine clones
this repo and bootstraps; no hidden local configuration.

## Layer map

```
┌─────────────────────────────────────────────────────────────┐
│ GOVERNANCE   CLAUDE.md · SECURITY.md · DESIGN.md ·           │
│              PRODUCTION_READINESS.md · SYSTEM_MANIFEST.yaml  │
├─────────────────────────────────────────────────────────────┤
│ ORCHESTRATION   commander → skill-router → specialists       │
│                 workflows/ (15 staged processes with gates)  │
├─────────────────────────────────────────────────────────────┤
│ CAPABILITY   agents/ (29 charters) · skills/ (27 modules) ·  │
│              references/ (quick sheets)                      │
├─────────────────────────────────────────────────────────────┤
│ KNOWLEDGE    claude-mem (historical) · Graphify (structural) │
├─────────────────────────────────────────────────────────────┤
│ ENFORCEMENT  .claude/settings.json + hooks (mechanical) ·    │
│              config/permissions (L0-L5 + approval list) ·    │
│              quality-pipeline gates (procedural)             │
├─────────────────────────────────────────────────────────────┤
│ REPRODUCTION scripts/ (bootstrap·install·doctor·verify·      │
│              project-init·update·sync·status·uninstall) ·    │
│              config/ (mcp·providers·environments·registry) · │
│              tests/ (the OS tests itself)                    │
└─────────────────────────────────────────────────────────────┘
```

## Key design decisions (ADRs in ./decisions/)

1. **Two-layer agents** — lean operational definitions
   (`.claude/agents/`) + extended charters (`agents/`), loaded on demand.
   Keeps context small while keeping depth available (0001).
2. **Skills authored once, linked in** — `skills/` is the source of
   truth; `.claude/skills/` holds generated symlinks. No duplication
   drift (0001).
3. **Manifest as cross-check hub** — `SYSTEM_MANIFEST.yaml` names every
   agent/skill/workflow; `scripts/verify.sh` fails on any divergence
   between manifest, files, ceilings, and registries. Consistency is
   tested, not hoped for.
4. **External deps pinned + vetted, never vendored** — the registry
   (`config/skills/external-skills.yaml`) carries pin/license/security
   fields (test-enforced); installers consume it; nothing runs
   uninspected. CC BY-SA content (OWASP) is linked, never pasted.
5. **Defense in depth for permissions** — charter ceilings (norms) +
   `CLAUDE_OS_MAX_AUTONOMY` (env cap) + settings.json deny/ask lists +
   pre-tool-guard hook (mechanical) + human approval gates (L4/L5 and
   the sensitive list). Any single layer failing still leaves four.
6. **Separation of duties as law** — implementer ≠ reviewer; review
   agents are read-only on the reviewed artifact; no agent approves its
   own work. Encoded in every relevant charter and the pipeline.

## Data flow of a typical build

brief → commander (ledger) → skill-router (capability set) → research →
product/design direction → architecture (ADR) → implementation →
review gates (code/security) → QA gates (functional/visual) → audit
gates (a11y/SEO/perf) → anti-slop loop → production audit → human
approval → deploy → monitor → learn (memory + system improvement PRs).

## Extending the system

New skill: author in `skills/<cat>/<name>/SKILL.md` → add to
SYSTEM_MANIFEST → `scripts/install.sh` → verify + tests. New agent:
both layers + manifest + ceiling entries → verify. New workflow:
`workflows/<name>/WORKFLOW.md` + manifest. New dependency: vetting
protocol → registry + docs/dependencies.md. Rule changes
(security/permissions/gates): human approval required — see
learning-agent charter for the improvement loop.
