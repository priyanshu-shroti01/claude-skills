---
name: webhook-security
description: Hardening inbound webhooks and other unauthenticated endpoints — signature checks, replay protection, no code execution from input, rate limits, and safe failure. Use when building or reviewing any endpoint a third party (or anyone) can call without logging in.
---

# Webhook Security

Every public endpoint is reachable by everyone, not just the service you
expect. Design as if the attacker found the URL on day one.

## Authenticate the sender

- Verify an HMAC signature over the **raw** request body with a shared secret,
  using a constant-time compare. Reject anything unsigned or mis-signed with no
  further processing.
- Include a timestamp in the signed payload and reject requests outside a short
  window (e.g. 5 minutes) — that kills replays of captured requests.
- Store the secret outside the web root and version control; rotate it if it
  ever leaks.

## Never execute input

- No parameter may select code to run: no `call=`, `action=` mapped to
  framework commands, no `eval`, no dynamic include, no shelling out with
  request data. The real-world bug: an unauthenticated webhook that ran
  `Artisan::call($request->call)` — remote code execution for anyone.
- Map allowed events to fixed handlers with an allow-list; unknown event →
  ignore and 200.

## Idempotency and replay

- Key processing on the provider's event id; a repeated id is a no-op.
- Make handlers safe to receive twice; providers retry on timeouts.

## Exposure and limits

- Lock down dev/debug/framework routes (telescope, pulse, debug bars, health
  dumps, `system/cli`) in production — deny at the web server, not just the
  app.
- Rate-limit the endpoint; a single source shouldn't be able to saturate the
  workers. Exclude legitimate high-frequency asset paths so you don't ban real
  users.
- Don't log full bodies of requests that may carry secrets or personal data.

## Fail safe

- Validation failure → reject quietly, log the reason internally, never echo
  internals or stack traces to the caller.
- A webhook that changes money or access must re-confirm with the provider's
  API before acting, not trust the payload's claims.

## Review checklist

1. Is every request signed and verified before any work?
2. Can any input choose code, a file, or a command? (Must be no.)
3. Replays rejected? Duplicates harmless?
4. Debug/dev routes closed at the web server?
5. Rate-limited, and failures leak nothing?
