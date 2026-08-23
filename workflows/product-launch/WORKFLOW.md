# Workflow: Product Launch

**Trigger**: taking a built product/site to public launch.
**Orchestrator**: commander. Assumes a build workflow delivered the
product; this workflow makes launch day boring.

## Stages

1. **Launch definition** — product-director: launch scope, date target,
   success metrics (first-week numbers that would mean "worked"),
   channels. *Gate: human signs the launch brief.*
2. **Launch surfaces** — as routed: landing/announcement pages (through
   `new-website` gates — launch pages are not exempt from quality),
   OG/social images (media-director), email/social copy drafts (voice per
   DESIGN.md; **sending is human-owned** — mass outreach is
   approval-gated, always).
3. **Measurement rig** — growth-agent: analytics events for the launch
   funnel verified firing end-to-end, Search Console submitted, error
   tracking + uptime monitoring confirmed live (not just installed),
   dashboards/queries ready so launch-day questions have answers.
4. **Hardening** — security-agent full review; performance-agent under
   expected-load assumptions (caching/CDN posture confirmed); seo-agent
   final crawl; production-agent runs the complete
   PRODUCTION_READINESS.md audit. *Gate: all green or human-waived
   line-by-line.*
5. **Rehearsal** — deploy to staging via deployment-gates; qa-agent walks
   every money path; rollback procedure actually exercised where the
   platform allows.
6. **Launch** — L5 approval → production deploy → immediate verification
   (deployment-gates) → monitoring window with agreed check-ins; a
   launch-day issue triggers `bug-fix` at priority, or rollback per plan.
7. **Post-launch** — at +48h and +1 week: growth-agent reports against
   the success metrics; findings feed `continuous-growth`;
   learning-agent retrospective.

## Rules

- Launch date pressure never waives gates — scope shrinks instead
  (product-director's call to make, human's to approve).
- Every outbound communication (email blasts, social posts) is drafted by
  agents, sent by humans.
