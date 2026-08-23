---
name: video-generation
description: The video generation pipeline - brief, storyboard, keyframes, generation via provider abstraction, compression, poster, responsive fallback, integration, QA. Use when the media-director commissions motion media.
---

# Video Generation

Pipeline: **brief → storyboard → keyframes → generation → compression →
poster frame → responsive fallback → integrate → QA.** Run under
media-director direction, through the provider abstraction only.

## 0. Gate

- Would CSS/SVG/Canvas/Lottie animation serve better? (UI motion,
  illustration animation, data movement → code: smaller, crisper,
  interruptible.) Video is for photographic/cinematic content.
- Concrete slot + purpose? Autoplaying decoration must survive the
  motion-director's "what does this explain?" test.

## 1. Brief

Purpose/slot · duration target (loops: 5–15s) · what happens (subject,
motion, camera) · mood/palette per DESIGN.md imagery direction · audio
stance (web autoplay ⇒ designed-for-silence) · loop or one-shot.

## 2–3. Storyboard & keyframes

- Storyboard: beats with timing (“0–2s establish, 2–5s reveal…”); for
  loops, last frame → first frame continuity planned.
- Keyframes: generate/select stills anchoring look and composition
  (image-generation pipeline) before spending on motion.

## 4. Generation

Via `VIDEO_PROVIDER` per `config/providers/media.yaml`; record prompt/
inputs, provider+model, date, license notes. Unavailable → STATUS:
BLOCKED, never hardcode a provider.

## 5–7. Compression, poster, fallback

- Encode for web: H.264/AV1 per project support matrix, target ≤2–4MB for
  ambient loops, resolution matched to rendered size, no audio track on
  muted-autoplay media.
- Poster frame: chosen (not first-frame-by-accident), optimized — it's
  the LCP candidate and the reduced-motion/mobile stand-in.
- Fallbacks: `prefers-reduced-motion` → poster; constrained
  mobile/data-saver → poster or smaller variant per project policy.

## 8–9. Integrate + QA

`muted playsinline` (+ `autoplay loop` only if the design ruling says so),
`preload="none"`/lazy off-viewport, controls where content warrants,
captions/transcript where speech exists (accessibility gate) → QA:
playback across viewports, loop seam, poster correctness, reduced-motion
path, weight vs. performance budget.
