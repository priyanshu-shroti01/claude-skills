# Media Generation Guide

Provider-abstracted image/video generation, directed by the
media-director, executed through pipelines. Nothing generates without a
concrete slot and a brief tied to the project's design language.

## The pieces

| Piece | Where |
|---|---|
| Provider abstraction (the only place providers are named) | `config/providers/media.yaml` + `MEDIA_PROVIDER`/`VIDEO_PROVIDER` env |
| Image pipeline (brief→prompt→generate→optimize→alt→integrate→QA) | `skills/media/image-generation` |
| Video pipeline (brief→storyboard→keyframes→generate→compress→poster→fallback→QA) | `skills/media/video-generation` |
| Direction, gap analysis, asset conventions | `agents/media-director` |
| Evaluated tooling + credentials | `integrations/media/README.md` |

## The decision ladder (why generation is last)

1. **Code** (CSS/SVG/canvas): patterns, gradients, icons, simple
   illustration, charts — sharper, lighter, themeable.
2. **Real assets**: client photography, existing brand material.
3. **Generate** — only for a concrete slot, per the DESIGN.md imagery
   direction, through the abstraction.

Unconfigured provider → pipelines emit `STATUS: BLOCKED` and fall back
up the ladder. They never hardcode around it.

## Asset discipline

Descriptive kebab-case filenames · organized per purpose · originals
separate from optimized derivatives · modern formats + responsive sizes
to budget (references/engineering/performance-budgets.md) · alt text
written for page context · per-asset record: prompt, provider+model,
date, license notes.

## Honesty rules

Generated product imagery never claims mechanical/structural accuracy
(exploded-views skill governs); illustrative assets are labeled as such
where a viewer could be misled.
