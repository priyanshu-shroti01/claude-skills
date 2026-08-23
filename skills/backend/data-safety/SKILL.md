---
name: data-safety
description: Database and data-handling safety - schema integrity, reversible migrations, transactions, backups, PII handling. Use for any schema change, migration, or data-touching feature.
---

# Data Safety

Data mistakes are the expensive kind: often irreversible, always
trust-damaging. This skill governs every schema change and data-touching
feature.

## Schema

- Integrity in the database, not just the app: NOT NULL, foreign keys,
  unique constraints, checks. The app validates for UX; the DB enforces
  truth.
- Naming/conventions follow the existing schema; new patterns need an
  architect ruling.
- Indexes justified by real query patterns; write-amplification considered.

## Migrations

- **Reversible by default**: every migration ships with a working down
  path, or an explicit statement of why not — which makes it destructive.
- **Destructive migrations** (dropping columns/tables, type narrowing,
  mass updates/deletes) are on the approval-required list: human sign-off,
  stated backup, stated rollback, run window agreed.
- Expand → migrate → contract for zero-downtime changes: add new, dual-
  write/backfill, switch reads, then (separately, later, approved) remove
  old.
- Migrations are code: reviewed, tested against a realistic dataset copy,
  never hand-run in production consoles.

## Runtime data handling

- Transactions around multi-step invariants; no partial writes on the
  money path.
- Bulk operations: batched, resumable, dry-run first, row counts logged
  before/after.
- Soft-delete vs. hard-delete is a product decision, recorded; hard
  deletes of user data get the same approval treatment as destructive
  migrations.

## PII & retention

- Classify fields at design time (public / internal / PII / sensitive —
  sensitive collection requires explicit human approval and a stated
  reason).
- PII: minimum collected, encrypted in transit always and at rest where
  the platform supports it, excluded from logs, deletable on request
  (design the deletion path with the feature, not after).

## Backups

- Data-bearing production systems have automated backups with a **tested**
  restore path before launch (PRODUCTION_READINESS.md §E) — an untested
  backup is a hope, not a backup.
