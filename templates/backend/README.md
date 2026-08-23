# Template: Backend service project

For APIs and server systems. Stack chosen by backend-architect against
actual requirements — Node/TypeScript is the house default; Python where
the domain (data/ML) favors it. Record the choice in an ADR.

## Init (Node/TS default)

```bash
mkdir <name> && cd <name>
npm init -y && npm i typescript @types/node tsx && npx tsc --init
<claude-os>/scripts/project-init.sh .
```

## Claude OS defaults for backends

- Structure: routes/handlers → services → data access; validation at the
  boundary (zod-class schema per endpoint) — api-standards skill governs.
- Database: migrations from day one (reversible; data-safety skill);
  constraints in the schema, not just the app.
- Auth: proven library/provider per backend-architect's model; deny-by-
  default authorization middleware.
- Config: env-validated at boot (fail fast, name-only errors);
  secrets-hygiene skill governs.
- Observability: structured logs (secret/PII-free), health endpoint,
  error tracking hook.
- Tests: contract tests per endpoint (happy + validation + authz
  negative), integration against a real local datastore.

## Gates

code review + security review (mandatory) + functional QA +
deployment-gates. No design/SEO gates unless it serves pages.
