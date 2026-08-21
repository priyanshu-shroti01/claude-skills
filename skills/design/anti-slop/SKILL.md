---
name: anti-slop
description: The anti-AI-slop detection checklist and gate procedure - identify generic AI aesthetics in rendered UI and drive the improve/re-render/re-scan loop. Mandatory gate for user-facing UI.
---

# Anti-Slop Gate

Detect and eliminate generic AI-generated aesthetics. Run by the
anti-slop-agent on **rendered output** (screenshots, mobile + desktop
minimum). The gate is a loop: scan → critique → improve → re-render →
re-scan, until pass or explicit human waiver.

## Detection checklist

Score each cluster 0 (clean) / 1 (present) / 2 (defining feature).
Total ≥4, or any single 2 on Composition or Content → FAIL.

**Composition**
- Centered hero, one-liner, two buttons, product screenshot below.
- Three-identical-cards feature rows; icon-title-blurb repetition.
- Default SaaS shell (navbar-hero-logos-features-testimonials-CTA-footer
  in exactly that order with nothing distinctive).
- Every section symmetric, same width, same rhythm — no tension anywhere.

**Surface**
- Purple/blue gradients (or any gradient) as default decoration.
- Glassmorphism without a layering reason; frosted cards on frosted cards.
- Floating blurred blobs / meaningless mesh backgrounds.
- Uniform rounded corners on everything; drop-shadow soup.
- Decorative elements that answer no question and enable no action.

**Typography**
- No discernible scale; hierarchy by boldness alone; system-default feel.
- Centered long-form text; gradient text on headlines.

**Motion**
- Entrance animations on every element; parallax without narrative;
  hover lifts on non-interactive cards.

**Content**
- Generic copy: "Empower your workflow", "Built for the modern team".
- Interchangeable value props that fit any product; filler testimonials,
  fake-looking logo walls, lorem-adjacent text.

**Meta-test**: swap the logo for a competitor's. If the page still works,
it fails — the design carries no identity.

## Critique format (per finding)

```
ELEMENT: <where>
READS AS SLOP BECAUSE: <which pattern above>
REPLACE WITH: <concrete direction, tied to the project DESIGN.md>
```

## Improvement heuristics

- Add a point of view before adding polish: asymmetry with purpose, a
  dominant typographic moment, one signature interaction.
- Delete before decorating: slop is often camouflage for missing content.
- Specificity kills genericness: real numbers, real screenshots, real
  language beat any gradient.

## Pass conditions

Total score ≤3, no cluster at 2, meta-test passed, and a one-paragraph
"why this passes" note recorded. The human may waive residual findings;
the agent may not.
