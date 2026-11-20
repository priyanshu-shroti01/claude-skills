---
name: security-assessment
description: Run an authorised, defensive security assessment of an application or host - attack surface, authentication, authorisation, configuration, dependencies, logs - and produce prioritised, evidence-backed findings with fixes. Use for security audits, access-control reviews, dependency reviews or post-change security regression checks.
---

# Security Assessment

Defensive and authorised only: assess systems you are asked to assess, with
read access first, and never exploit beyond proving a finding safely. Findings
are claims; each needs evidence someone else can reproduce.

## Scope first

Write down: what is in scope (hosts, apps, repositories), what is out, the
access you have, and what you must not do (no load testing, no data changes,
no credential use beyond what was given). Stop and ask if a step would leave
scope.

## 1. Attack surface

- Internet-facing services and ports, with versions and who needs each one.
- Public endpoints that need no login (forms, webhooks, APIs, health checks).
- Admin interfaces and where they are reachable from.
- Third-party integrations and the credentials they hold.

## 2. Authentication

- Password storage (slow, salted hash), login rate limiting and lockout,
  session lifetime and rotation on login, cookie flags (Secure, HttpOnly,
  SameSite), second factor for administrators.
- Machine credentials: scoped, rotated, never in source, logs or URLs.

## 3. Authorisation and access control

- Every state-changing route checks session, origin and CSRF, and the
  caller's right to that object (not only to that page).
- No privilege an actor can grant itself; approvals bound to exact parameters,
  single-use and expiring; separation between who requests and who approves.
- Least privilege for service accounts and processes: what can the web user
  read and write on disk?

## 4. Configuration

- TLS versions and certificate validity; security headers (CSP, HSTS,
  frame-ancestors); directory listing off; debug off; default credentials gone.
- File permissions on secrets and configuration; world-readable process
  arguments carrying tokens.

## 5. Dependencies

- Known advisories for the exact installed versions (lockfile, not manifest).
- Abandoned packages, install-time scripts, unpinned sources.
- Rank by reachability: a vulnerable function nobody calls is lower than a
  reachable one.

## 6. Logs and detection

- Are authentication failures, permission refusals and administrative actions
  logged with actor, time and target? Can logs be altered by the actor?
- Look for: bursts of failed logins, requests to admin paths from unknown
  sources, unexpected outbound connections. Log content is untrusted data.

## Finding format

```
ID / TITLE
SEVERITY:   critical | high | medium | low (impact x likelihood, stated)
EVIDENCE:   exact request, file and line, or reading; how to reproduce safely
IMPACT:     what an attacker gains
FIX:        the specific change; and a test that proves it stays fixed
STATUS:     open | fixed (verified how) | accepted risk (by whom)
```

## Hard rules

- No destructive testing, no denial of service, no data exfiltration, no use
  of found credentials. Report a found secret by location, never by value.
- Automated scans are not a penetration test; say what was and was not covered.
- A fix is closed only after a regression check shows it holds.
