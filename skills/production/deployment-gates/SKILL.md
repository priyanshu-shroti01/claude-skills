---
name: deployment-gates
description: Deployment procedure and gates - preparation, staging verification, approval mechanics, production execution, post-deploy verification, rollback. Use for any L4/L5 deployment.
---

# Deployment Gates

Deployments are prepared by agents and authorized by humans — every time.
Run by production-agent. L4 = staging, L5 = production
(`config/permissions/permission-levels.yaml`).

## Preconditions (before requesting approval)

- [ ] Production-readiness audit complete (production-readiness skill),
      recommendation attached.
- [ ] All applicable quality-pipeline gates green with evidence.
- [ ] Deploy plan written: steps in order, migrations (each destructive
      one separately flagged for its own approval), config/env changes
      (names only), expected downtime (target: none).
- [ ] **Rollback procedure written**: exact steps, tested where the
      platform allows, including data rollback stance for any migration.
      No rollback path → no deploy. Hard stop.
- [ ] Env var checklist verified against the target environment (names
      present, sources documented — values never displayed).

## Approval mechanics

- Request states: what deploys (commit/tag), where, the plan, the
  rollback, the risks. Human answers explicitly; silence ≠ consent.
- Approval is per-deployment and per-environment. Staging approval does
  not imply production approval. Yesterday's approval is dead.
- Record: what/when/who approved, in the project log.

## Execution order

1. **Staging (L4)**: deploy → verify: smoke tests, health endpoint, key
   flows (qa-agent's critical path), error tracker quiet, logs sane.
2. **Production (L5, second approval)**: deploy → verify same set +
   analytics firing + certificate/redirect sanity → monitor window
   (watch error rates/vitals for the agreed period).
3. **Record** the deploy artifact: version, time, verification results,
   anomalies.

## Failure handling

Post-deploy verification fails → execute the rollback plan immediately,
then diagnose. Never debug live in production; never "quick-fix forward"
without a fresh approval. Rollback executed → incident note (what, why,
learning-agent follow-up).

## Standing rule

No autonomous deployment exists in Claude OS. `auto_deploy_*` feature
flags default off; only the human may change them, and L5 approval-per-
deploy survives even then unless the human durably configures otherwise
in `config/permissions/`.
