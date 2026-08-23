# Skills Guide

Internal skills live in `skills/<category>/<name>/SKILL.md` (source of
truth) and are symlinked into `.claude/skills/` by `scripts/install.sh`
for discovery. External skills/plugins are governed by the registry
(`config/skills/external-skills.yaml`) and `docs/dependencies.md`.

## The library (27 internal skills)

| Category | Skills |
|---|---|
| core | skill-router · quality-pipeline · memory · graph-knowledge |
| design | design-direction · anti-slop · design-review |
| frontend | frontend-standards · component-quality |
| backend | api-standards · data-safety |
| research | research-intelligence · competitor-analysis |
| security | secure-coding · secrets-hygiene |
| qa | functional-qa · visual-qa |
| seo | technical-seo · geo |
| media | image-generation · video-generation |
| 3d | r3f-scenes · exploded-views |
| growth | growth-analysis · lead-research |
| production | production-readiness · deployment-gates |

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
