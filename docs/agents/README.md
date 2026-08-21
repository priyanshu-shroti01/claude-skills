# Agents Guide

The full roster + hierarchy: root `AGENTS.md`. Per-agent depth:
`agents/<name>/README.md` (charter) and `.claude/agents/<name>.md`
(operational definition Claude Code loads).

## How delegation works

1. The **commander** owns the task ledger and delegates with briefs:
   goal, constraints, relevant files, expected output, applicable gates,
   permission level granted.
2. The **skill-router** decides the capability set first — agents aren't
   summoned by habit.
3. Specialists execute inside their charter; anything out of scope goes
   back to the commander, never silently absorbed.
4. Review agents (code-reviewer, security-agent, qa/visual-qa,
   anti-slop) are read-only on the artifact and report findings;
   implementers fix; reviewers re-verify.

## Reading a charter

Every charter has the same skeleton: **Mission** (the one-line contract),
**Permission ceiling** (L0–L5, see `.claude/rules/permission-rules.md`),
**Method/Protocol** (how it actually works), **Works with** (handoffs),
**Forbidden** (bright lines). The Forbidden section is the part to trust
under pressure.

## Invariants (enforced by charters + tests)

- No agent approves its own work — ever.
- Reviewers never patch what they review.
- L4/L5 (staging/production) execute only on explicit, per-action human
  approval — production-agent prepares, humans authorize.
- The sensitive-action list (`config/permissions/approval-required.yaml`)
  overrides everything, at any level.

## Adding an agent

1. Charter: `agents/<name>/README.md` (use an existing one as skeleton).
2. Definition: `.claude/agents/<name>.md` (frontmatter `name`,
   `description`, optional `tools`; first instruction = read the charter).
3. Register: `SYSTEM_MANIFEST.yaml` agents list,
   `config/agents/agent-manifest.yaml`, ceiling in
   `config/permissions/permission-levels.yaml`, row in `AGENTS.md`.
4. `scripts/verify.sh --section agents` must pass (tests run it).
