# Git Rules

## Branching

- `main` — stable, releasable. Protected: no direct commits, no force-push.
- `development` — integration branch.
- `feature/<slug>` — all work happens here, branched from `development`
  (or `main` in single-branch projects — follow the project's convention).

## Commits

- Small, coherent, buildable. Message explains *why*.
- Conventional prefix encouraged: `feat:`, `fix:`, `docs:`, `refactor:`,
  `test:`, `chore:`, `security:`.
- Never commit: `.env*` (except `.env.example`), credentials, tokens,
  private data, generated secrets, large caches, temp files, `node_modules`,
  build output, vendored external repos (`vendor/`).

## Merging

- PRs into `development`/`main` require independent code review
  (code-reviewer agent or human) — implementer never merges own unreviewed work.
- No force-push to shared branches; never rewrite others' history.
- Merged work must have passed the gates applicable to its workflow.

## Releases (this repository)

- Bump `VERSION` + `SYSTEM_MANIFEST.yaml` `system.version` together.
- Update `CHANGELOG.md` (Keep a Changelog format).
- Tag `vX.Y.Z` on `main`.
