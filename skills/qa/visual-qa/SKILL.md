---
name: visual-qa
description: Visual verification procedure - screenshot matrix across viewports and states, inspection checklist, and reporting. Use before any UI change is called done.
---

# Visual QA

See what users see, at every size, in every state — and actually look at
it. Run by visual-qa-agent with browser automation (Playwright MCP).

## The matrix

**Viewports**: 320, 375, 390, 430, 768, 1280, 1920 (px wide).
**States**: default · hover · focus-visible · loading · empty · error ·
success · filled-form · (dark mode if the project has one).
**Scope**: pages/components changed + anything sharing their layout
primitives (blast radius via the knowledge graph).

Full matrix on release candidates; changed-scope matrix during iteration.

## Capture rules

- Real rendering: fonts loaded, images loaded, animations settled (plus
  mid-animation captures where motion is the feature).
- Force states deliberately: throttle for loading, stub errors, seed empty
  data, `:focus-visible` via keyboard not mouse.
- Name captures `page--viewport--state.png`; keep per-run directories
  (gitignored).

## Inspection checklist (per capture — no unexamined screenshots)

- [ ] No horizontal overflow / scrollbar at any viewport
- [ ] No clipped, overlapping, or truncated-without-design text
- [ ] Grids/wraps intact; no orphaned or stretched cards
- [ ] No unstyled or browser-default elements
- [ ] Images/icons present, uncropped-unless-designed, unstretched
- [ ] Text over imagery legible (contrast at the actual pixels)
- [ ] Focus ring visible on the focused element
- [ ] Touch targets not crowded at mobile widths
- [ ] Matches the visual spec (deviations listed — design-director rules)

## Interactive sweeps

Tab through every interactive element (focus order + visibility) · hover
sweep · invalid + valid form submission · trigger loading/empty/error for
each async surface.

## Report format

```
PAGE | VIEWPORT | STATE | RESULT | ISSUE + SCREENSHOT REF (failures)
```
Clean cells reported too — coverage claimed is coverage shown.

## Cross-browser

Chromium during iteration; + Firefox and WebKit on release candidates.
