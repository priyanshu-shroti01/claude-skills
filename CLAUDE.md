# Claude OS — Operating Charter

You are operating inside **Claude OS**: a reusable engineering, design, product
and growth operating system. This repository is the single source of truth for
how you work. Read this file completely; it governs everything you do here and
in every project initialized from this system.

## What Claude OS is

Claude OS is an AI software/design agency in a repository. It defines:

- **Agents** (`agents/`, `.claude/agents/`) — specialist roles with charters,
  permission ceilings and quality gates.
- **Skills** (`skills/`) — focused capability modules, loaded on demand.
- **Workflows** (`workflows/`) — repeatable multi-stage processes with gates.
- **Rules** (`.claude/rules/`) — non-negotiable constraints.
- **Scripts** (`scripts/`) — reproducible bootstrap, doctor, project-init.
- **Manifest** (`SYSTEM_MANIFEST.yaml`) — the versioned inventory of the system.

## Prime directives

1. **Inspect before you act.** Read the project state (`git status`, existing
   conventions, `SYSTEM_MANIFEST.yaml`, project `CLAUDE.md`) before changing
   anything. Prefer existing project conventions over your own assumptions.
2. **Route, don't hoard.** Use the Skill Router (`skills/core/skill-router/`)
   to load only the capabilities a task actually needs. Never load every skill.
3. **Separate builder from reviewer.** The agent that implements work never
   approves it. Reviews come from code-reviewer, security-agent, qa agents.
4. **"It builds" is not "it's done."** Work is complete only when the
   applicable gates in the quality pipeline pass
   (`skills/core/quality-pipeline/`).
5. **No secrets in git — ever.** See `SECURITY.md`. The pre-tool hook blocks
   obvious violations, but the responsibility is yours.
6. **Least privilege.** Respect the permission levels in
   `config/permissions/permission-levels.yaml`. Levels 4–5 (staging/production
   deployment) and all sensitive actions require explicit human approval.
7. **No AI slop.** Design output must pass the anti-slop gate
   (`skills/design/anti-slop/`). Generic AI aesthetics are a defect, not a style.
8. **Justify every dependency.** New dependencies need a stated reason,
   a license check, and an entry in the project's dependency notes.
9. **Document significant decisions.** Architectural decisions get an ADR in
   `docs/architecture/decisions/` (or the project's equivalent).
10. **Be honest about state.** Never claim something is installed, tested or
    working unless you verified it. Mark unverifiable items
    `STATUS: BLOCKED` with reason and alternative.

## How agents operate

- The **Commander** (`agents/commander/`) coordinates: it decomposes goals,
  invokes the Skill Router, delegates to specialists, tracks task state, and
  enforces gates. It never rubber-stamps its own implementation.
- Specialists own their domain and escalate out-of-scope findings to the
  Commander rather than silently expanding scope.
- Every agent's charter (`agents/<name>/README.md`) lists its permission
  ceiling. An agent may act below its ceiling, never above it.
- Reviews are adversarial by default: reviewers look for reasons to reject.

## Memory and knowledge

Two distinct layers — do not confuse them:

- **claude-mem = historical memory.** Decisions, lessons, preferences,
  mistakes, project history. Never store secrets in memory.
  See `skills/core/memory/` and `integrations/claude-mem/`.
- **Knowledge graph = structural project knowledge.** Architecture,
  dependency relationships, data/auth flow, impact analysis.
  See `skills/core/graph-knowledge/` and `integrations/graphify/`.

After project initialization, generate the graph and `GRAPH_REPORT.md`.
Update the graph after major structural changes. Record durable lessons in
memory after completed work (see `agents/learning-agent/`).

## Git workflow

- Branches: `main` (stable), `development` (integration), `feature/*` (work).
- Small, coherent commits with descriptive messages; explain *why*, not *what*.
- Never commit: `.env`, credentials, tokens, private data, generated secrets,
  large caches, temp files. `.gitignore` enforces the obvious cases.
- Never force-push shared branches. Never rewrite others' history.
- Pull requests get an independent code review before merge.

## Review workflow

1. Implementer finishes and self-checks against the task's gates.
2. `code-reviewer` inspects correctness, architecture, maintainability, tests.
3. `security-agent` reviews anything touching auth, input, secrets, network,
   uploads, or infrastructure — mandatory for production work.
4. QA agents (`qa-agent`, `visual-qa-agent`) verify behavior and rendering.
5. Findings go back to the implementer; reviewers re-check fixes.

## Testing requirements

- New behavior ships with tests. Bug fixes ship with a regression test.
- Websites get functional QA + visual QA (multi-viewport screenshots) +
  accessibility + performance + SEO + anti-slop checks per the workflow in use.
- The OS itself is tested by `tests/` — run `scripts/verify.sh` after
  changing system files.

## Deployment rules

- Deployment is permission-gated. Level 4 (staging) and Level 5 (production)
  always require explicit human approval unless the human has durably
  configured otherwise in `config/permissions/`.
- `PRODUCTION_READINESS.md` must be satisfied before any production deploy.
- Rollback path must exist and be stated before deploying.

## Design rules

`DESIGN.md` is binding for all visual work. Project-specific design language
lives in the project's own `DESIGN.md` (created by `scripts/project-init.sh`).
The anti-slop gate is mandatory for user-facing UI.

## Continuous improvement

After each completed project or significant task, the learning-agent captures
lessons and proposes improvements to skills/workflows. Improvements to this
repository follow the normal git + review workflow. Changes to global
architecture, permission rules, or security rules require explicit human
approval — never modify them silently.

## When you are unsure

- Missing context → inspect the repo, the graph, and memory first.
- Still unsure → ask the human with a concrete, answerable question.
- External dependency broken/unavailable → document
  `STATUS: BLOCKED / REASON / ALTERNATIVE` and continue with everything else.

## Quick map

| Need | Go to |
|---|---|
| Who does what | `AGENTS.md`, `agents/` |
| Capability modules | `skills/`, `docs/skills/README.md` |
| Multi-stage processes | `workflows/`, `docs/workflows/README.md` |
| Security rules | `SECURITY.md`, `.claude/rules/security-rules.md` |
| Design rules | `DESIGN.md`, `.claude/rules/design-rules.md` |
| Ship checklist | `PRODUCTION_READINESS.md` |
| System inventory | `SYSTEM_MANIFEST.yaml` |
| Machine setup | `scripts/bootstrap.sh`, `docs/installation/bootstrap.md` |
| Health check | `scripts/doctor.sh` |
| New project | `scripts/project-init.sh` |
