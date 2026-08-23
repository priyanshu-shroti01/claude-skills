# Claude OS — Agent Roster

Agent definitions live in two places, by design:

- `.claude/agents/<name>.md` — the operational definition Claude Code loads
  (frontmatter + system prompt). Kept lean.
- `agents/<name>/README.md` — the extended charter: mission, inputs/outputs,
  checklists, permission ceiling, escalation rules. Agents read their own
  charter at the start of a task (progressive disclosure).

Compatibility note: this file also serves tools that read a repo-root
`AGENTS.md`. The rules in `CLAUDE.md` apply to any agent operating here.

## Hierarchy

```
                         ┌───────────┐
                         │ COMMANDER │  orchestration, task state, gates
                         └─────┬─────┘
                    ┌──────────┴──────────┐
              ┌─────┴─────┐        ┌──────┴───────┐
              │SKILL ROUTER│        │ LEARNING AGENT│  (post-project)
              └───────────┘        └──────────────┘
   ┌────────────┬───────────────┬────────────────┬─────────────┐
 PRODUCT      DESIGN         ENGINEERING       QUALITY        GROWTH
 product-     design-director frontend-arch.   code-reviewer  growth-agent
 director     ux-researcher   frontend-eng.    security-agent lead-scout
 research-    ux-designer     backend-arch.    qa-agent       seo-agent
 agent        visual-designer backend-eng.     visual-qa      competitor-
              motion-director media-director   performance    agent
              3d-director     exploded-view-   accessibility
              anti-slop-agent director         production-agent
```

## Roster

| Agent | Role | Ceiling* |
|---|---|---|
| commander | Top-level coordination, delegation, gate enforcement | L3 |
| skill-router | Selects the minimal capability set for a task | L0 |
| product-director | Product strategy, scope, prioritization | L1 |
| design-director | Visual direction; enforces DESIGN.md | L1 |
| ux-researcher | User/competitor research, journeys, IA | L0 |
| ux-designer | Flows, wireframes, interaction design | L1 |
| visual-designer | High-fidelity visual design | L1 |
| frontend-architect | FE framework, structure, state, performance | L1 |
| frontend-engineer | Implements the frontend | L3 |
| backend-architect | APIs, data, auth, scalability design | L1 |
| backend-engineer | Implements backend systems | L3 |
| motion-director | Animation, transitions, micro-interactions | L1 |
| 3d-director | Three.js / R3F scenes, assets, performance | L2 |
| exploded-view-director | Interactive exploded product experiences | L2 |
| media-director | Identifies + specs generated visual assets | L2 |
| research-agent | Industry, technology, pattern research | L0 |
| competitor-agent | Structured competitor comparison | L0 |
| seo-agent | Technical SEO + GEO audits and fixes | L2 |
| accessibility-agent | WCAG conformance audits and fixes | L2 |
| security-agent | Security review; mandatory for production | L2 |
| code-reviewer | Independent implementation review | L0 |
| qa-agent | Functional testing | L2 |
| visual-qa-agent | Browser-automation visual verification | L2 |
| performance-agent | Lighthouse / web-vitals auditing | L2 |
| anti-slop-agent | Detects and rejects generic AI aesthetics | L0 |
| production-agent | Production-readiness verification, deploys | L4† |
| growth-agent | Analytics, conversion, opportunity analysis | L0 |
| lead-scout | Lawful public-data lead research | L0 |
| learning-agent | Post-project lessons, system improvement PRs | L3 |

\* Permission ceiling per `config/permissions/permission-levels.yaml`
(L0 read-only → L5 production). Ceilings are maximums, not defaults.
† production-agent may *prepare* L4/L5 actions; executing them requires
explicit human approval every time unless durably configured otherwise.

## Non-negotiables

- No agent approves its own work. Implementer ≠ reviewer, always.
- Reviewers (code-reviewer, security-agent, anti-slop-agent) are read-only in
  the artifact under review; they report findings, they don't patch them.
- Agents escalate scope changes to the Commander; they do not self-expand.
- Every agent respects `SECURITY.md` and the sensitive-action approval list.

## Invoking agents

In Claude Code, agents are available as subagents (from `.claude/agents/`).
The Commander delegates by launching the specialist with a task brief that
includes: goal, constraints, relevant files, expected output, and which gates
apply. Workflows (`workflows/`) define standard delegation sequences.
