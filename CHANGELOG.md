# Changelog

All notable changes to Claude OS are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- External skill `lets-scroll` ([AIwithhassan/lets-scroll](https://github.com/AIwithhassan/lets-scroll),
  MIT, optional) — scroll-scrubbed cinematic "fly through the world" landing
  pages. Registered in `config/skills/external-skills.yaml` and
  `docs/dependencies.md`, referenced from `SYSTEM_MANIFEST.yaml` (`three_d`),
  routable via the skill-router.

### Changed

- Scroll World (oso95/scroll-world) demoted from *optional* to *evaluation* —
  superseded by lets-scroll (same concept, more mature). Overlap ruling
  updated in `docs/architecture/skill-overlap.md`.

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
