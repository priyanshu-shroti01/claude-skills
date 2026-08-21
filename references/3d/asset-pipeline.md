# Reference: 3D Asset Pipeline Quick Sheet

Numbers and tool shapes for 3d-director / exploded-view-director.
Procedures live in `skills/3d/`.

## Format decisions

| Need | Use |
|---|---|
| Delivery format | glTF 2.0 binary (.glb), always |
| Geometry compression | Draco (smaller) or Meshopt (faster decode) — pick per project |
| Textures | KTX2/BasisU where toolchain allows; else optimized PNG/JPEG/WebP |
| Source formats (FBX/OBJ/STEP…) | convert on import; keep source out of the web bundle |

## Optimization pass (gltf-transform-class, before commit)

dedupe → prune → weld → simplify (where silhouette survives) → draco/
meshopt → texture resize (≤2048, power-of-two) → ktx2. Record
before/after sizes.

## Budgets (from the 3d-director charter)

Draw calls ≤100 · tris ≤500k desktop / 150k mobile · texture memory
≤64MB / 24MB · initial GLB ≤3MB · 60fps desktop, 30fps mobile floor.

## Stack pins (verified 2026-08 — docs/dependencies.md)

React 19 → `@react-three/fiber@9` (9.7.0) + `@react-three/drei@10`
(10.7.8) + `three`. GSAP 3.x free (incl. former Club plugins) under the
Webflow "no charge" license for timeline work.

## Model sourcing checklist

- License verified BEFORE modification/publication (record source, URL,
  license per model in the project's dependency notes).
- CAD→mesh conversions: strip metadata that could leak internals the
  client hasn't published.
- Exploded views: real geometry claims accuracy; image-only mode is
  labeled artwork (honesty rules in skills/3d/exploded-views).

## Fallback matrix

| Condition | Serve |
|---|---|
| No WebGL / crawler | poster image + text equivalent |
| Low-power mobile | reduced scene or poster |
| `prefers-reduced-motion` | static or jump-states (no tweens) |
| Loading | designed placeholder, reserved dimensions (no CLS) |
