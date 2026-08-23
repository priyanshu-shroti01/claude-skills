---
name: frontend-standards
description: Frontend implementation standards - semantics, styling discipline, state, data, images/fonts, error handling, testing. Use during any frontend implementation or frontend code review.
---

# Frontend Standards

The implementation baseline for all frontend work. External guidance
(Vercel react-best-practices, web-design-guidelines — see
`integrations/anthropic/` and the external registry) complements this;
project conventions win over both where they conflict.

## Markup & semantics

- Semantic elements first (`nav`, `main`, `button`, `dialog`…); `div` is
  the last resort, ARIA the one after that.
- One `h1` per page; heading levels never skip.
- Interactive = focusable = keyboard-operable. No click-handlers on
  non-interactive elements without full keyboard/roles treatment.

## Styling

- Design tokens, not magic numbers; the project scales are law.
- Co-locate styles per project convention; no `!important` escalation.
- Layout: modern primitives (flex/grid/container queries), no absolute-
  positioning layouts unless the design demands it.
- Every component styled for all spec'd states.

## State & data

- Server-first where the framework allows; client state only for client
  concerns.
- Local state → lift only when shared; global stores need an architect
  ruling.
- Data fetching: the framework's idiom (not ad-hoc effects), with
  loading/error/empty handled at the fetch site.
- Forms: controlled per project convention; validation both client
  (UX) and server (truth).

## Assets

- Images: modern formats, explicit dimensions (no CLS), `srcset`/`sizes`,
  lazy below the fold, priority for LCP element.
- Fonts: ≤2 families, subset, `font-display: swap` (or per design),
  preload the critical face.

## Errors & resilience

- Error boundaries at sensible seams; designed error states, never white
  screens.
- Suspense/skeletons per design; optimistic UI only with rollback.

## Testing

- Logic in plain functions → unit tests; critical flows → e2e (Playwright);
  components with behavior → interaction tests. Rendering fidelity is
  visual-qa's job — don't snapshot-test aesthetics.

## Performance discipline

- Respect the budget (PRODUCTION_READINESS.md §D) while building, not
  after: measure bundle impact of every dependency; dynamic-import heavy,
  below-fold, or interaction-gated code.
