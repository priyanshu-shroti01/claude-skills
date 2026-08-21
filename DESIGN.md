# Claude OS — Design Philosophy

This document defines *how design decisions are made*, not a fixed visual
style. Every project gets its own `DESIGN.md` (created by
`scripts/project-init.sh`) that instantiates this philosophy into a concrete
visual language. The design-director enforces both.

## The standard

Premium, distinctive, intentional. A visitor should never be able to tell the
site was AI-generated. "Looks fine" is not the bar; "looks designed by
someone with taste and a point of view" is.

## Binding rules

### 1. No generic AI aesthetics

The anti-slop gate (`skills/design/anti-slop/`) is mandatory for user-facing
UI. Forbidden as defaults (acceptable only with explicit design intent):
purple-to-blue gradients on everything, arbitrary glassmorphism, floating
blurred blobs, three-cards-in-a-row features grid, centered-hero + two-CTA
template, uniform 16px rounded corners, decoration without meaning,
placeholder-quality copy.

### 2. Typography is the backbone

- Choose typefaces deliberately; state the reason in the project DESIGN.md.
- Define a modular type scale (e.g. 1.2–1.333 ratio) and stick to it.
- Real typographic hierarchy: size, weight, spacing and color work together.
- Line length 45–75 characters for body text. Line height tuned per size.
- No more than 2 families (plus optional mono) without justification.

### 3. Spacing is systematic

- One spacing scale (4px or 8px base), applied everywhere.
- Whitespace is a design element with a job: grouping, rhythm, emphasis.
- Density is a decision per surface, not an accident per component.

### 4. Color has hierarchy

- A palette has roles: dominant, supporting, accent, semantic, neutrals.
- Accent color is scarce — that's what makes it an accent.
- Every combination used for text must meet WCAG contrast (see
  `references/accessibility/`).
- Dark mode, if offered, is designed — not inverted.

### 5. Motion communicates

- Animation exists to explain (state change, causality, spatial model) or to
  give feedback — never to decorate idle space.
- Durations 120–400ms for UI feedback; easing chosen, not defaulted.
- Respect `prefers-reduced-motion` always.
- Scroll-driven effects must add comprehension, not friction.

### 6. Components have purpose

- Every element must justify its existence: what does it tell the user, or
  let them do? Decoration that answers neither is removed.
- Use established systems (e.g. shadcn/ui) as raw material, then customize:
  radii, shadows, spacing, states, typography must match the project language.

### 7. States are designed, not left over

Empty states, loading states, error states, success states, hover, focus,
active, disabled — all designed. A form without designed error states is
unfinished. A dashboard without a designed empty state is unfinished.

### 8. Responsive is mandatory

Mobile-first where appropriate. Test at 320 / 375 / 390 / 430 px, tablet,
desktop, large desktop. See `.claude/rules/design-rules.md` for the full
mobile checklist (overflow, touch targets, sticky CTA, nav, forms, media,
3D fallbacks).

### 9. Accessibility is design

Keyboard navigation, visible focus, semantic structure, contrast, touch
target size (≥44px), reduced motion — designed in from the start, audited by
the accessibility-agent before ship. WCAG 2.2 AA is the floor.

### 10. Content is part of the design

Generic copy is slop. Voice, specificity and honesty are design decisions.
Real business information, real imagery direction (see media-director), alt
text that describes.

## Process obligations

1. Before designing: research (ux-researcher / research-agent output),
   competitor patterns extracted — never copied.
2. A project `DESIGN.md` is created/updated before high-fidelity work begins:
   typography, scale, palette+roles, spacing scale, radius/shadow language,
   motion language, imagery direction, voice.
3. During build: design-director reviews against the project DESIGN.md.
4. Before ship: anti-slop scan → critique → improve → re-render → re-scan.
   The gate is the loop, not a single pass.

## Judgment guide

Prefer: strong typography, intentional composition, clear visual hierarchy,
meaningful motion, purposeful whitespace, strong imagery, authentic content,
interaction details, one coherent visual language.

Reject: template composition, symmetric sameness, decorative noise,
trend-chasing without fit, ten fonts of hierarchy where two would do, and
anything you couldn't defend out loud to a design director.
