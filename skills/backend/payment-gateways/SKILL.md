---
name: payment-gateways
description: Building and auditing payment-gateway integrations — callback authentication, idempotency, currency integrity, and the forged-success class of bug. Use when writing or reviewing any gateway module, webhook, or payment callback.
---

# Payment Gateways

A gateway callback is an untrusted request from the open internet that moves
money. The default assumption is that an attacker is sending it.

## Authenticate every callback — three independent checks

1. **Verify the signature/HMAC** the provider sends, over the *raw* body, with
   the shared secret. Compare with a constant-time compare, never `==`.
2. **Confirm the amount and currency** match the invoice you're about to
   settle — never trust the amount in the callback alone.
3. **Confirm the transaction with the provider's server** (a status query by
   their transaction id) before settling, where the API allows it. A callback
   saying `SUCCESS` is a claim, not proof.

The canonical bug: a forged `STATUS=TXN_SUCCESS` callback settling any invoice
because the handler trusted the status field. All three checks must pass, or
the payment is rejected and logged.

## Idempotency

- Callbacks are retried and replayed. Key every settlement on the provider's
  transaction id; if that id already settled an invoice, no-op and return 200.
- Settle through `AddInvoicePayment` (platform API), so the paid-invoice chain
  (due dates, provisioning, domain registration) runs exactly once.

## Currency integrity

- Never let the callback or the client pick which currency an amount is in.
  Resolve currency from the invoice server-side.
- Watch the INR-as-USD / currency-swap class of hole: an amount paid in one
  currency credited against an invoice in another. Convert explicitly, from a
  trusted rate, and record both sides.
- Per-gateway fees: compute from the invoice server-side; never accept a
  fee/total the client submitted.

## Secrets and relays

- Gateway secrets, relay secrets and API keys live outside the web root and
  outside version control. If a secret ever reaches a log, a client, or a repo,
  it is burned — rotate it.
- A relay/proxy (e.g. for a gateway that needs a fixed IP) must itself be
  authenticated and signed end to end; a plaintext relay is an open settle-any
  endpoint.

## Dev routes and debug

- No debug/dev/test route that settles or inspects payments ships enabled.
  Lock them behind auth or remove them before production.
- Turn off framework debug/telescope/profilers in production — they log full
  request bodies, including payment data and secrets.

## Reviewing a gateway

Trace one payment end to end and ask at each step: can the client forge this?
is it replayable? can the amount or currency be swapped? does it settle more
than once? where does the secret live? Test on PHP versions the panel actually
runs, and with a real (small) payment before trusting it.
