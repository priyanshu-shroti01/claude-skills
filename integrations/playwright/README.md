# Integration: Playwright MCP (browser automation)

**Status: required** · License: Apache-2.0 · Pin: @playwright/mcp 0.0.79
Source: https://github.com/microsoft/playwright-mcp

The **primary browser harness** for qa-agent, visual-qa-agent, and
rendered-page verification by the SEO/accessibility/anti-slop agents.
Drives the browser via accessibility snapshots.

## Install

MCP config is assembled by `scripts/install.sh` into `.mcp.json` from
`config/mcp/playwright.json`:

```json
{ "mcpServers": { "playwright": { "command": "npx", "args": ["@playwright/mcp@latest"] } } }
```

Browsers (large download, opt-in):

```bash
npx playwright install chromium        # or: scripts/bootstrap.sh --with-browsers
```

## Verify

`/mcp` inside Claude Code lists `playwright`; `scripts/doctor.sh` checks
config + browser presence.

## Overlap ruling

vercel-labs/agent-browser (Apache-2.0, evaluation status) is a credible
alternative with lower token overhead. Per
`docs/architecture/skill-overlap.md`: **Playwright MCP is primary; do not
run both as defaults.** Re-evaluate if token cost of QA sessions becomes a
problem.

## Notes

- Cross-browser passes (Firefox/WebKit) install those engines on demand:
  `npx playwright install firefox webkit`.
- Screenshots/traces land in gitignored per-run directories
  (`test-results/`, `screenshots/`).
