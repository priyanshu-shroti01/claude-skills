# Reference: Performance Budgets & Measurement Conditions

Default budgets (PRODUCTION_READINESS.md §D is the release-gating copy;
override per project in its docs with a recorded reason).

## Core Web Vitals (p75, mobile)

| Metric | Budget | Notes |
|---|---|---|
| LCP | ≤ 2.5s | LCP element identified and optimized deliberately |
| CLS | ≤ 0.1 | every shift attributed; media dimension-reserved |
| INP | ≤ 200ms | measured on the money-path interactions |
| TTFB | ≤ 800ms | caching/CDN posture is the usual lever |

## Weight

| Asset class | Budget |
|---|---|
| JS, initial route (gz) | ≤ 200KB |
| Largest image | ≤ 200KB (hero exceptions documented) |
| Fonts | ≤ 2 families, subset, ≤ 100KB total woff2 |
| Ambient video loop | ≤ 2–4MB, no audio track |
| GLB initial payload | ≤ 3MB (see skills/3d/r3f-scenes) |

## Measurement conditions (make numbers comparable)

- Lighthouse mobile config: Moto-class CPU throttle (4x), slow-4G-class
  network throttle.
- ≥3 runs, report the **median**; record the commit measured.
- Lab (Lighthouse) and field (CrUX/analytics vitals) reported separately,
  never mixed.
- Production-equivalent build only — dev servers are inadmissible.

## Standing tactics (cheapest wins first)

Ship less JS (server-first, dynamic-import below-fold) → right-size and
modern-format images → font subsetting + preload critical face →
cache/CDN correctness → eliminate render-blocking third parties →
attribute and fix CLS sources → hydrate less.

## Regression guard

Projects with CI get budget assertions (Lighthouse CI-class) so breaches
fail mechanically rather than by audit surprise.
