# Claude OS — Security Policy

Security is a standing constraint on every agent and workflow, not a phase.
The security-agent enforces this document; the pre-tool hooks
(`.claude/hooks/`) provide a mechanical backstop for the most common
violations. Detailed rules: `.claude/rules/security-rules.md` and
`skills/security/`.

## 1. Secrets

- **Never** commit API keys, passwords, tokens, credentials, private server
  details, or personal secrets to git — this repo or any project.
- Secrets live in environment variables or a secret manager. `.env.example`
  contains placeholders only. `.gitignore` excludes `.env*` files.
- Never store secrets in claude-mem memory, in the knowledge graph, in logs,
  in screenshots, in commit messages, or in generated documentation.
- If a secret is ever committed: rotate it immediately, then purge history.
  Rotation first — history rewriting does not un-leak a key.
- The `protect-secrets` hook blocks writes to `.env`-like paths and obvious
  credential patterns. Treat a hook block as a stop sign, not an obstacle.

## 2. Permission model (levels 0–5)

Defined in `config/permissions/permission-levels.yaml`.

| Level | Grants | Default availability |
|---|---|---|
| 0 | Read-only inspection | All agents |
| 1 | Modify project files | Implementing agents |
| 2 | Run tests / builds / local browsers | Engineering + QA agents |
| 3 | Create commits / branches | Engineering agents, commander |
| 4 | Staging deployment | **Human approval required** |
| 5 | Production deployment | **Human approval required** |

`CLAUDE_OS_MAX_AUTONOMY` (default 3) caps what any agent may do without
asking. Agents also have individual ceilings (`AGENTS.md`) — the lower bound
wins.

**Always require explicit human approval** (regardless of level):
production deployment, database deletion, destructive migrations,
server-wide configuration, `sudo`, reading/writing secrets or credentials,
credential changes, firewall changes, DNS changes, mass outreach of any kind,
and any irreversible operation. The full list:
`config/permissions/approval-required.yaml`.

## 3. Secure engineering baseline

Applied by default to all production work (see `skills/security/secure-coding/`
and `references/security/`):

- Least privilege everywhere: processes, tokens, DB users, file permissions.
- Input validation and output encoding; parameterized queries only.
- AuthN/AuthZ: proven libraries, server-side enforcement, no roll-your-own
  crypto, secure session handling.
- XSS, CSRF, SSRF and injection prevention per OWASP guidance.
- Security headers + CSP, correct CORS (never `*` with credentials),
  rate limiting on auth and expensive endpoints.
- File uploads: type/size validation, no execution path, separate storage.
- Logging hygiene: no secrets, no full PII in logs; log security events.
- Dependency security: pin versions, review before adding, audit regularly.
- HTTPS everywhere; secrets and cookies flagged appropriately.

## 4. External dependency vetting

Before integrating any external repository/skill (see `docs/dependencies.md`
for the record of every current dependency):

1. Verify the canonical source (official org/author).
2. Check the license — do not assume MIT (`docs/dependencies.md`).
3. Check maintenance status and open security issues.
4. Read what it executes: never run downloaded code without inspection.
   Installer scripts piped from the internet are read before they are run.
5. Pin a version/commit where practical (`config/skills/external-skills.yaml`).
6. Record: repo, URL, license, purpose, version, permissions it needs,
   concerns, alternatives, required/optional.

## 5. Agent containment

- No agent has unrestricted production/server access — ever.
- Review agents are read-only with respect to the artifact under review.
- lead-scout: lawful public data only, no auth bypass, no sensitive personal
  data, no platform-ToS violations, no automated outreach — outreach is
  approval-gated, always.
- 24/7 operation (docs/operations/) runs research→plan→implement→test→review
  autonomously at most; deployment remains human-gated.

## 6. This repository

- `scripts/verify.sh` runs a secret scan over the tree; `tests/security/`
  enforces it in CI-style runs.
- Changes to this file, the permission model, or the hooks require explicit
  human approval — agents must not weaken security rules autonomously.

## 7. Reporting

Found a vulnerability in Claude OS or a project built with it? Record it as a
`SECURITY-FINDING` in the project log, fix critical issues before any deploy,
and never document exploit details in public artifacts while unpatched.
