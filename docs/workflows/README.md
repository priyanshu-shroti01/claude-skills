# Workflows Guide

Workflows are staged processes with owners and gates —
`workflows/<name>/WORKFLOW.md`. The commander drives them; the
quality-pipeline skill defines what a gate means (evidence, independence,
failure loops).

## Choosing a workflow

| Situation | Workflow |
|---|---|
| Brand-new anything | new-project (then hands off) |
| Standard website | new-website |
| Flagship experiential site | premium-website |
| Overhaul of an existing site | redesign |
| Taking a product public | product-launch |
| Defect | bug-fix |
| Adding to an existing product | feature-development |
| Security check | security-audit |
| Rendering check | visual-audit |
| Search visibility check | seo-audit |
| WCAG check | accessibility-audit |
| Speed check | performance-audit |
| Pre-release full check | production-audit |
| Recurring optimization | continuous-growth |
| Unattended server runs | overnight-improvement |

## Shape of a workflow file

Trigger + orchestrator/lead → numbered stages (each with owning agents,
outputs, and gates marked) → rules (the bright lines for that workflow).
Stages reference skills for the *how* — workflows sequence, skills
execute.

## Universal rules

- A stage's gate failing returns work to the stage owner; failing twice
  on the same finding escalates to the human.
- Gate evidence is recorded in the task ledger (quality-pipeline format).
- Deployment stages are always human-approved (L4/L5), in every workflow.
- Audit workflows never patch what they audit — findings go to owners.

## Writing a new workflow

Copy the closest existing file; keep the stage/owner/gate discipline;
register in `SYSTEM_MANIFEST.yaml`; `scripts/verify.sh --section
workflows` and `tests/workflows/` must pass (they check for a Stages
section and a named orchestrator).
