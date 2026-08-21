# Workflow: Continuous Growth

**Trigger**: recurring (weekly/monthly per project), or after launches and
redesigns. **Lead**: growth-agent. **Orchestrator**: commander for any
resulting build work.

## Cycle

1. **Ingest** — what's connected, gathered fresh: analytics (traffic,
   sources, funnels), Search Console (queries, CTR, coverage), error
   tracker, vitals field data. Unconnected sources named as blind spots —
   never fabricated.
2. **Inspect** — the live site: money-path walk-through (as a skeptical
   first-timer), sampled page quality, anything shipped since last cycle
   verified live.
3. **Compare** — against the previous cycle's snapshot: metric movement,
   shipped-recommendation outcomes (did the thing we changed move its
   success metric?), ranking/citation movement.
4. **Scan outward** — competitor movement (competitor-agent, light pass),
   SERP/AI-answer presence spot-checks, category content trends.
5. **Audit sampling** — rotate one deep audit per cycle (SEO →
   performance → accessibility → visual → security …) so every area gets
   periodic depth without auditing everything every time.
6. **Synthesize** — growth-analysis skill: funnel, leaks, diagnoses,
   opportunities → prioritized recommendations
   (impact × confidence ÷ effort), each a ready task brief with a success
   metric.
7. **Decide** — recommendations to the human: approve / defer / reject.
   Approved items enter the normal workflows (feature-development,
   bug-fix, seo-audit fixes…) with full gates.
8. **Snapshot** — this cycle's metrics + open recommendations recorded
   (dated) for the next cycle's comparison; durable market lessons →
   memory.

## Rules

- Nothing deploys from this workflow without the standard approvals —
  continuous growth means continuous *recommendations*, human-gated
  changes (unless the human has durably configured otherwise in
  `config/permissions/`).
- Recommendations that degrade quality for lift (dark patterns, content
  spam) are rejected at synthesis, not offered.
