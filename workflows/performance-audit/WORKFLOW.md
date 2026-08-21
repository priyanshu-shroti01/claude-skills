# Workflow: Performance Audit

**Trigger**: pre-release (mandatory for user-facing web), budget breach
suspicion, scheduled sweep. **Lead**: performance-agent.
**Budgets**: project-defined, defaults in PRODUCTION_READINESS.md §D.

## Stages

1. **Scope & conditions** — pages in scope (money path always); test
   conditions fixed and recorded: mobile emulation, network/CPU
   throttling, cold vs. warm cache. Fast-machine-unthrottled numbers are
   inadmissible.
2. **Measure** — Lighthouse (multiple runs, median reported) per scoped
   page: LCP, CLS, INP, TTFB + scores. Field data (CrUX/analytics
   vitals) pulled where available — lab and field labeled separately.
3. **Waterfall analysis** — what blocks first paint, render-blocking
   resources, unused payloads, request count/order/priorities, cache
   headers, CDN behavior.
4. **Weight analysis** — JS: bundle breakdown vs. budget, largest
   modules, duplication, hydration cost. Images: format/dimensions vs.
   rendered size/compression per asset. Fonts: families, subsets,
   display strategy, preloads. 3D: scene budgets per r3f-scenes where
   present.
5. **Runtime analysis** — long tasks, main-thread blocking, layout-shift
   attribution (which elements), interaction latency on the money path.
6. **Findings** — `metric impact | specific cause (asset/module/pattern
   + location) | fix | estimated gain`, ranked by user impact. Budget
   breaches marked release-gating.
7. **Fix & re-measure** — owners fix (architect consulted for structural
   causes); identical-conditions re-measurement; before/after per metric
   reported. Loop until budgets hold or the human explicitly accepts a
   documented breach.
8. **Guard** — where the project has CI, budget assertions (Lighthouse
   CI-class) proposed so the next regression is caught mechanically.

## Rules

- Median of ≥3 runs; no conclusions from single measurements.
- "Optimize images" is not a finding — name the asset, the number, the
  target.
