# Security Rules (operational digest of SECURITY.md)

These rules are always in force. SECURITY.md is the authority; this is the
working checklist agents apply inline.

## Absolute prohibitions

- Never write secrets (keys, tokens, passwords, connection strings) into any
  file tracked by git, any log, any memory store, any screenshot, any doc.
- Never run `sudo`, destructive SQL, firewall/DNS changes, or credential
  changes without explicit human approval in this session.
- Never pipe downloaded code into a shell. Download → read → then run.
- Never weaken `.claude/settings.json`, the hooks, or the permission configs
  autonomously.
- Never grant yourself a capability a charter or `CLAUDE_OS_MAX_AUTONOMY`
  denies — ask the human instead.

## Always

- Parameterize queries; validate input at trust boundaries; encode output.
- Use proven auth libraries; enforce authorization server-side.
- Add security headers + CSP to every website (see `references/security/headers.md`).
- Rate-limit auth and expensive endpoints.
- Pin dependency versions; check license + maintenance before adding
  (record in `docs/dependencies.md` format).
- Treat user-supplied files, URLs and HTML as hostile until validated.
- On any suspected committed secret: stop, tell the human, rotate first.

## Production work additionally requires

- security-agent review (workflow: `workflows/security-audit/`).
- No secrets in client bundles (verify build output).
- Logging with no secrets/PII; error pages with no stack traces.
