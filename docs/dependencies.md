# External Dependencies — License & Security Record

Human-readable audit of every external dependency. Machine-consumed twin:
`config/skills/external-skills.yaml` (installer + pins) — keep in sync.
Facts verified **2026-08-21**, with the 2026-09-05 pack additions
(skills CLI, no-ai-slop, superseo-skills, mattpocock-skills, ThreeUI,
Awwwards) verified that day by **cloning each repo and reading its
LICENSE, tree and every executable file** — not from README claims.
Statuses:
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
| Vercel agent skills (8 skills) | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT | required | skills CLI / copy-in | keep copyright notice |
| Skills CLI 1.5.23 + find-skills | [vercel-labs/skills](https://github.com/vercel-labs/skills) | MIT | required | `npx skills` + find-skills skill | keep copyright notice |
| no-ai-slop 1.0.6 | [petergyang/no-ai-slop](https://github.com/petergyang/no-ai-slop) | MIT | required | plugin / skill copy-in | keep copyright notice |
| SuperSEO Skills 0.2.1 (11 skills) | [inhouseseo/superseo-skills](https://github.com/inhouseseo/superseo-skills) | Apache-2.0 | optional | plugin marketplace | NOTICE on redistribution |
| Matt Pocock skills 1.2.3 (25 skills) | [mattpocock/skills](https://github.com/mattpocock/skills) | MIT | optional (**selective**) | plugin marketplace, cherry-picked | keep copyright notice |
| ThreeUI 1.2.0 | [MengTo/threeui](https://github.com/MengTo/threeui) | **MIT (Community only) + SIL OFL fonts** | optional | npm / component copy-in | keep notices; fonts OFL; catalog media not redistributable |
| Awwwards Three.js gallery | [awwwards.com](https://www.awwwards.com/websites/three-js/) | **no license grant — each site is its own rights holder** | required (reference-only) | linked, never copied | cite in research packets; never reuse compositions or assets |
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
| lets-scroll (plugin v0.8.0) | [AIwithhassan/lets-scroll](https://github.com/AIwithhassan/lets-scroll) | MIT | optional | plugin / skill copy-in (paid gen services: Monid per-clip USD, Higgsfield credits) | keep notice |
| Scroll World | [oso95/scroll-world](https://github.com/oso95/scroll-world) | MIT | evaluation (superseded by lets-scroll) | none | n/a |
| Claude SEO v2.2.4 | [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo) | MIT | evaluation (superseded by SuperSEO) | none | n/a |
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
- **ThreeUI is a split licence.** MIT covers the Community subset only:
  application code, Community component code, ThreeUI-authored Community
  imagery. It does **not** cover the catalog thumbnails and preview videos
  served from `threeui.com` (loaded remotely, never redistributed — don't
  copy them into a project) or Pro/Beta component source (paid, entitlement
  -checked, absent from npm). Bundled fonts are **SIL OFL 1.1** — keep the
  notices. ThreeUI's MCP server and skills are **Pro-tier**; this record
  covers the open component catalog and nothing else.
- **The Awwwards gallery grants no licence at all.** It is an editorial
  list of other people's copyrighted sites. Reference the *technique*;
  never the composition, copy, or assets. Never scrape it or the sites
  it links.
- **SuperSEO Skills carries vendor bias, not a licence problem.**
  Apache-2.0 and prompt-only, but authored by InhouseSEO, who sell an SEO
  platform. The skills run standalone with no keys; treat their
  methodology as vendor opinion. Its `linkbuilding` skill teaches
  outreach — outreach stays human-executed and approval-gated, exactly
  like `lead-research`.
- **mattpocock/skills ships a PreToolUse hook.** `git-guardrails-claude-code`
  installs a hook that blocks `git push`, `reset --hard`, `clean -f`.
  Adding a third-party hook is precisely what `.claude/rules/security-rules.md`
  forbids doing autonomously, and it overlaps our own
  `.claude/hooks/pre-tool-guard.sh`. Adopt the prose skills; leave the
  hook alone unless a human explicitly asks for it.
- **The skills CLI is an install vector.** `find-skills` will happily
  recommend and `npx skills add -g -y` any popular skill. Install counts
  and stars are popularity, not an audit. Discovery is free; adoption
  goes through the vetting protocol below.

## Vetting protocol for new dependencies

SECURITY.md §4: canonical source → license check → maintenance check →
read what executes (installer scripts included) → pin → record here AND
in the registry. `tests/installation/test_integrations.sh` enforces the
mandatory fields.
