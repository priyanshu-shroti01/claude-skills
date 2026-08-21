# Integration: Anthropic official skills

**Status: required** · License: Apache-2.0 (most skills; docx/pdf/pptx/xlsx
document skills are source-available under a custom license)
Source: https://github.com/anthropics/skills

First-party skills — notably **frontend-design** (the web design skill),
plus webapp-testing, mcp-builder, skill-creator, canvas-design and the
document skills.

## Install (interactive, inside Claude Code)

```text
/plugin marketplace add anthropics/skills
/plugin install example-skills@anthropic-agent-skills
```

Install selectively — the Skill Router loads what a task needs; don't
enable everything by default.

## How Claude OS uses it

- `frontend-design` complements our internal `design-direction` +
  `anti-slop`: theirs guides generation quality, ours sets the project
  language and gates the result (see docs/architecture/skill-overlap.md).
- `webapp-testing` overlaps Playwright MCP — the overlap ruling keeps
  Playwright MCP as the browser harness.

## Notes

- Superpowers (obra/superpowers, MIT, v6.3.0) installs from the official
  plugin marketplace too: `/plugin install superpowers@claude-plugins-official`.
- Document skills' custom license matters only if you redistribute them —
  using them locally is fine.
