# External Dependencies — License & Security Record

Human-readable audit of every external dependency. Machine-consumed twin:
`config/skills/external-skills.yaml` (installer + pins) — keep in sync.
All facts verified **2026-08-21** against the linked sources (web
research; canonical repos and registries fetched). Statuses:
**required** (bootstrap installs) · **optional** (opt-in) ·
**evaluation** (human evaluates before any install) · **blocked** (do not
install; reason + alternative recorded).

## Summary table

| Dependency | Source | License | Status | Integration | Attribution req. |
|---|---|---|---|---|---|
| claude-mem 13.15.3 | [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | Apache-2.0 | required | npx installer | NOTICE preserved on redistribution |
| Graphify (PyPI `graphifyy` 0.9.48) | [Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify) | Apache-2.0 | required | pip + `graphify install` | NOTICE preserved on redistribution |
| Superpowers v6.3.0 | [obra/superpowers](https://github.com/obra/superpowers) | MIT | required | official plugin marketplace | keep copyright notice |
| Anthropic skills | [anthropics/skills](https://github.com/anthropics/skills) | Apache-2.0 (most); doc skills source-available | required | plugin marketplace | per-skill; doc skills non-open — don't redistribute |
| Vercel agent skills | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT | required | skills CLI / copy-in | keep copyright notice |
| Impeccable | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache-2.0 | required | plugin marketplace | NOTICE on redistribution |
| shadcn/ui + MCP | [shadcn-ui/ui](https://github.com/shadcn-ui/ui) | MIT | required | per-project CLI + MCP | keep notice in copied components |
| Playwright MCP 0.0.79 | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) | Apache-2.0 | required | MCP (npx) | n/a (tool use) |
| Lighthouse 13.4.1 | [GoogleChrome/lighthouse](https://github.com/GoogleChrome/lighthouse) | Apache-2.0 | required | npm -g | n/a (tool use) |
| OWASP Cheat Sheets | [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries) | **CC BY-SA 4.0** | required (reference-only) | linked, never vendored | credit OWASP + ShareAlike on any copied text — hence link-only |
| React Bits | [DavidHDev/react-bits](https://github.com/DavidHDev/react-bits) | **MIT + Commons Clause** | optional | shadcn registry copy-in | no resale/redistribution of components |
| Motion Primitives | [ibelick/motion-primitives](https://github.com/ibelick/motion-primitives) | MIT | optional | component copy-in | keep notice |
| Figma MCP | [official docs](https://developers.figma.com/docs/figma-mcp-server/) | proprietary service (beta) | optional | remote MCP + OAuth | n/a; plan-gated |
| react-three-fiber 9.7.0 | [pmndrs/react-three-fiber](https://github.com/pmndrs/react-three-fiber) | MIT | optional | per-project npm | keep notice |
| drei 10.7.8 | [pmndrs/drei](https://github.com/pmndrs/drei) | MIT | optional | per-project npm | keep notice |
| GSAP 3.x | [gsap.com](https://gsap.com) | GSAP Standard (custom, free) | optional | per-project npm | keep proprietary notices; no competing no-code animation tools |
| Scroll World | [oso95/scroll-world](https://github.com/oso95/scroll-world) | MIT | optional | plugin (paid gen services) | keep notice |
| Claude SEO v2.2.4 | [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo) | MIT | evaluation | plugin (after audit) | keep notice |
| Claude Design Skills | [freshtechbro/claudedesignskills](https://github.com/freshtechbro/claudedesignskills) | MIT | evaluation | plugin (after audit) | keep notice |
| claude-image-gen | [guinacio/claude-image-gen](https://github.com/guinacio/claude-image-gen) | MIT | evaluation | plugin/MCP (after audit) | keep notice |
| omni-skill-claude | [xbill9/omni-skill-claude](https://github.com/xbill9/omni-skill-claude) | Apache-2.0 | evaluation (reference-only) | none | n/a |
| agent-browser 0.34.0 | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Apache-2.0 | evaluation | none (Playwright MCP is primary) | n/a |
| Ruflo 3.38.12 | [ruvnet/ruflo](https://github.com/ruvnet/ruflo) | MIT | evaluation | none (sandbox first) | keep notice |
| gstack | [garrytan/gstack](https://github.com/garrytan/gstack) | MIT | evaluation | none (read setup first) | keep notice |
| Scout | [kiryano/Scout](https://github.com/kiryano/Scout) | MIT | **BLOCKED** | none | n/a |

## Blocked dependencies (section-34 format)

### kiryano/Scout

```
STATUS: BLOCKED
REASON: Scrapes Instagram/Twitch/TikTok/LinkedIn/GitHub/YouTube profiles
        against those platforms' terms of service; harvests personal
        emails from bios and SMTP-probes them (GDPR / CAN-SPAM and IP
        blacklisting exposure); no legal safeguards in the tool; stale
        (last push 2026-02-22, no releases, "early access").
ALTERNATIVE: skills/growth/lead-research — lawful public-business-data
        research with approval-gated, human-executed outreach. Revisit
        only if a compliant, maintained tool appears.
```

## Notable license facts (do not assume MIT)

- **OWASP Cheat Sheets are CC BY-SA 4.0** — copyleft for content. We
  link; we never paste their text into this MIT-licensed repo.
- **React Bits is MIT + Commons Clause** — usable inside client products,
  **not** redistributable as part of a component library or template you
  sell/ship as such.
- **Anthropic document skills** (docx/pdf/pptx/xlsx) are source-available
  under a custom non-open license; the rest of anthropics/skills is
  Apache-2.0.
- **GSAP** is free (post-Webflow, ≥3.13) under a custom license — not
  OSI; restrictions on building competing no-code animation tools.
- **Figma MCP** is a proprietary hosted service, plan-gated, beta
  pricing subject to change.

## Vetting protocol for new dependencies

SECURITY.md §4: canonical source → license check → maintenance check →
read what executes (installer scripts included) → pin → record here AND
in the registry. `tests/installation/test_integrations.sh` enforces the
mandatory fields.
