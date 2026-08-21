# Design Rules (operational digest of DESIGN.md)

## Before high-fidelity work

- Project `DESIGN.md` exists and defines: typefaces + reasons, type scale,
  palette with roles, spacing scale, radius/shadow language, motion language,
  imagery direction, voice. If missing → create it first.
- Research inputs reviewed (ux-researcher / research-agent output).

## While building UI

- Every element justifies itself (informs or enables — else delete).
- One spacing scale. One type scale. Accent color scarce.
- All states designed: empty, loading, error, success, hover, focus,
  active, disabled.
- `prefers-reduced-motion` respected; animation explains or gives feedback.
- Semantic HTML first; ARIA only where semantics fall short.
- Touch targets ≥44px; visible focus rings; WCAG 2.2 AA contrast.

## Mobile checklist (test at 320 / 375 / 390 / 430 / tablet / desktop / large)

- No horizontal overflow at any breakpoint.
- Typography remains readable (≥16px body, line length sane).
- Navigation usable one-handed; sticky CTA where the conversion path wants it.
- Forms usable with on-screen keyboard (correct input types, no zoom traps).
- Animations degrade gracefully; heavy media has mobile variants.
- 3D scenes have a static or lightweight mobile fallback.

## Before calling UI done

- Anti-slop gate run (`skills/design/anti-slop/`): scan → critique →
  improve → re-render → re-scan. Findings fixed, not argued away.
- Visual QA screenshots reviewed at all breakpoints.
- Copy is specific and human — no placeholder or generic AI copy.
