---
name: secure-coding
description: The secure-coding checklist applied during implementation and security review - injection, XSS, CSRF, SSRF, auth, headers, uploads, dependencies, logging. Use for any production code and every security review.
---

# Secure Coding

The category checklist behind SECURITY.md §3. OWASP Cheat Sheets
(https://cheatsheetseries.owasp.org — CC BY-SA 4.0, link don't vendor)
are the reference of record per topic.

## Injection

- SQL/queries: parameterized statements or the ORM's safe API — string
  concatenation with user input is a blocker, always.
- Command execution: no shell interpolation of user input; argument
  arrays, allowlisted commands.
- Templates: auto-escaping stays on; `dangerouslySetInnerHTML`-class APIs
  only with sanitized input and a recorded reason.

## XSS

- Framework escaping trusted; raw HTML sinks inventoried and sanitized
  (allowlist sanitizer, not regex).
- CSP as backstop: no `unsafe-inline` scripts in production
  (`references/security/headers.md` for the template).
- User-supplied URLs validated (scheme allowlist — `javascript:` kills).

## CSRF

- State-changing endpoints: SameSite cookies + CSRF token (or the
  framework's built-in), verified server-side. GET never mutates.

## SSRF

- User-supplied URLs fetched server-side: scheme + host allowlist, no
  redirects-following into private ranges, metadata endpoints
  (169.254.169.254) explicitly blocked.

## AuthN / AuthZ

- Proven libraries; password hashing argon2/bcrypt-class; MFA supported
  where the product warrants.
- Sessions: httpOnly, Secure, SameSite cookies; rotation on privilege
  change; server-side invalidation.
- Authorization: deny-by-default middleware + per-resource ownership
  checks; IDs unguessable where enumeration matters. Test negative cases.

## Headers / CORS / rate limiting

- Baseline headers per `references/security/headers.md`.
- CORS: explicit origins; never `*` with credentials.
- Rate limits on login, signup, password reset, expensive endpoints.

## Uploads

- Validate type (magic bytes, not extension) + size; store outside the
  web root / in object storage; never execute; randomized names; scan
  where the platform offers it; images re-encoded.

## Dependencies

- Pin versions; `npm audit`/ecosystem equivalent in CI; new packages get
  the vetting protocol (SECURITY.md §4); install scripts read first.

## Secrets & logging

- Secrets via env/secret manager only (see secrets-hygiene skill).
- Logs: no credentials, tokens, full card/SSN-class data; security events
  (auth failures, permission denials, rate-limit hits) logged with
  correlation ids.

## Review use

security-agent walks these categories per review; each category verdict:
clean / finding(s) / not-applicable-because.
