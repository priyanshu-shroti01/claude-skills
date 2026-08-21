---
name: exploded-views
description: The interactive exploded product view pipeline - model inspection, component separation, exploded positions, camera/timeline choreography, interaction, optimization, QA - with strict honesty rules. Use for product-explosion experiences.
---

# Exploded Views

Pipeline: **product → 3D asset → component separation → exploded
positions → camera → animation → interaction → optimization → QA.**
Run by exploded-view-director; inherits everything in `r3f-scenes`.

## Mode decision (first, always)

- **Real geometry** (GLTF/GLB with separable parts) → true exploded view;
  part labels may name real components.
- **Image only** → AI-generated exploded *artwork* (marketing
  illustration): image-generation pipeline, honesty rules below, no
  fake interactivity implying real structure.
- Accuracy matters to the buyer (technical product, spec-driven
  purchase)? → real geometry or don't do it.

## Real-geometry pipeline

1. **Inspect**: load the model, map the node tree, identify separable
   assemblies; merge/split meshes so parts match the story being told.
2. **Explosion design**: one dominant axis from the assembly logic
   (stack axis for layered products), minor perpendicular offsets for
   legibility; relative order and alignment preserved — parts must
   visually "want" to reassemble. Distances proportional to part size;
   tune by eye at the target camera.
3. **Timeline**: one scrubbed timeline — assembled → exploding →
   exploded-hold (labels appear) → reassembly. Ease per motion language;
   camera choreographed with the explosion (orbit/track), never fighting
   it.
4. **Interaction**: scrub via scroll or slider (slider = the accessible
   path; scroll-scrub must not hijack page scroll); optional per-part
   focus (click/tap → camera frames part + label). Reduced motion →
   jump between assembled/exploded states, no tweening.
5. **Labels**: drei `<Html>` anchored with leader lines; legible at
   mobile sizes; label text from real product data only.
6. **Optimize**: per r3f-scenes budgets; mobile → reduced part count,
   capped DPR, or a pre-rendered sequence; static poster fallback always.
7. **QA**: scrub smoothness (no jank at 4x CPU throttle), label
   legibility at 375px, reduced-motion path, fallback correctness,
   keyboard operability of the slider, load cost within budget.

## Honesty rules (binding)

- Never claim or imply mechanical accuracy unless the source geometry
  supports it.
- Artwork mode: caption/alt marks it illustrative ("illustration, not to
  spec"); no part labels naming real internals you haven't verified;
  the human is told which mode shipped.
- Model licenses verified before modification/publication.
