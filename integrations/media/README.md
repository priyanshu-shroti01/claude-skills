# Integration: Media generation (images + video)

**Status: optional** — off until a provider is configured.
Provider abstraction: `config/providers/media.yaml` (the only place
providers are named). Pipelines: `skills/media/`.

## Configure

```bash
# .env
MEDIA_PROVIDER=gemini   # or openai — see config/providers/media.yaml
IMAGE_API_KEY=…
VIDEO_PROVIDER=gemini
VIDEO_API_KEY=…
```

Unconfigured → pipelines emit `STATUS: BLOCKED (provider unconfigured)`
and the media-director falls back to CSS/SVG/code where possible.

## Evaluated tooling (registry: config/skills/external-skills.yaml)

| Tool | Status | Note |
|---|---|---|
| guinacio/claude-image-gen (MIT) | evaluation | small community project; Gemini+OpenAI routing; fits our abstraction |
| xbill9/omni-skill-claude (Apache-2.0) | evaluation (reference only) | 1-commit personal demo — read its approach, don't depend on it |
| oso95/scroll-world (MIT) | optional | scroll-scrubbed video pages; requires paid per-clip generation services |

Direct provider APIs through our own pipeline code are the default path;
the evaluated tools are conveniences to adopt only after review.

## Claude OS rules

- Generation is metered money: no speculative batches
  (media-director charter).
- Every generated asset records prompt, provider+model, date, and the
  provider's usage-license notes.
- Provider terms govern commercial use — check before shipping client
  work with generated assets.
- Honesty rules for product imagery: `skills/3d/exploded-views` (never
  present artwork as mechanical truth).
