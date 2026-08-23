# Workflow: Overnight Improvement

**Trigger**: scheduled unattended runs (server deployments of Claude OS —
see docs/operations/). **Orchestrator**: commander, autonomous **up to L3
only**. This is the 24/7 workhorse: it researches, plans, implements, and
prepares — it never deploys.

## Autonomy envelope (hard)

- Max level: L3 (branches/commits on non-protected branches).
  L4/L5, migrations, outreach, config/DNS/credential changes: **never** —
  queued for the human instead.
- All work on `feature/overnight-<date>-<slug>` branches; protected
  branches untouched; no force-pushes.
- Lock file per project (`$CLAUDE_OS_HOME/locks/`) so runs never overlap;
  stale-lock detection per docs/operations.
- Budget-capped: the run plans against a configured time/step budget and
  stops cleanly rather than half-finishing (task state persisted for the
  next run).

## Cycle

1. **Pick up state** — task ledger from the previous run: in-flight
   branches, unaddressed findings, human feedback on prior overnight PRs.
2. **Identify work** — from standing backlogs, in priority order:
   approved-but-unstarted recommendations (continuous-growth), open audit
   findings (SEO/perf/a11y/visual), flaky/missing tests, doc drift.
   No backlog → run one rotation audit (per continuous-growth stage 5)
   to *generate* backlog; never invent speculative feature work.
3. **Implement** — smallest-coherent-unit tasks through their normal
   workflow stages (bug-fix, feature-development) including tests.
4. **Self-verify** — full local battery: lint, typecheck, tests, build;
   scoped visual-qa for UI changes. Failures → fix or revert; never leave
   a broken branch as the night's output.
5. **Review** — code-reviewer (and security-agent where routed) run as
   normal — overnight work gets the same gates, not a nightly discount.
6. **Package** — per task: PR-ready branch with a plain summary (what,
   why, evidence, gates run, what needs human eyes). No auto-merge.
7. **Report** — one morning report: work completed (with branch refs),
   findings queued, failures/blockers, health-check status, and the exact
   approvals now awaited. Logged per docs/operations conventions.
8. **Shutdown** — state persisted, locks released, graceful exit even on
   budget expiry (watchdog rules in docs/operations).

## Rules

- Anything requiring judgment the charters reserve for humans → queued
  with context, not attempted.
- Two consecutive failed runs on the same task → task parked with a
  diagnosis, not retried forever.
