# Workflow: Production Audit

**Trigger**: before any production deployment (mandatory), or as a
standing health review of a live product. **Lead**: production-agent.

## Stages

1. **Checklist audit** — the production-readiness skill against the
   project's PRODUCTION_READINESS.md copy: every applicable item verified
   with evidence (files shown, pages rendered, behaviors triggered,
   measurements cited). Output: DONE / N-A(reason) / BLOCKED(reason+alt) /
   OPEN per item.
2. **Gate verification** — each quality-pipeline gate's report artifact
   located and current for this release: code review, security, functional
   QA, visual QA, accessibility, SEO, performance, anti-slop. Missing or
   stale artifact = the gate didn't run = OPEN.
3. **Operations verification** — §E items live-checked: error tracking
   receives a test event; monitoring/uptime configured and alerting to a
   real destination; logs flowing, secret/PII-free on inspection; backup
   exists AND restore path documented (tested where the platform allows);
   rollback procedure written for the pending deploy.
4. **Environment check** — env vars present per name-checklist in the
   target environment (values never displayed); no secrets in client
   bundles (build output scanned); DNS/TLS/redirect posture correct.
5. **⚑ Legal/business surfacing** — privacy policy, terms, cookie
   consent, business info: presence verified, substance explicitly
   handed to the human — the audit never rules on legal adequacy.
6. **Release recommendation** — ready / ready-with-risks (each risk
   enumerated with its owner) / not-ready (blocking items). Delivered to
   the human with the full evidence table.
7. **Decision & deploy** — the human decides. Approved → the
   deployment-gates skill takes over (staging → verify → L5 approval →
   production → verify → monitor).

## Rules

- Prior releases' evidence expires — every audit gathers fresh evidence.
- The auditor never patches findings (owners fix, auditor re-verifies).
- OPEN items ship only by explicit, per-item human waiver.
