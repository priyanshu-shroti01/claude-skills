# Workflow: SEO Audit

**Trigger**: scheduled audit, ranking drop, pre-launch, or human request.
**Lead**: seo-agent.

## Stages

1. **Baseline** — Search Console data where connected (queries,
   impressions, CTR, coverage/indexing reports); otherwise state the
   blind spots. Current sitemap/robots fetched from the live site.
2. **Crawl & inventory** — walk the rendered site: page inventory,
   indexability per page, orphans, redirect behavior, 404 handling.
3. **Technical sweep** — the technical-seo checklist site-wide + per key
   template: titles/descriptions uniqueness, canonicals, OG/Twitter,
   heading hierarchy, structured data validation, image SEO, internal
   linking.
4. **GEO sweep** — the geo skill on money/content pages: answer-shaped
   structure, chunk independence, entity clarity, extractable facts;
   AI-assistant citation spot-checks where tooling allows (dated).
5. **Speed overlap** — pull Core Web Vitals from performance-agent's
   latest report (or commission one) — don't duplicate the measurement.
6. **Competitive context** — competitor-agent's SEO dimension for the
   top 2–3 competitors: where they're structurally ahead.
7. **Report** — findings as PASS/WARN/FAIL with location + evidence,
   prioritized: indexing blockers → representation (titles/schema/CTR
   mismatches) → enhancement (links, GEO, image SEO). Each with its
   concrete fix.
8. **Fix & verify** — approved fixes implemented (normal review path);
   re-verified on rendered pages; coverage/indexing rechecked at the next
   data refresh (continuous-growth tracks movement).

## Rules

- Rendered-page evidence only; no PASS from source or memory.
- White-hat only — no keyword stuffing, cloaking, schema
  misrepresentation, regardless of competitor behavior.
