# Workflow: Accessibility Audit

**Trigger**: pre-release (mandatory for user-facing UI), scheduled sweep,
or human request. **Lead**: accessibility-agent. **Floor**: WCAG 2.2 AA.

## Stages

1. **Scope** — pages/flows in scope; the money path is always in scope.
   Component inventory of interactive patterns (each pattern audited
   once, verified everywhere it recurs).
2. **Automated sweep** — axe-class scanning via browser tooling for the
   mechanical layer (contrast candidates, missing attributes, landmark
   issues). Scanner output is *leads, not verdicts*.
3. **Keyboard walk** — every flow end-to-end by keyboard: reachability,
   sensible order, visible focus at every stop, no traps, skip link,
   overlay focus management (trap/restore/escape).
4. **Accessibility-tree review** — names/roles/values of interactive
   elements; landmarks; heading hierarchy; live-region behavior on
   dynamic updates.
5. **Contrast measurement** — computed values on real renders (including
   text-over-imagery): text ≥4.5:1 (large ≥3:1), UI components ≥3:1.
6. **Forms deep-dive** — labels programmatic, groups grouped, errors
   announced + associated, no placeholder-as-label, autofill types.
7. **Zoom/motion/touch** — 200% zoom and 320px reflow without loss;
   `prefers-reduced-motion` honored everywhere; touch targets ≥44px.
8. **Screen-reader narrative** — the page read linearly: does it make
   sense; alt text purposeful; decorative content silenced.
9. **Report** — per finding: WCAG criterion | severity (blocker/major/
   minor) | location | evidence | concrete fix. Blockers on the money
   path gate release.
10. **Fix & re-verify** — owners fix (design-director consulted where
    fixes have visual impact); accessibility-agent re-tests behaviorally
    and closes findings explicitly.

## Rules

- Behavioral verification decides; automation only assists.
- Patterns fixed at the component level, then re-verified at each usage.
