# Integration: shadcn/ui (+ official MCP)

**Status: required** · License: MIT · Registry-based (`shadcn@latest`)
Source: https://github.com/shadcn-ui/ui · MCP docs: https://ui.shadcn.com/docs/mcp

Component system used as **raw material** for UI work — always rethemed to
the project design language before use (`skills/frontend/component-quality`).

## Install

Per project:

```bash
npx shadcn@latest init          # creates components.json
npx shadcn@latest add button …  # copy-in components
```

MCP (assembled into `.mcp.json` by `scripts/install.sh` from
`config/mcp/shadcn.json`):

```json
{ "mcpServers": { "shadcn": { "command": "npx", "args": ["shadcn@latest", "mcp"] } } }
```

The MCP server requires a valid `components.json` in the project.

## Verify

`/mcp` lists `shadcn`; adding a component through it succeeds.

## Claude OS rules

- Components are copied into the project → they're project code: retheme
  tokens (radius, shadows, spacing, type) to DESIGN.md before first use.
- Never mix half-themed system components with custom ones.
- Third-party registries (incl. React Bits via
  `npx shadcn@latest add @react-bits/<C>`) go through the dependency
  vetting protocol; React Bits carries MIT **+ Commons Clause** — fine in
  products, not redistributable as a library (docs/dependencies.md).
- Private registries authenticate via env (`REGISTRY_TOKEN`-style) — never
  hardcode.
