---
name: component-quality
description: What a finished UI component looks like - API design, states, composition, accessibility, customized design-system usage. Use when building or reviewing components, especially on top of shadcn/ui or similar systems.
---

# Component Quality

A component is done when another engineer can drop it in without reading
its source, and no user can reach an unstyled or broken state of it.

## API design

- Props express intent, not implementation (`variant="danger"`, not
  `redBorder`).
- Sensible defaults; the common case needs the fewest props.
- Composition over configuration: slots/children over boolean prop
  explosions. A `<Card>` with 12 layout booleans is two components.
- Forward refs where consumers will need them; spread safe rest-props to
  the sensible root.

## States (all designed, all implemented)

default · hover · focus-visible · active · disabled · loading · error ·
empty (where content-bearing) · selected/checked where applicable.
Keyboard parity with pointer for every state transition.

## Design-system usage (shadcn/ui et al.)

- Generated/system components are **raw material**: retheme tokens
  (radius, shadows, spacing, type) to the project DESIGN.md before use.
- Never mix half-themed system components with custom ones — one language.
- Wrap third-party primitives behind project components so swaps stay
  cheap; document any React Bits/Motion Primitives licensing notes in the
  project dependency record (React Bits: MIT + Commons Clause — fine in
  products, not redistributable as a component library).

## Accessibility per component

- Name, role, value correct in the accessibility tree.
- Focus management for overlays (trap, restore, escape).
- Announcements for async results (live regions) where the UI changes
  without focus movement.

## Checklist before review

- [ ] All states reachable and styled; keyboard walk clean.
- [ ] Works at 320px and with 200% text zoom.
- [ ] No layout shift on async content (dimensions reserved).
- [ ] Tokens only — no magic values.
- [ ] Usage example written (story/doc per project convention).
