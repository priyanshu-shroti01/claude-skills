# Integration: Figma MCP (official)

**Status: optional** · Proprietary Figma service (beta)
Docs: https://developers.figma.com/docs/figma-mcp-server/

Design-to-code bridge: agents read Figma file structure, variables and
components from your design files.

## Requirements (plan gating — verified 2026-08)

- Full access needs a **Dev or Full seat** on Professional/Organization/
  Enterprise plans; Starter/View seats are limited to a handful of tool
  calls per month.
- Free during beta; usage-based pricing announced as planned.

## Install

Template: `config/mcp/figma.json` (remote server, recommended path):

```json
{ "mcpServers": { "figma": { "type": "http", "url": "https://mcp.figma.com/mcp" } } }
```

Merge into the project's `.mcp.json`, then authenticate interactively:
`/mcp` → figma → Authenticate (OAuth). Alternative for org/enterprise
setups: the Figma **desktop app** local server at
`http://127.0.0.1:3845/mcp`, enabled from Dev Mode's inspect panel.

## Verify

`/mcp` shows figma as authenticated; a file-read tool call succeeds on a
file your seat can access.

## Claude OS rules

- OAuth only — never store Figma tokens in files. `FIGMA_ACCESS_TOKEN` in
  `.env.example` exists solely for REST-API use cases outside MCP.
- Figma designs are inputs to the project design language, not overrides
  of it — design-director still owns DESIGN.md.
