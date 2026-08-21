# Template: React SPA project

For client-rendered apps (dashboards, tools) where a full framework isn't
warranted. Public marketing sites should prefer `../nextjs` (SEO needs
server rendering).

## Init

```bash
npm create vite@latest <name> -- --template react-ts
cd <name>
<claude-os>/scripts/project-init.sh .
```

## Claude OS defaults for React SPAs

- React 19; function components + hooks only.
- Router: react-router (or the project's existing choice) with lazy route
  chunks.
- State: local state → context for cross-cutting concerns → a store only
  on architect ruling with a named need.
- Data: a query library (TanStack Query-class) for server state; no
  ad-hoc `useEffect` fetching.
- Styling/tokens per DESIGN.md; shadcn/ui usable via its Vite path.
- Accessibility: SPAs earn extra scrutiny — route-change focus
  management and announcements are on the a11y gate.
- Bundle budget applies (initial route ≤200KB gz) — analyze before
  adding dependencies.

## Gates

Standard battery minus public-SEO (internal tools) — the Skill Router
decides; anti-slop still applies to any human-facing UI.
