# Workflow: Redesign

**Trigger**: visually/structurally overhauling an existing site or product
without destroying what works. **Orchestrator**: commander.

## Stages

1. **Baseline (measure before touching)** — snapshot current state:
   analytics/Search Console exports where connected (growth-agent),
   Lighthouse numbers (performance-agent), ranking pages + metadata
   (seo-agent), full visual-qa screenshot matrix, accessibility quick
   audit. This baseline is the yardstick and the safety net.
2. **Diagnose** — ux-researcher: what actually fails users (usability
   findings, funnel leaks)? growth-agent: what does the data say?
   Separate "works, keep" from "fails, fix" — a redesign that discards
   working conversion paths is a regression with better fonts.
3. **Research & direction** — research-intelligence packet;
   design-director writes the new DESIGN.md, explicitly noting what
   visual equity carries over (brand recognition is an asset).
4. **SEO protection plan** — seo-agent: URL mapping (old → new, 301s for
   every changed URL, no chains), ranking-page content preservation
   rules, metadata migration. *Gate: no build until the map exists.*
5. **Structure & design** — ux-designer restructures against diagnosed
   failures; visual-designer applies the new language.
   *Gate: design-review + comparison against baseline pain points.*
6. **Build** — as `new-website` stage 4, on a branch; content migrated,
   not lost (inventory checked).
7. **Full gate battery** — as `new-website` stages 5–9, plus:
   **regression comparison against baseline** — performance not worse,
   rankings-relevant content and URLs preserved per plan, conversion
   paths intact (qa-agent walks the old money paths on the new site).
8. **Staged rollout** — production-agent: staging with the redirect map
   live; human walkthrough; L5 approval; deploy; then monitor rankings/
   vitals/conversion against baseline for an agreed window
   (continuous-growth picks this up).
9. **Learn** — learning-agent: what the old design taught, recorded.

## Rules

- No baseline → no redesign. Stage 1 is not skippable.
- Changed URLs without redirects are release blockers.
