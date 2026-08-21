# Security Guide

Policy of record: root `SECURITY.md`. Operational digest agents use
inline: `.claude/rules/security-rules.md`. This page maps the moving
parts.

## The five enforcement layers (defense in depth)

1. **Norms** — SECURITY.md + charter Forbidden sections; the learning
   loop may propose changes but humans approve any weakening.
2. **Ceilings** — L0–L5 per agent
   (`config/permissions/permission-levels.yaml`), capped by
   `CLAUDE_OS_MAX_AUTONOMY` (default 3).
3. **Settings** — `.claude/settings.json` deny/ask lists (secret paths
   unreadable, sudo/force-push denied, pushes and deletions ask).
4. **Hooks** — `.claude/hooks/pre-tool-guard.sh` mechanically blocks
   secret-path writes, credential-shaped content, and destructive
   command patterns. Functionally tested by `tests/security/test_hooks.sh`
   (15 cases).
5. **Human gates** — L4/L5 and the whole sensitive list
   (`config/permissions/approval-required.yaml`) require explicit,
   per-action approval. Silence is never consent.

## Skills & agents

`skills/security/secure-coding` (category checklist, OWASP-linked) ·
`skills/security/secrets-hygiene` (storage, leak response — rotate
first!) · security-agent (adversarial review, mandatory for production;
read-only on the artifact) · `workflows/security-audit` (the full
9-stage audit).

## Dependency security

Vetting protocol: SECURITY.md §4. Record: `docs/dependencies.md` +
`config/skills/external-skills.yaml` (pins; audit fields test-enforced).
Standing rule: read what executes — installer scripts are inspected, and
`curl | bash` is hook-blocked.

## Self-checks

`scripts/verify.sh --section secrets` (credential-pattern scan +
.gitignore coverage) runs in the test suite; doctor confirms `.env` is
ignored and hooks are executable.

## Incident quick card

Committed secret → **rotate immediately** → tell the human → purge
history (approval-gated force-push) → check provider usage logs →
learning-agent files the prevention lesson. Full procedure:
`skills/security/secrets-hygiene/SKILL.md`.
