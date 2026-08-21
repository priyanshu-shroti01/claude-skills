---
name: api-standards
description: API design and implementation standards - contracts, errors, pagination, idempotency, auth enforcement, versioning, observability. Use when designing or implementing any API.
---

# API Standards

## Contract

- Resources and verbs follow the platform idiom (REST resource nouns,
  RPC-style only with a reason). Contract written before implementation
  (OpenAPI/schema-style artifact where the project supports it).
- Inputs validated at the boundary against a schema; unknown fields
  rejected or ignored *by explicit policy*.
- Outputs stable and documented; breaking changes → new version, never a
  silent mutation. Version in path or header — one convention per project.

## Errors

- One error envelope across the API: machine code, human message, optional
  details, correlation id.
- Correct status codes; 4xx for caller fault, 5xx for ours.
- Never leak internals: no stack traces, SQL, file paths, or dependency
  names in responses.

## Semantics

- Mutations idempotent where the client may retry (idempotency keys for
  payments-class operations).
- Pagination on every collection endpoint from day one (cursor preferred);
  default + max page sizes.
- Timeouts on all outbound calls; retries with backoff + jitter only on
  idempotent operations.

## Auth

- Authentication via the project's proven library/provider; sessions or
  tokens per the architect's model.
- Authorization enforced server-side on **every** handler — route-level
  middleware plus resource-level ownership checks. Deny by default.
- Rate limiting on auth endpoints and expensive operations.

## Observability

- Structured logs per request: correlation id, route, status, duration —
  no secrets, no full PII (see security rules).
- Error tracking wired; health endpoint (`/health`-style) that checks real
  dependencies shallowly.

## Testing

- Contract tests for every endpoint: happy path + validation failures +
  auth failures (positive and negative authz cases).
- Integration tests against a real (containerized/local) datastore, not
  mocks-all-the-way-down.
