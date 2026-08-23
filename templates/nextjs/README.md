# Template: Next.js project

Sanctioned starting point for Next.js work. We deliberately do **not**
vendor a scaffold — `create-next-app` is canonical and vendored copies go
stale. Initialize fresh, then apply Claude OS.

## Init

```bash
npx create-next-app@latest <name> --typescript --eslint --app --src-dir --no-interactive
cd <name>
<claude-os>/scripts/project-init.sh .
```

## Claude OS defaults for Next.js

- **Rendering**: static/SSG for marketing content, dynamic only where data
  demands (frontend-architect rules per route; record in an ADR).
- **Components**: server components by default; `"use client"` is a
  justified exception, pushed to the leaves.
- **Styling**: project choice, recorded in DESIGN.md tokens; shadcn/ui
  sanctioned as raw material (`npx shadcn@latest init`) — retheme before
  use (component-quality skill).
- **Images/fonts**: `next/image` + `next/font` always; no raw `<img>` for
  content images.
- **Metadata**: the Metadata API per page (technical-seo checklist);
  sitemap + robots via the framework conventions.
- **State/data**: framework primitives first (server actions/fetch cache);
  client state libraries need an architect ruling.
- **3D (if routed)**: `@react-three/fiber@9` + `@react-three/drei@10`
  (React 19 pairing), Canvas dynamically imported (r3f-scenes skill).

## Gates

Standard web battery applies (new-website workflow): a11y, SEO, perf
budgets (LCP ≤2.5s mobile), visual QA matrix, anti-slop.
