# 0001. Two-layer agents, linked skills, manifest as cross-check hub

Date: 2026-08-21
Status: accepted
Deciders: founding build (human brief + architect session)

## Context

Claude Code loads `.claude/agents/*.md` fully into a subagent's system
prompt and discovers skills from `.claude/skills/`. The brief demands 29
rich agent charters and a categorized skill library — but loading
everything eagerly would bloat every context, and duplicating content
across `.claude/` and the human-readable trees would drift.

## Options considered

1. Single-layer agents (everything in `.claude/agents/`) — simple, but
   full charters load on every delegation and the roster becomes
   unreviewable as documentation.
2. Two-layer (lean definition + charter read on demand) — small always-
   loaded surface, depth on request; risk: agents skipping the charter
   read (mitigated: the definition's first instruction is the read).
3. Skills duplicated into `.claude/skills/` — discovery works out of the
   box; certain drift between copies.
4. Skills authored in `skills/`, symlinked into `.claude/skills/` by
   install — single source of truth; risk: Windows symlinks (accepted:
   Windows is WSL2-only per manifest).

## Decision

Two-layer agents (option 2) + linked skills (option 4), with
`SYSTEM_MANIFEST.yaml` naming every agent/skill/workflow and
`scripts/verify.sh` failing on any divergence between manifest, files,
frontmatter, ceilings, and the dependency registry.

## Consequences

- Easier: small contexts, reviewable documentation, drift caught
  mechanically (tests run the verifier).
- Harder: contributors must touch two places for a new agent (definition
  + charter) and re-run install after authoring a skill — verify.sh and
  doctor make forgetting loud.
- Revisit if: Claude Code gains native progressive-disclosure for agent
  definitions, or native skill source-dirs (would obsolete the links).
