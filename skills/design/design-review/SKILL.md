---
name: design-review
description: Reviewing implemented UI against the project design language - fidelity, consistency, hierarchy, states, responsiveness. Use when the design-director reviews built work or arbitrates visual decisions.
---

# Design Review

Structured review of implemented UI against the project `DESIGN.md` and
root design rules. Run by design-director on rendered output (use
visual-qa-agent screenshots; never review from code alone).

## Review passes (in order)

1. **Hierarchy** — squint test per page: does the eye land 1st/2nd/3rd
   where the page's job demands? Is the primary action unmistakable?
2. **Language fidelity** — tokens in use match DESIGN.md: type scale
   steps, palette roles (accent scarce?), spacing scale, radius/shadow
   language. Magic values are findings.
3. **Consistency** — same element, same treatment across pages/states;
   nav/footer/form patterns identical everywhere they appear.
4. **States** — hover, focus, active, disabled, loading, empty, error,
   success all styled per spec (cross-check visual-qa state matrix).
5. **Responsiveness** — hierarchy survives at 320–430px; type remains
   readable; spacing rhythm adapts rather than collapses.
6. **Composition** — whitespace doing its grouping/rhythm job; alignment
   intentional; imagery cropped/treated per direction.
7. **Voice** — visible copy matches the voice section; microcopy
   (buttons, errors, empty states) included.

## Finding format

`page/element | pass # | violation (cite DESIGN.md section) | concrete fix`

Severity: **blocker** (breaks hierarchy/language on a money path) ·
**major** (visible inconsistency) · **minor** (polish).

## Rulings

When the implementation intentionally deviates (technical constraint,
better idea), the reviewer either: accepts and updates DESIGN.md (recorded
change), or rejects with the fix. Undocumented drift is never accepted.

## Relationship to anti-slop

Design review asks "is it on-language and well-executed?"; the anti-slop
gate asks "is it distinctive and non-generic?". Both must pass; neither
substitutes for the other.
