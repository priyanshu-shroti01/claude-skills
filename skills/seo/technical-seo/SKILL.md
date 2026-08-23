---
name: technical-seo
description: Technical SEO audit and implementation - metadata, canonicals, sitemaps, robots, structured data, headings, internal links, image SEO, indexing health. Use for SEO audits and when building public pages.
---

# Technical SEO

Make every page findable, correctly represented, and index-healthy —
verified on the rendered page, never source alone. Run by seo-agent.

## Per-page checklist

- [ ] Title: unique, ≤60 chars, page-specific keyword naturally placed
- [ ] Meta description: unique, ≤160 chars, answer-shaped, click-worthy
- [ ] Canonical URL present, absolute, self-referencing unless variant
- [ ] Open Graph: og:title/description/image (1200×630)/url/type;
      Twitter card tags
- [ ] Exactly one H1; H2–H4 hierarchy logical, no skipped levels
- [ ] Images: descriptive kebab-case filenames + purposeful alt text
- [ ] Internal links: meaningful anchors (never "click here"), no orphans
- [ ] Structured data for the page type (below), validated

## Site-level checklist

- [ ] robots.txt: correct allow/disallow, sitemap directive, nothing
      important blocked
- [ ] sitemap.xml: all indexable pages, no 404/redirected/noindexed
      entries, lastmod honest
- [ ] Redirects: 301 for permanent, no chains (max 1 hop), no soft-404s
- [ ] Custom 404 returns HTTP 404 (not 200)
- [ ] HTTPS + single canonical host (www or apex, one wins)
- [ ] Pagination/faceted URLs: canonical + robots strategy decided
- [ ] Indexing intent explicit: noindex on search/utility/thin pages

## Structured data (JSON-LD)

Organization/WebSite site-wide; then per page type: Article, Product,
FAQPage, BreadcrumbList, LocalBusiness, HowTo as honestly applicable.
Rules: validate (Rich Results test-equivalent), never mark up content the
page doesn't visibly contain, keep in sync with page edits.

## Verification method

1. Crawl or walk the rendered site (browser tooling) — JS-rendered meta
   counts only if it actually renders.
2. Score each item PASS/WARN/FAIL with location + evidence.
3. Prioritize: indexing blockers → representation (titles/schema) →
   enhancement (links, image SEO).
4. After fixes: re-verify rendered, and confirm no new issues introduced.

Speed and Core Web Vitals matter to ranking — coordinate with
performance-agent rather than duplicating its audit. GEO/AI-search:
see the `geo` skill.
