# Workflow: Feature Development

**Trigger**: adding a feature to an existing product.
**Orchestrator**: commander.

## Stages

1. **Define** — product-director: user story, acceptance criteria,
   success metric, explicit non-goals. *Gate: human confirms scope for
   non-trivial features.*
2. **Impact analysis** — knowledge graph: what the feature touches, what
   depends on those parts, migration/compat implications. Architects
   (frontend/backend as routed) rule on structure; ADR if the design is
   significant.
3. **Design** — routed by surface: UI features get ux-designer states +
   visual-designer treatment per the existing DESIGN.md (extensions to
   the language need design-director rulings); API features get contract
   design per api-standards.
4. **Build** — routed engineers on a feature branch, tests alongside code
   (unit + the acceptance criteria as executable checks where possible),
   conventions matched (inspect before writing).
5. **Review** — code-reviewer always; security-agent if auth/input/data/
   uploads/infra are touched.
6. **QA** — qa-agent: acceptance criteria verified in the running app +
   edge/failure paths; visual-qa on changed UI (scoped matrix);
   accessibility-agent on new interactive patterns.
7. **Integrate** — merge per git-rules (reviewed PR); feature flags for
   risky/partial features per project convention.
8. **Release** — per the project's release cadence; deployment-gates for
   production pushes. Success metric wiring verified (growth-agent gets
   the baseline).
9. **Learn** — notable lessons → learning-agent.

## Rules

- Acceptance criteria are the QA contract — unmet criteria mean not done,
  regardless of effort.
- Scope creep discovered mid-build returns to stage 1, not into the diff.
