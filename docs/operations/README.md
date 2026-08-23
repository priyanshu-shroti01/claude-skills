# Operations Guide — 24/7 Claude OS

Running Claude OS continuously on a server: scheduled autonomous work
within a hard L3 envelope, humans approving everything that touches the
world. Profile: `config/environments/server.yaml`.

## The operational contract

The system may autonomously: research → identify work → plan → implement
→ test → review → package → report. It may **never** autonomously:
deploy (L4/L5), migrate destructively, touch server config/DNS/firewall/
credentials, or contact anyone. Those queue for the human — every time.

## Machine state (`$CLAUDE_OS_HOME`, default `~/.claude-os`)

```
state/    task ledgers, run snapshots (overnight picks up where it left off)
logs/     claude-os.log (timestamped, secret-free; retention per server.yaml)
locks/    <name>.lock dirs — mkdir-based, stale-swept per lock_stale_minutes
vendor/   machine-local installs that don't belong in the repo
```

Primitives (`scripts/lib/common.sh`): `acquire_lock`/`release_lock`
(stale-aware) · `os_log` · `retry` (exponential backoff). The
overnight-improvement workflow is the reference consumer.

## Scheduling (cron/systemd — server.yaml carries the canonical times)

```cron
0 2 * * *   cd /path/to/claude-os && scripts/... # overnight-improvement runner
0 6 * * 1   …                                    # continuous-growth (weekly)
0 */6 * * * cd /path/to/claude-os && scripts/doctor.sh >> ~/.claude-os/logs/doctor.log 2>&1
```

The runner for agent workflows is your `claude` invocation of the
workflow (headless mode) — wrap it with `acquire_lock overnight`,
a `timeout` at `watchdog.run_budget_minutes`, and `release_lock` in a
trap so budget expiry still exits gracefully.

## Health & failure handling

- **Health checks**: doctor every 6h (cron above); status.sh on demand;
  both secret-free.
- **Retry policy**: 3 attempts, backoff 60/300/900s
  (server.yaml `operations.retry`) for transient failures; two
  consecutive failed runs on the same task → task parked with diagnosis
  (overnight workflow rule), never infinite retries.
- **Watchdog**: run budget (default 240 min) enforced by `timeout`; the
  workflow persists state continuously so a killed run resumes, not
  restarts.
- **Graceful shutdown**: trap TERM/INT → persist ledger → release locks →
  exit; `graceful_shutdown_seconds` is the grace window.
- **Recovery**: on start, sweep stale locks, reload `state/`, reconcile
  branches (an interrupted run's branch is resumed or parked, never
  orphaned silently).

## Morning review (the human's 10 minutes)

Read the overnight report (branches ready for review, findings queued,
failures, approvals awaited) → merge/approve/reject → the next run
consumes your feedback from the ledger.
