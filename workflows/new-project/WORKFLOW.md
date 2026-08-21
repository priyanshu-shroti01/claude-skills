# Workflow: New Project

**Trigger**: starting any new project (app, site, service) from scratch.
**Orchestrator**: commander. **Output**: an initialized, planned project
ready for its build workflow.

## Stages

1. **Initialize** — run `scripts/project-init.sh <path>`: project Claude
   config, CLAUDE.md, DESIGN.md, PRODUCTION_READINESS.md copies, memory +
   graph setup. *Gate: doctor passes in the project.*
2. **Discover** — commander + product-director: goal, audience, success
   metrics, constraints; skill-router runs and records the routing.
   *Gate: human confirms the product brief.*
3. **Research** — research-agent (research-intelligence), competitor-agent
   if a market exists. *Output: research packet.*
4. **Plan** — product-director scopes v1; architects (frontend/backend as
   routed) choose the stack from `templates/` + ADRs; graph generated for
   any existing code. *Gate: human approves scope + stack.*
5. **Design foundation** — design-director creates the project DESIGN.md
   (design-direction skill) for any user-facing work.
6. **Handoff** — commander opens the task ledger and hands to the build
   workflow that fits (`new-website`, `feature-development`, …).

## Rules

- No implementation before stage 4's gate — code written before scope is
  approved is speculation.
- Every stage's artifact is committed (git-rules) before the next begins.
