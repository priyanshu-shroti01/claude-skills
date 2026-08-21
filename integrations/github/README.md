# Integration: GitHub

**Status: optional** (git itself is required; the MCP/API layer is optional)

## Git (required, no integration needed)

All git workflow rules: `.claude/rules/git-rules.md`. Nothing to install
beyond git ≥ 2.30.

## GitHub MCP (optional)

Template: `config/mcp/github.json` — the hosted GitHub MCP endpoint with a
token from env:

```json
{ "mcpServers": { "github": { "type": "http",
  "url": "https://api.githubcopilot.com/mcp/",
  "headers": { "Authorization": "Bearer ${GITHUB_TOKEN}" } } } }
```

`GITHUB_TOKEN` comes from `.env` (placeholder in `.env.example`).
Use a **fine-grained PAT** scoped to only the repos you work on, minimum
permissions (SECURITY.md least-privilege rule).

## Claude OS rules

- PR workflow: feature branch → PR → independent review → merge
  (git-rules). Agents never merge their own unreviewed work.
- No force-push to shared branches; the pre-tool-guard hook blocks
  force-pushes to main mechanically.
- Tokens never appear in remotes' URLs, logs, or commit content.

## Verify

`/mcp` lists github (after `.env` provides the token); or plain
`git ls-remote` for the git layer.
