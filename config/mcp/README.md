# MCP Configuration Templates

Templates for the MCP servers Claude OS uses. `scripts/install.sh`
assembles the selected templates into a project's `.mcp.json`
(or you can merge them by hand). **Never hardcode credentials** — the
templates reference environment variables (`${VAR}`), which Claude Code
expands at runtime from your shell/.env.

| Template | Server | Status | Needs |
|---|---|---|---|
| `playwright.json` | microsoft/playwright-mcp | required | Node (npx) |
| `shadcn.json` | shadcn official MCP | required | project `components.json` |
| `github.json` | GitHub MCP (remote) | optional | `GITHUB_TOKEN` |
| `figma.json` | Figma MCP (official remote) | optional | Figma seat w/ MCP access; OAuth via `/mcp` |

Verification: `/mcp` inside Claude Code lists connected servers;
`scripts/doctor.sh` checks the config files' syntax and env var presence
(names only).

Add a server: create `<name>.json` here (same shape), document it in this
table and `docs/dependencies.md`, and reference any secrets via env vars
with placeholders added to `.env.example`.
