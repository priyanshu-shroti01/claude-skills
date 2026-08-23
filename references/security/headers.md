# Reference: Security Headers Baseline

The default header set for every website Claude OS ships. Adjust per
project; removals need a security-agent ruling. Authority of record:
OWASP Cheat Sheets (https://cheatsheetseries.owasp.org — link, don't
vendor; CC BY-SA 4.0).

## Baseline set

```text
Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self'; connect-src 'self'; frame-ancestors 'none'; base-uri 'self'; form-action 'self'
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=(), geolocation=()
Cross-Origin-Opener-Policy: same-origin
X-Frame-Options: DENY
```

## CSP notes

- Start strict, loosen per documented need (each `unsafe-*` or extra
  origin gets a comment in the config saying why).
- No `unsafe-inline` for scripts in production — use nonces/hashes if
  inline is unavoidable.
- `style-src 'unsafe-inline'` is a pragmatic default for CSS-in-JS
  stacks; tighten to nonces where the stack allows.
- Analytics/fonts/CDNs: add exact origins, never wildcards wider than a
  subdomain.
- Report-only mode first on retrofits (`Content-Security-Policy-Report-Only`).

## Cookies

`Secure; HttpOnly; SameSite=Lax` minimum for sessions ( `Strict` where UX
allows); `__Host-` prefix where applicable.

## CORS

Explicit origin allowlist; never `*` together with credentials;
`Vary: Origin` on dynamic CORS responses.

## Verification

Live checks belong to security-audit stage 6: `curl -sI https://site`
against this list, plus one rendered-page check that CSP isn't breaking
functionality (console clean).
