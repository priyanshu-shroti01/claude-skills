---
name: growth-analysis
description: Growth analysis procedure - funnel reconstruction, leak diagnosis, opportunity scanning, and prioritized recommendations from analytics, Search Console, site and competitor inspection. Use for growth reviews and the continuous-growth workflow.
---

# Growth Analysis

Turn data + inspection into a ranked list of the highest-leverage
improvements. Run by growth-agent; feeds `workflows/continuous-growth/`.

## 1. Inventory the evidence

State explicitly what's connected: analytics? Search Console? error
tracking? none? Absent data sources → inspection + heuristics, labeled as
such. **Never fabricate numbers.**

## 2. Reconstruct the funnel

Entry (channels) → engagement (key pages, depth) → conversion (the money
action) → retention where applicable. Numbers per stage where data
exists; qualitative walk-through where not.

## 3. Find the leaks

- Biggest stage-to-stage drop-offs.
- Search: high-impression/low-CTR queries (title/description mismatch),
  ranking pages losing position, indexed-but-unloved content.
- Pages: high-traffic/low-conversion (the classic goldmine), mobile vs.
  desktop conversion gaps, slow pages on the money path.
- UX: walk the conversion path as a skeptical first-timer; note every
  hesitation, trust gap, and form friction.

## 4. Diagnose

Per leak: data signal → hypothesis → supporting evidence from the actual
page/flow (screenshot, copy critique, perf number). A hypothesis without
page evidence stays labeled a guess.

## 5. Scan opportunities beyond leaks

Content gaps vs. query demand · competitor movement (competitor-agent) ·
audit backlogs (SEO/perf/a11y quick wins) · GEO citation presence ·
underused proof assets (testimonials, data, case studies).

## 6. Prioritize & package

Score: impact × confidence ÷ effort. Output per recommendation:

```
OPPORTUNITY | EVIDENCE (data/hypothesis) | PROPOSED CHANGE |
EXPECTED IMPACT | EFFORT | SUCCESS METRIC + how measured
```

Top items become task briefs for the normal workflows — growth never
bypasses the quality gates, and no dark patterns (fake scarcity,
deceptive CTAs, forced continuity) regardless of expected lift.

## Cadence

Snapshot key metrics per run (dated) so the next run measures movement;
recommendations that shipped get their success metric checked first.
