# Visual Reference Sources

Curated places to *look* before designing. None of these are dependencies,
none are installed, and nothing here is a licence to copy. Registered in
`config/skills/external-skills.yaml` as reference-only, the same way the
OWASP Cheat Sheets are.

Used by: research-agent, design-director, 3d-director, motion-director,
competitor-agent.

## The one rule

**Reference the technique, never the artefact.**

What you may take from a reference: scroll choreography, camera language,
material behaviour, pacing, hierarchy decisions, interaction ideas, the
*reason* something works.

What you may never take: compositions, layouts, copy, colour systems as a
set, imagery, models, textures, shader source, or "the same but with our
logo". Every site in these galleries is somebody's copyrighted work, and a
gallery listing grants you nothing.

A screenshot may enter a research packet as a cited reference. It must
never enter a shipped design.

## Sources

| Source | What it is good for | Cautions |
|---|---|---|
| [Awwwards — Three.js](https://www.awwwards.com/websites/three-js/) | Award-level Three.js / WebGL sites. The reference of record for 3D and scroll-cinematic briefs. | Editorial popularity, not a quality standard. Many entries trade performance and accessibility for spectacle — check both before citing one as a target. |
| [ThreeUI](https://threeui.com/browse) | Procedural Three.js components, shaders, hero sections, landing templates — with live variants and controls. Doubles as a code source (Community subset, MIT). | Split licence: only the Community subset is MIT. Catalog thumbnails/preview videos are served from threeui.com and are **not** redistributable. Pro/Beta source and ThreeUI's MCP + skills are paid. See `docs/dependencies.md`. |
| [Godly](https://godly.website/) · [Land-book](https://land-book.com/) · [SiteInspire](https://www.siteinspire.com/) | Broader web design galleries — layout, typography and editorial direction rather than 3D. | Same copyright position as Awwwards. |

## How to use a reference well

1. **Name what you are borrowing.** "The camera dolly is tied to scroll
   velocity, not scroll position" is a technique. "It looks like that site"
   is not a brief.
2. **Write it into the project `DESIGN.md`** as a decision with a reason.
   A reference that does not survive translation into your own design
   language was decoration, not direction.
3. **Check the cost.** Award-winning 3D sites routinely ship 15MB of
   assets and fail Core Web Vitals. `skills/3d/r3f-scenes` sets the
   performance budget and the mobile fallback; a reference does not get
   to override it.
4. **Check accessibility.** A lot of gallery work has no keyboard path,
   no reduced-motion path, and text over video. `accessibility-agent`
   still gates the build.
5. **Re-scan.** The anti-slop gate runs on the render regardless of how
   good the reference was.

## Fetching etiquette

Fetch a page as a reader would: one page at a time, obey `robots.txt`,
never crawl a gallery or the sites it links, never bulk-download assets.
Bulk collection is both a ToS problem and a copyright problem — the same
reasoning that put `Scout` at `status: blocked` in the registry.
