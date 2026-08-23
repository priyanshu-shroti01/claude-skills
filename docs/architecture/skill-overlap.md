# Skill Overlap Analysis

Explicit rulings on overlapping capabilities so the Skill Router loads
exactly one per need. Re-evaluate when a listed project changes character
(rulings dated 2026-08-21).

## The comparison

| Capability need | Candidates | Ruling |
|---|---|---|
| Browser automation / QA | **Playwright MCP** · agent-browser · anthropics webapp-testing | **Playwright MCP is primary.** Official, snapshot-driven, canonical config. agent-browser stays *evaluation* (lower token cost is attractive — revisit if QA sessions get token-bound). Never run both as defaults. |
| Engineering methodology | **Superpowers** · gstack · Ruflo | **Superpowers.** Composable skills that complement our agent roster. gstack's 23 role-skills largely *duplicate our agents/* — not installed wholesale (cherry-picking an idea = write it into our skills instead). Ruflo is a whole competing orchestration layer — see below. |
| Orchestration | **Claude OS workflows + native subagents** · Ruflo | **Internal workflows.** Ruflo (claude-flow rebrand) is powerful but a very large attack/complexity surface (27-hook system, MCP servers, federation, self-reported benchmarks). *Evaluation*: sandbox-only until a concrete gap appears that workflows + subagents can't cover. |
| Historical memory | **claude-mem** · MEMORY.md fallback | **claude-mem**; file fallback only when uninstalled. One memory system at a time. |
| Structural code knowledge | **Graphify** · manual GRAPH_REPORT | **Graphify**; manual report is the degraded mode. Memory ≠ graph: claude-mem stores *why/history*, Graphify stores *what/structure*. Never duplicate one into the other. |
| Design generation quality | **anthropic frontend-design** + **vercel web-design-guidelines** | Complementary, both loaded for UI generation: Anthropic's guides aesthetic generation; Vercel's is a review-style guideline set. Neither replaces our project DESIGN.md (the binding language) — they inform, ours governs. |
| Design system / components | **shadcn/ui** · React Bits · Motion Primitives | shadcn/ui is the base system. React Bits / Motion Primitives are per-component garnish (license note: React Bits Commons Clause), imported through component-quality rules — never a second design system. |
| Design taste enforcement | **internal anti-slop** · Impeccable's detectors · "anti-slop" community repos | **Internal anti-slop skill is the gate** (ours = scored rubric + loop + our escalation rules). Impeccable is installed for its complementary strengths (design language tooling, live browser mode); its anti-pattern detectors may *inform* findings but the gate and rubric are ours. Community anti-slop repos: none canonical or audited — not installed (we wrote our own). |
| Design skills breadth | Impeccable · Claude Design Skills (freshtechbro) · Owl-Listener designer-skills | **Impeccable** (canonical, maintained, Apache-2.0). The collections are *evaluation* — audit and cherry-pick individual skills at most; installing 60+ community skill prompts wholesale violates the routing principle and the security bar. |
| Motion tooling | CSS · Motion/Motion Primitives · **GSAP** | Escalation ladder, not competition: CSS first → Motion for component motion → GSAP (now free) for timeline-heavy narrative. motion-director picks per need. |
| SEO capability | **internal technical-seo + geo** · Claude SEO (AgriciDaniel) | **Internal skills are the baseline** (auditable, ours). Claude SEO is *evaluation*: 25 sub-skills + 18 sub-agents is capability-rich but single-maintainer and prompt-heavy — audit before any adoption, and adopt sub-skills selectively if at all. |
| Scroll-driven 3D/video | **r3f-scenes (R3F/drei)** · Scroll World | Different tools: R3F = real interactive 3D (product views, exploded views). Scroll World = pre-rendered video scrub pages (paid generation services). Router picks by whether the experience needs *interaction* (R3F) or *cinematics* (Scroll World, optional). |
| Image generation | provider abstraction (**config/providers**) · claude-image-gen | The abstraction is the architecture; claude-image-gen is one *evaluation-status* implementation of it. Never let a tool choice leak provider names into project code. |

## Core / optional / redundant / not-simultaneous

- **Core**: skill-router, quality-pipeline, claude-mem, Graphify,
  Superpowers, anthropic frontend-design, vercel agent-skills,
  Impeccable, shadcn/ui, Playwright MCP, Lighthouse, internal skills
  (all 27), OWASP-as-reference.
- **Optional**: Figma MCP, React Bits, Motion Primitives, GSAP, R3F+drei,
  Scroll World, media providers.
- **Evaluation (not installed)**: Ruflo, gstack, agent-browser,
  Claude SEO, Claude Design Skills, claude-image-gen, omni-skill-claude.
- **Redundant (deliberately not adopted)**: community anti-slop repos
  (internal skill covers it), gstack role system (agent roster covers
  it), second browser harness, second memory system.
- **Never simultaneously**: Playwright MCP + agent-browser as defaults ·
  claude-mem + a second memory store · internal workflows + Ruflo
  orchestration · two design systems in one project.
