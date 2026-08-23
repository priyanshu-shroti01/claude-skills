# Template: Website project

For content/marketing websites. Default stack: Next.js (static-first) —
see `../nextjs`. Use Astro-class alternatives when the site is purely
content and the human prefers it (architect ruling + ADR).

## Init

Follow `../nextjs/README.md`, then:

```bash
<claude-os>/scripts/project-init.sh <dir>
```

and run the **new-website workflow** (`workflows/new-website/`) — it
sequences research → design language → UX → build → the full gate
battery.

## Website-specific requirements (beyond the stack defaults)

- Every PRODUCTION_READINESS.md §A item applies (404, meta per page, OG
  images, favicon set, robots, sitemap, alt text, breakpoints, sticky
  mobile CTA where the conversion path wants it, loading/error states,
  thank-you page, legal pages ⚑, analytics, business info ⚑, compressed
  images).
- SEO + GEO skills from the start — retrofitted metadata is always worse.
- Anti-slop gate in strict rotation: this is the surface where generic
  AI aesthetics are most likely and most damaging.
- Performance budgets are launch gates (LCP ≤2.5s mobile on real
  throttling).
