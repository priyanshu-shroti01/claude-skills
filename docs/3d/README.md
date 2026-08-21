# 3D Guide

Interactive 3D (React Three Fiber) and exploded product views, run by
the 3d-director and exploded-view-director.

## The pieces

| Piece | Where |
|---|---|
| Scene standards, budgets, fallbacks | `skills/3d/r3f-scenes` |
| Exploded-view pipeline + honesty rules | `skills/3d/exploded-views` |
| Asset pipeline numbers (formats, compression, budgets) | `references/3d/asset-pipeline.md` |
| Stack pins & licenses | `docs/dependencies.md` |

## Stack (verified pairing, 2026-08)

React 19 → `@react-three/fiber@9` (9.7.0) + `@react-three/drei@10`
(10.7.8) + `three` — all MIT, installed per project (not globally).
GSAP 3.x (free under the Webflow license) for timeline choreography
where scroll narratives demand it. Scroll World (optional, MIT) is a
different animal — pre-rendered video scrub pages with paid generation
services — routed only for cinematic non-interactive experiences.

## Non-negotiables (from the charters)

- Canvas lazy-loaded; the page's job survives without WebGL.
- Every scene: mobile/no-WebGL fallback + reduced-motion path + text
  equivalent.
- Budgets (draw calls ≤100, GLB ≤3MB initial, 60/30fps) are gates, not
  aspirations — measured before ship.
- Model licenses verified before modification/publication; source
  recorded per model.

## Exploded views in one paragraph

Real geometry → true exploded view (part separation along assembly axes,
one scrubbed timeline, labels from real product data, per-part focus,
slider as the accessible path). Image-only → generated exploded
*artwork*, labeled illustrative, never presented as mechanical truth.
Accuracy matters to the buyer → real geometry or don't build it.
Full pipeline: `skills/3d/exploded-views/SKILL.md`.
