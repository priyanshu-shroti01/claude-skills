---
name: production-readiness
description: Auditing a project against PRODUCTION_READINESS.md with evidence per item. Use before any release and for the production-audit workflow.
---

# Production Readiness Audit

Verify the project against `PRODUCTION_READINESS.md` (the project's own
copy if present — project-init installs one). Run by production-agent.
The checklist file is the source of truth; this skill is the *method*.

## Method

1. **Scope**: which sections apply (a static marketing site skips parts
   of §E; an app with accounts skips nothing). N/A requires a reason, per
   item.
2. **Evidence per item — never memory or claims**:
   - File items (robots.txt, favicon set, 404 page): show the file/route
     and its correctness, not just existence.
   - Rendered items (meta per page, OG images, alt text): inspect the
     rendered pages (browser tooling); spot-check ≥ the key templates ×
     representative pages.
   - Behavioral items (form errors, loading states, redirects, 404/500):
     trigger them and observe.
   - Measured items (performance budgets, image weights): cite the
     measurement (performance-agent report or fresh run).
   - Gate items (§C): cite each gate's report artifact — a gate without
     evidence didn't run.
   - ⚑ legal/business items (privacy policy, terms, cookie consent,
     business info): verify presence and surface to the human for
     substance — never rule on legal adequacy.
3. **Record**: mark each item DONE / N/A(reason) / BLOCKED(reason+alt) /
   OPEN in the project's checklist file, with the evidence reference.
4. **Recommend**: release recommendation = ready / ready-with-risks
   (enumerated) / not-ready (blocking items listed). The decision is the
   human's.

## Rules

- An unmarked item is OPEN, and OPEN blocks the "ready" recommendation.
- Evidence gathered this release — prior releases' evidence expires.
- Fixing findings is the owners' work; the auditor re-verifies (no
  self-certification by implementers, no patching by the auditor).
