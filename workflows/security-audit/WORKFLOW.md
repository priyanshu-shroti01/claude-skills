# Workflow: Security Audit

**Trigger**: scheduled audit, pre-launch hardening, post-incident review,
or human request. **Lead**: security-agent (read-only against the
artifact; fixes go to owners).

## Stages

1. **Scope & threat model** — with the human: systems in scope, data
   classes at stake, attacker profiles worth defending against, explicit
   out-of-scope. *Gate: human confirms scope — audits don't self-expand.*
2. **Surface mapping** — knowledge graph + inspection: entry points,
   trust boundaries, auth chokepoints, data flows, third-party calls,
   secrets touchpoints.
3. **Category sweep** — the secure-coding checklist, category by
   category (injection, XSS, CSRF, SSRF, authn/authz, headers/CSP/CORS,
   rate limiting, uploads, deserialization, info leakage, logging).
   Verdict per category: clean / findings / N-A-because.
4. **Secrets & repo hygiene** — secrets-hygiene: tree scan, history
   spot-check, `.env` handling, client-bundle audit for leaked config.
5. **Dependency audit** — lockfile review: known CVEs (`npm audit`-class
   tooling), unmaintained packages, install scripts, license drift
   against docs/dependencies.md conventions.
6. **Infrastructure posture** — headers live-checked on the running site,
   TLS/redirect behavior, error pages (no stack traces), backup/monitoring
   claims verified against PRODUCTION_READINESS.md §E.
7. **Report** — per finding: severity (critical/high/medium/low) |
   location | exploit scenario | concrete fix. Plus: what was checked and
   found clean (the audit's coverage claim). Critical/high → human
   immediately, not at report time.
8. **Remediate & verify** — owners fix per priority; security-agent
   re-verifies each finding and closes it explicitly. Critical findings
   block any pending deploy.
9. **Learn** — systemic causes → learning-agent (new rule, checklist
   item, or hook candidate — proposed, human-approved).

## Rules

- Read-only testing by default; anything intrusive (even in staging)
  needs explicit human approval first.
- No working exploits for unpatched issues in shared artifacts.
