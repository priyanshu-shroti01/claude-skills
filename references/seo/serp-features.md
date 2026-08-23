# Reference: SEO Quick Sheet — Metadata, Schema, GEO Surfaces

Working numbers and shapes for seo-agent. Skills carry the procedures;
this is the lookup table.

## Metadata dimensions

| Item | Spec |
|---|---|
| Title | ≤ 60 chars, unique, keyword natural, brand suffix optional |
| Meta description | ≤ 160 chars, answer-shaped, unique |
| OG image | 1200×630, ≤ 300KB, text-legible at thumbnail |
| Favicon set | SVG + 32/180(apple)/192/512 PNG + manifest |

## Schema.org page-type map (JSON-LD)

| Page | Schema |
|---|---|
| Site-wide | Organization (+ WebSite w/ SearchAction where real) |
| Article/blog | Article (author, datePublished, dateModified honest) |
| Product | Product + Offer (price/availability true) |
| FAQ section | FAQPage (only visibly-on-page Q&A) |
| Local business | LocalBusiness (NAP consistent everywhere) |
| Breadcrumbs | BreadcrumbList |
| How-to content | HowTo |

Rule: schema describes what the page visibly contains — nothing else.

## Indexing quick answers

- Custom 404 → HTTP 404 (not 200); removed content → 301 or honest 410.
- Redirect chains: max 1 hop; https + single host canonical.
- noindex: search results pages, thin utility pages, staging (always).
- Sitemap: only 200-status, indexable, canonical URLs; honest lastmod.

## GEO surfaces (2026 snapshot — recheck quarterly)

- AI answers favor: direct answer in first sentences under a
  question-shaped heading; passage-level self-containment; dated,
  unit-carrying facts; visible entity identity.
- `llms.txt`: emerging convention, adopt per project decision.
- AI-crawler robots policy (GPTBot, ClaudeBot, etc.): business decision —
  present the trade-off to the human, never default it.
