---
name: skill-router
description: Decide which capabilities (skills, agents, MCP tools) a task actually requires and load only those. Use at the start of any non-trivial task, before loading skills or delegating to agents.
---

# Skill Router

Answer one question precisely: **"What capabilities does this task actually
require?"** Load the minimum. Name what might come later. Exclude the rest.

## Procedure

1. **Classify** the task:
   `build` (create something) · `audit` (assess something) · `research`
   (learn something) · `fix` (repair something) · `operate` (run/deploy).
2. **Identify domains** from the brief AND from project inspection —
   a "simple landing page" brief for a repo with a 3D hero touches 3D.
3. **Map** domains → capabilities with the routing table below.
4. **Subtract**: remove anything not needed for the *current stage*.
   Later stages re-route. (A research stage needs no engineering skills.)
5. **Emit** the decision record (format below).

## Routing table

| Signal in task | Load |
|---|---|
| Any user-facing UI | design-direction, anti-slop, frontend-standards, visual-qa, design-director, frontend-engineer |
| New visual language needed | design-director, visual-designer, ux-designer, DESIGN.md template |
| User flows / IA unclear | ux-researcher, research-intelligence |
| Market/competitor context needed | research-intelligence, competitor-analysis |
| Website shipping publicly | technical-seo, geo, accessibility (agent), production-readiness |
| Animation/motion emphasis | motion-director |
| 3D / product visualization | r3f-scenes; exploded-views if explosion; 3d-director |
| Scroll-cinematic "fly-through" landing (pre-rendered video) | lets-scroll (external, optional — paid generation, budget approved first); r3f-scenes instead when real-time interaction is needed |
| Imagery/video assets missing | image-generation / video-generation, media-director |
| API / server / database | api-standards, data-safety, backend-architect+engineer |
| Auth, payments, uploads, user data | secure-coding, secrets-hygiene, security-agent (mandatory) |
| Any implementation | code-reviewer (gate), functional-qa |
| Performance concern / launch | performance-agent, deployment-gates |
| Traffic/conversion goals | growth-analysis; lead-research only on explicit request |
| Completed significant work | learning-agent |

## Worked examples

**Premium marketing website** → design-direction, frontend-standards,
component-quality, motion-director, technical-seo, geo, accessibility,
functional-qa, visual-qa, performance, anti-slop, production-readiness;
media + 3D only if the brief calls for generated assets / 3D. Excluded:
backend skills (no server logic), lead-research, exploded-views.

**Simple internal API** → api-standards, data-safety, secure-coding,
functional-qa, code-review, deployment-gates. Excluded: all design, SEO,
media, 3D, growth — an internal API has no visitors.

**SEO audit** → technical-seo, geo, competitor-analysis (light),
performance-agent (speed overlap). Excluded: implementation skills until
fixes are commissioned.

## Decision record format

```
TASK: <one line>
CLASS: build|audit|research|fix|operate
LOAD NOW:   <skill/agent> — <reason>
LOAD LATER: <skill/agent> — <trigger>
EXCLUDED:   <skill/agent> — <why irrelevant>
```

## Principles

- Progressive disclosure: a named-but-unloaded skill costs nothing;
  an unused loaded skill pollutes every decision after it.
- Overlapping capabilities: consult `docs/architecture/skill-overlap.md`
  and route exactly one.
- When genuinely uncertain whether a capability is needed: don't load it —
  note the trigger that would change the answer.
