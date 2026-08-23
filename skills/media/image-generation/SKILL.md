---
name: image-generation
description: The image generation pipeline - brief, prompt, generate via provider abstraction, save, optimize, metadata, alt text, integrate, QA. Use when the media-director commissions raster imagery.
---

# Image Generation

Pipeline: **brief → prompt → generate → save → optimize → metadata →
alt text → integrate → visual QA.** Run under media-director direction,
through the provider abstraction only.

## 0. Gate (before anything generates)

- Would CSS/SVG/code serve better? (Patterns, gradients, icons, simple
  illustration, charts → code. Sharper, lighter, themeable.)
- Does a real asset exist (brand photography, product shots)?
- Is the need concrete (a specific slot on a specific page)? No
  speculative batches.

## 1. Brief (from media-director, tied to project DESIGN.md)

Subject · purpose/slot (hero, card, background, OG image…) · composition
(crop behavior at target aspect ratios, focal point, negative space for
overlaid text) · mood/lighting per imagery direction · palette anchors ·
what must NOT appear (text-in-image, brand violations, clichés).

## 2. Prompt

Translate the brief: subject + composition + style/medium + lighting +
palette + quality modifiers; explicit negatives for the brief's
exclusions. Record the final prompt with the asset (reproducibility).

## 3. Generate

Via the provider abstraction (`config/providers/media.yaml`,
`MEDIA_PROVIDER` env) — project code and skills never name a provider.
Provider unavailable/unconfigured → STATUS: BLOCKED, note what's needed;
never hardcode around it.

## 4–6. Save, optimize, metadata

- Save original to the project's asset source dir; descriptive kebab-case
  name (`hero-workshop-overhead-warm.png`), organized per media-director
  conventions.
- Derivatives: modern format (AVIF/WebP + fallback per project), sized
  variants for the layout's actual rendered sizes, compressed to budget
  (PRODUCTION_READINESS.md §D).
- Record: prompt, provider+model, date, intended slot, license/usage
  notes per provider terms.

## 7. Alt text

Written for the *page context*, not the generation prompt: what the image
communicates where it sits. Decorative → explicit empty alt. Exploded/
concept art → honesty rules from the exploded-views skill apply.

## 8–9. Integrate + QA

Correct slot, responsive `srcset`/sizes, dimensions set (no CLS), lazy/
priority per position → visual-qa pass at the standard viewports
(legibility of overlaid text, crop behavior, dark-mode treatment).
