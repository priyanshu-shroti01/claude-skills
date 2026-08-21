# Workflow: New Website

**Trigger**: building a website (marketing, brochure, content, standard
product site). **Orchestrator**: commander.
**Output**: a production-ready website passing all applicable gates.
For flagship experiential builds, use `premium-website` instead.

## Stages

1. **Foundation** — `new-project` workflow stages 1–5 (init, brief,
   research, plan, design language). *Gates: human-approved brief + scope.*
2. **UX structure** — ux-researcher (journeys, IA, conversion paths) →
   ux-designer (flows, wireframes, page structures, all states spec'd).
3. **Visual design** — visual-designer: tokens + high-fidelity pages per
   DESIGN.md; media-director inventories needed assets (CSS/SVG-first
   ruling per asset). *Gate: design-review by design-director.*
4. **Build** — frontend-engineer implements (frontend-standards,
   component-quality); motion-director specs/reviews motion; seo-agent
   requirements built in (not bolted on); media assets produced via their
   pipelines as slots demand.
5. **Review** — code-reviewer (always); security-agent (forms, any
   backend/API, headers — mandatory for production).
6. **QA battery** — qa-agent (functional: flows + forms + states) and
   visual-qa-agent (full matrix) in parallel.
7. **Audit gates** — accessibility-agent (WCAG 2.2 AA), seo-agent
   (technical-seo + geo), performance-agent (budgets). Findings loop to
   stage 4 owners; gates re-run.
8. **Anti-slop gate** — anti-slop-agent: scan → critique → improve →
   re-render → re-scan until pass.
9. **Production check** — production-agent audits PRODUCTION_READINESS.md
   with evidence. *Gate: human approval for deploy (L4 staging, then L5).*
10. **Deploy & verify** — deployment-gates skill; post-deploy
    verification; monitoring confirmed.
11. **Learn** — learning-agent retrospective; memory updated.

## Rules

- Stage 4 never starts before stage 3's design-review gate.
- "The site runs" completes stage 4, nothing else — stages 5–9 are where
  done lives.
- Gate evidence attached in the task ledger per quality-pipeline.
