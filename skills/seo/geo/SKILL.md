---
name: geo
description: Generative Engine Optimization - structuring content so AI search engines and assistants can extract, attribute, and cite it. Use alongside technical-seo for public content.
---

# GEO — Generative Engine Optimization

Classic SEO earns the ranking; GEO earns the citation. AI search engines
and assistants extract answers — content must be extractable, attributable,
and worth citing.

## Content structure for extraction

- **Answer-first sections**: question-shaped H2/H3s with a direct,
  self-contained answer in the first 1–2 sentences below, then depth.
- **Chunk independence**: each section comprehensible alone (AI retrieval
  is passage-level); avoid "as mentioned above" dependencies.
- **Facts in extractable shapes**: definitions, steps, comparisons and
  specs in lists/tables near clear headings; numbers with units and dates.
- **FAQ blocks** for real recurring questions (with FAQPage schema, when
  visibly on the page).

## Attribution & entity clarity

- The site states plainly who/what the entity is: name, what it does, for
  whom, where — consistently across pages (and in Organization schema).
- Claims worth citing carry their evidence inline (data, dates, sources) —
  models prefer citable specificity over marketing prose.
- Author/expertise signals where content benefits (bios, credentials,
  updated dates kept honest).

## Technical enablers

- Clean semantic HTML (extraction quality tracks markup quality).
- Structured data honest and complete (shared foundation with
  technical-seo).
- `llms.txt` where the project adopts it: site purpose + key page map.
- Crawler access policy decided *by the human*: which AI crawlers
  robots.txt allows/blocks is a business decision — present the trade-off,
  don't default it.

## Verification

- Sample key pages: can a passage answer the target question standalone,
  with the brand attributable from the passage or its immediate context?
- Ask assistants the money questions (where tooling allows) and note
  whether/how the site is cited — dated snapshot, tracked over time by
  growth-agent.

## Rules

Same integrity bar as SEO: no fabricated facts or credentials, no schema
misrepresentation, no invisible-text games. Being the best extractable
answer is the whole strategy.
