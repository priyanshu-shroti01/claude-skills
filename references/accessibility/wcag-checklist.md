# Reference: WCAG 2.2 AA Working Checklist

The accessibility-agent's working distillation. Authority of record:
https://www.w3.org/TR/WCAG22/ and https://www.w3.org/WAI/WCAG22/quickref/.
Criteria cited by number so findings are traceable.

## Perceivable

- 1.1.1 Non-text content: purposeful alt text; decorative → `alt=""`.
- 1.3.1 Info & relationships: semantic structure (headings, lists,
  landmarks, table headers, label associations).
- 1.3.4 Orientation: no forced orientation.
- 1.4.1 Use of color: color never the only signal.
- 1.4.3 Contrast (minimum): text 4.5:1, large text 3:1 — **measured**.
- 1.4.4 Resize text: 200% zoom without loss.
- 1.4.10 Reflow: 320px width without 2D scrolling.
- 1.4.11 Non-text contrast: UI components/graphics 3:1.
- 1.4.12 Text spacing: survives user spacing overrides.

## Operable

- 2.1.1 Keyboard: everything operable; 2.1.2 no traps.
- 2.4.1 Bypass blocks: skip link.
- 2.4.2 Page titled; 2.4.4 link purpose from text; 2.4.6 headings/labels
  descriptive.
- 2.4.7 Focus visible; **2.4.11 Focus not obscured (new in 2.2)**.
- 2.5.7 Dragging movements have single-pointer alternative (2.2).
- 2.5.8 Target size minimum 24×24 CSS px (2.2) — Claude OS ships 44px.
- 2.3.3 / motion: honor `prefers-reduced-motion` (ties to 2.3.1 flashes:
  none over 3/s).

## Understandable

- 3.1.1 Page language set.
- 3.2.1/3.2.2 No surprise context changes on focus/input.
- 3.3.1 Errors identified; 3.3.2 labels/instructions; 3.3.3 suggestions.
- **3.3.7 Redundant entry (2.2)**: don't ask twice in one process.
- **3.3.8 Accessible authentication (2.2)**: no cognitive-test-only auth.

## Robust

- 4.1.2 Name/role/value correct in the accessibility tree.
- 4.1.3 Status messages announced (live regions) without focus theft.

## Claude OS additions above AA

Touch targets ≥44px · visible focus designed (not browser default) ·
forms never placeholder-labeled · screen-reader narrative pass on key
pages (agent protocol in `agents/accessibility-agent/README.md`).
