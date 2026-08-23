---
name: secrets-hygiene
description: Handling credentials safely - storage, injection, rotation, leak response, and what the hooks block. Use whenever work involves API keys, tokens, connection strings, or certificates.
---

# Secrets Hygiene

## Where secrets live

- Environment variables (from `.env` locally — gitignored — or the
  platform's secret store in deployment). `.env.example` documents *names
  and purpose only*.
- A secret manager where the infrastructure has one. Files on disk
  (`.pem`, key files) chmod 600, outside the repo, path referenced via env.

## Where secrets never live

Git (any file, any branch, any history) · code literals · client bundles
(`NEXT_PUBLIC_`/`VITE_`-style vars are public by definition — audit them)
· logs · error messages · claude-mem memory · knowledge graph · commit
messages · screenshots · documentation · test fixtures (use obvious fakes:
`sk-test-not-a-real-key`).

## Mechanical backstops (defense in depth, not a substitute for care)

- `.gitignore` excludes `.env*`, key/cert patterns.
- `.claude/hooks/pre-tool-guard.sh` blocks writes to secret-bearing paths
  and content matching real credential shapes.
- `scripts/verify.sh` + `tests/security/` scan the tree for credential
  patterns.

## Working rules

- Need a new secret? Add the placeholder to `.env.example`, document it in
  the project README's env table, tell the human what to provision. Never
  invent or hardcode a value.
- Reading config: through the project's config module, validated at boot
  (fail fast with the *name* of the missing var, never its value).
- Third-party keys: minimum scopes, per-environment keys, never shared
  between staging and production.

## Leak response (in this order)

1. **Rotate the credential immediately** — the leak is live until then.
2. Tell the human what leaked, where, and the rotation status.
3. Purge from history (filter-repo/BFG) *after* rotation; force-push only
   with human approval per git rules.
4. Check usage logs of the leaked credential where the provider allows.
5. Record the lesson (learning-agent): how it happened, which backstop
   missed, what changes.
