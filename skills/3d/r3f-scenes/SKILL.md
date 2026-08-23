---
name: r3f-scenes
description: Building performant React Three Fiber scenes - stack versions, scene architecture, asset pipeline, lighting/camera/materials, performance budgets, mobile fallbacks. Use for any Three.js/R3F work.
---

# R3F Scenes

The pmndrs stack, used with discipline. Version pairing (verified 2026-08,
see docs/dependencies.md): **React 19 → @react-three/fiber@9 +
@react-three/drei@10** (+ `three`). Don't mix fiber 8 patterns into v9
projects.

## Scene architecture

- `<Canvas>` lazy-loaded (dynamic import) — never in the critical path of
  LCP content; page must be meaningful without it.
- Scene = component tree: one component per logical object/group;
  `useGLTF` + drei helpers over hand-rolled loaders; state via the
  project's normal state idiom, frame logic via `useFrame` only.
- `frameloop="demand"` for static/interaction-driven scenes; continuous
  only when something genuinely animates every frame.

## Asset pipeline

- GLTF/GLB only; Draco or Meshopt compressed; textures KTX2/basis where
  the toolchain allows, power-of-two sized, ≤2048px unless justified.
- Run models through gltf-transform-class optimization before commit;
  record source + license per model (license check mandatory — see
  docs/dependencies.md pattern).
- Preload with `useGLTF.preload`; show a designed loading state
  (drei `<Html>` progress or suspense fallback per DESIGN.md).

## Lighting, camera, materials

- IBL first (drei `<Environment>`); ≤2 dynamic lights before justifying
  more; bake what doesn't move.
- Camera: designed framing per breakpoint; controls constrained (min/max
  distance, angle limits) — users should be unable to break the shot.
- Materials: PBR from the asset; avoid per-frame material mutation;
  reuse geometries/materials (instancing for repeats).

## Performance discipline

Budgets from the 3d-director charter (draw calls ≤100, tris ≤500k/150k,
textures ≤64/24MB, GLB ≤3MB, 60fps/30fps floor). Practices:
- No allocations inside `useFrame`; reuse vectors/quaternions.
- `<Instances>`/instancedMesh for repeated geometry.
- drei `<Detailed>` (LOD), `<AdaptiveDpr>`, frustum culling respected —
  measure with r3f-perf-class tooling before and after.

## Fallbacks & accessibility (non-negotiable)

- WebGL-unavailable and low-power mobile → poster image or CSS scene;
  detection + swap implemented, not planned.
- `prefers-reduced-motion` → static or minimal-motion variant.
- Text alternative describing what the scene shows; interactive scenes
  keyboard-reachable or offering an equivalent path.
