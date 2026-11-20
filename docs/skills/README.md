# Skills Guide

Internal skills live in `skills/<category>/<name>/SKILL.md` (source of
truth) and are symlinked into `.claude/skills/` by `scripts/install.sh`
for discovery. External skills/plugins are governed by the registry
(`config/skills/external-skills.yaml`) and `docs/dependencies.md`.

The combined catalogue — 27 internal skills plus 32 registered external
entries, with the status that decides whether each is installed — is
[`pack.md`](pack.md).

## The library (36 internal skills)

| Category | Skills |
|---|---|
| core | skill-router · quality-pipeline · memory · graph-knowledge |
| design | design-direction · anti-slop · design-review · cinematic-product-design · design-system |
| frontend | frontend-standards · component-quality |
| backend | api-standards · data-safety · whmcs-operations · payment-gateways · php-module-packaging |
| research | research-intelligence · competitor-analysis |
| security | secure-coding · secrets-hygiene · webhook-security |
| qa | functional-qa · visual-qa |
| seo | technical-seo · geo |
| media | image-generation · video-generation |
| 3d | r3f-scenes · exploded-views |
| growth | growth-analysis · lead-research · launch-playbook |
| production | production-readiness · deployment-gates |
| support | support-playbook · cpanel-whm-guide |

## External library (236 third-party skills)

Third-party skills live in [`external/`](../../external/README.md), each under its own upstream licence (not this repo's MIT). They are stored so any project can copy one in; they are not part of the plugin and the skill-router does not load them unless a project adds them.

## Routing, not loading

The skill-router (`skills/core/skill-router/`) selects the minimal set
per task and records what it excluded. Overlaps between internal and
external capabilities have explicit rulings:
`docs/architecture/skill-overlap.md`.

## Authoring a skill

1. `skills/<category>/<name>/SKILL.md` with frontmatter:
   `name` (== directory name, unique) and `description` (when to use —
   this drives discovery, make it trigger-precise).
2. Body: procedure and judgment, not prose about the topic. Checklists,
   formats, exit bars. If it can't change what an agent does, cut it.
3. Register in `SYSTEM_MANIFEST.yaml` skills map.
4. `scripts/install.sh` (links it) → `scripts/verify.sh --section skills`
   → add a routing-table entry in the skill-router if it's routable.

## Quality bar

A skill is done when an agent who has never seen the task can follow it
to a gate-passing result — and knows when NOT to apply it (the
description's job).
