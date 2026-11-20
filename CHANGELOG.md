# Changelog

All notable changes to Claude OS are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-11-21

### Added
- **Runtime catalog export.** `scripts/export-runtime-catalog.py` turns the
  first-party skills into one pinned, platform-neutral catalog
  (`dist/runtime-catalog/catalog.json` + `.sha256`, format in
  `schemas/runtime-catalog.schema.json`, contract in
  `docs/architecture/runtime-catalog.md`). Runtime metadata (risk, triggers,
  dependencies) lives in `config/skills/runtime-export.yaml`; `SKILL.md` is
  unchanged. Scripts, hooks, commands and every `external/` skill are never
  exported. Tested by `tests/skills/test_runtime_catalog.sh`.
- Six internal skills (36 → 42) and four categories, for running a company
  rather than only building software:
  - executive: `objective-planning`
  - infrastructure: `linux-server-diagnostics`
  - operations: `incident-response`
  - finance: `finance-review`
  - support: `ticket-triage`
  - security: `security-assessment`
  The skill-router's routing table names them.
- Nine internal skills (27 → 36), and a new `support` category:
  - design: `cinematic-product-design`, `design-system`
  - backend: `whmcs-operations`, `payment-gateways`, `php-module-packaging`
  - security: `webhook-security`
  - growth: `launch-playbook`
  - support: `support-playbook`, `cpanel-whm-guide`
- `external/`: a library of 236 third-party skills (Anthropic, claude-seo,
  Trail of Bits, claude-flow and others) stored for copying into projects.
  Each keeps its upstream licence; not covered by MIT, not in the plugin.
  Indexed in `external/README.md`.
- README hero and section illustrations (`docs/assets/`).

### Changed
- The plugin now lists 42 skills in 17 category directories.

## [0.2.0] - 2026-09-05

Claude OS becomes installable as a plugin, and the external registry grows
from 26 to 32 vetted entries. Every new third-party entry was cloned and
read — LICENSE, tree, and every executable file — not taken from its README.

### Added

- **Plugin packaging.** `.claude-plugin/plugin.json` and
  `.claude-plugin/marketplace.json` — the OS installs with
  `/plugin marketplace add priyanshu-shroti01/claude-skills`, shipping 27
  skills, 29 agents and 8 commands. The marketplace also carries the vetted
  external members, so one `marketplace add` reaches all of them.
  Hooks are deliberately **not** shipped through the plugin: a plugin that
  silently installs a `PreToolUse` hook is what `security-rules.md` forbids.
  They stay behind `scripts/bootstrap.sh`.
- `skills-cli` ([vercel-labs/skills](https://github.com/vercel-labs/skills),
  MIT, required) — the `npx skills` package manager and the `find-skills`
  discovery skill. Registered as **discovery only**: everything it surfaces
  clears SECURITY.md §4 before installation. Its install counts and stars
  are popularity, not an audit.
- `no-ai-slop` ([petergyang/no-ai-slop](https://github.com/petergyang/no-ai-slop),
  MIT, required) — the prose slop gate: 20+ named AI writing patterns with
  edit and detect modes. Closes a real gap; the internal anti-slop skill has
  only ever scored rendered UI.
- `superseo-skills` ([inhouseseo/superseo-skills](https://github.com/inhouseseo/superseo-skills),
  Apache-2.0, optional) — 11 SEO execution skills. Prompt-only, zero
  executables, no API keys, no paid tier (verified by clone).
- `mattpocock-skills` ([mattpocock/skills](https://github.com/mattpocock/skills),
  MIT, optional) — adopted as a **9-of-25 subset**, enforced by the
  marketplace entry's `skills` list.
- `threeui` ([MengTo/threeui](https://github.com/MengTo/threeui), optional) —
  procedural Three.js components and shaders, per-component raw material for
  `r3f-scenes`.
- `awwwards-threejs` (reference-only, required) plus
  `references/design/inspiration-sources.md` — how to use a visual reference
  without copying it.
- `docs/skills/pack.md` — the full pack catalogue and the adoption bar.
- `scripts/install-pack.sh` — prints the install commands per tier; executes
  only unambiguous shell installs, and only with `--run`.

### Changed

- `vercel-agent-skills` registry entry now names all 8 skills and marks
  `deploy-to-vercel` / `vercel-cli-with-tokens` as L4/L5 deployment surface.
- Skill-router routing table gained 7 rows (prose gate, SEO execution,
  engineering extras, 3D raw material, visual reference, skill discovery).
- `skill-overlap.md` gained 7 rulings and an "adopting anything the pack
  surfaces" section. Prose slop vs visual slop is recorded as a **gap, not
  an overlap** — both gates run.
- Scroll World demoted from *optional* to *evaluation* — superseded by
  lets-scroll (same concept, more mature).
- Claude SEO (AgriciDaniel) demoted to *superseded* — superseo-skills covers
  the same gap with a smaller, key-free, executable-free surface.

## [0.1.0] - 2026-08-21

### Added

- Initial Claude OS foundation.
- Repository architecture: agents, skills, workflows, references, integrations,
  scripts, config, templates, tests, docs.
- 29 agent definitions (`.claude/agents/`) with extended charters (`agents/`).
- Custom skill library across 12 categories (`skills/`).
- 15 workflow definitions (`workflows/`).
- Central `SYSTEM_MANIFEST.yaml` with semantic versioning.
- Governance documents: `CLAUDE.md`, `AGENTS.md`, `DESIGN.md`, `SECURITY.md`,
  `PRODUCTION_READINESS.md`.
- Bootstrap, doctor, install, update, sync, verify, status, project-init and
  uninstall scripts (`scripts/`).
- Permission model (levels 0–5) with approval-gated sensitive actions.
- MCP configuration templates (`config/mcp/`) — env-var placeholders only.
- Media provider abstraction (`config/providers/`).
- External dependency registry with license + security audit
  (`config/skills/external-skills.yaml`, `docs/dependencies.md`).
- Skill overlap analysis (`docs/architecture/skill-overlap.md`).
- Self-tests for the OS itself (`tests/`).
