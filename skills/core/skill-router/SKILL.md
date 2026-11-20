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
| 3D hero / shader raw material needed | threeui (external, optional — Community subset only) *through* r3f-scenes' rules |
| Visual direction for a 3D/cinematic brief | references/design/inspiration-sources.md (look, never copy) |
| Imagery/video assets missing | image-generation / video-generation, media-director |
| Any prose shipping to users (copy, docs, articles) | no-ai-slop (external, required — prose gate; pairs with the visual anti-slop gate) |
| SEO *execution* — briefs, drafting, clusters, snippets, links | superseo-skills (external, optional); internal technical-seo + geo remain the gate |
| Debugging, merge conflicts, domain modelling, spec/ticket breakdown | mattpocock-skills (external, optional — cherry-picked only) |
| A capability the OS does not have | find-skills (external, required) — **discovery only**; adoption goes through SECURITY.md §4 before anything is installed |
| API / server / database | api-standards, data-safety, backend-architect+engineer |
| Auth, payments, uploads, user data | secure-coding, secrets-hygiene, security-agent (mandatory) |
| Premium marketing site / hero / brand page | cinematic-product-design, design-system, design-direction |
| Styling a component in a project that has a design system | design-system |
| WHMCS module, hook, admin script or billing change | whmcs-operations, data-safety |
| Payment gateway, callback or webhook that moves money | payment-gateways, webhook-security, secure-coding |
| Any public endpoint callable without login | webhook-security |
| Releasing / packaging / encoding a commercial PHP module | php-module-packaging, deployment-gates |
| Drafting a customer support reply | support-playbook; cpanel-whm-guide for panel how-tos |
| Hosting customer or reseller needs cPanel / WHM steps | cpanel-whm-guide |
| Product launch, promo, waitlist or go-to-market | launch-playbook, growth-analysis |
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
