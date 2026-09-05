# Skill Overlap Analysis

Explicit rulings on overlapping capabilities so the Skill Router loads
exactly one per need. Re-evaluate when a listed project changes character
(rulings dated 2026-08-21 unless a row says otherwise).

**The pack does not change the principle.** The registry now carries 32
entries. Breadth is *availability*, not *load order*: the router still
loads the minimum, and the rulings below still allow exactly one per need.
A large catalogue with no rulings is not a pack, it is a mess.

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
| Design taste enforcement (rendered UI) | **internal anti-slop** · Impeccable's detectors | **Internal anti-slop skill is the gate** (ours = scored rubric + loop + our escalation rules). Impeccable is installed for its complementary strengths (design language tooling, live browser mode); its anti-pattern detectors may *inform* findings but the gate and rubric are ours. |
| Prose / copy slop | **no-ai-slop (petergyang)** · internal anti-slop's Content cluster | **Not an overlap — a gap that was open.** Ruling 2026-09-05. Our anti-slop skill scores *rendered pixels*: composition, surface, typography, motion, and a thin Content cluster. It has never carried a prose ruleset. no-ai-slop is 20+ *named* writing patterns (binary contrasts, colon reveals, faux-insight setups, fake-profound kickers, importance puffery) with an edit mode and a detect mode. Both run: **visual gate on the render, prose gate on the copy**, and a page ships only when both pass. Where they touch — placeholder/generic copy inside a UI — the visual gate raises it and no-ai-slop supplies the fix. Its named-pattern approach is also the honest one: it refuses to score "how AI-written is this," which no detector can actually do. |
| Skill discovery | **find-skills + skills CLI (vercel-labs/skills)** | New capability, nothing to displace — the OS had no way to find capabilities it does not already carry. Ruling 2026-09-05. **Discovery only.** It searches skills.sh and can install with one command; that install path is the danger. Its quality signals are install counts and stars — popularity, not an audit. Nothing it surfaces enters the system until it clears SECURITY.md §4 and lands in the registry + `docs/dependencies.md` with a status. An agent never runs `skills add -g -y` off its own decision. |
| External SEO layer | **superseo-skills (InhouseSEO)** · Claude SEO (AgriciDaniel) · internal technical-seo + geo | Ruling 2026-09-05, two levels. **Internal technical-seo + geo remain the gate** — auditable, ours, and the thing a shipped page is measured against. Above them the OS lacked *execution* skills (briefs, drafting, semantic gap, cluster planning, snippet work, link strategy); superseo-skills fills exactly that and is adopted as the external layer: Apache-2.0, prompt-only, zero executables, no API keys, no paid tier. Claude SEO is **superseded** — a larger unaudited prompt surface (25 skills + 18 sub-agents) with optional paid dependencies, for the same gap. Never install both. |
| Engineering methodology | **Superpowers** · mattpocock/skills · gstack · Ruflo | Ruling refined 2026-09-05. **Superpowers stays primary** (planning, TDD, debugging, worktrees). mattpocock/skills is adopted *selectively* for what neither Superpowers nor our agents cover: diagnosing-bugs, resolving-merge-conflicts, domain-modeling, to-spec, to-tickets, grill-me/grilling, teach, writing-for-agents. Explicitly **not** adopted: its code-review, tdd, research, implement, prototype, triage, codebase-design — duplicates of our code-reviewer agent, research-intelligence and Superpowers. Installing the plugin wholesale pulls all 25 and is the routing violation this table exists to prevent. Its `git-guardrails` PreToolUse hook must never be stacked on our `pre-tool-guard.sh`. |
| 3D component source | **r3f-scenes (ours)** · ThreeUI · React Bits | Same shape as the 2D ruling. **r3f-scenes is the architecture** — stack versions, scene structure, budgets, mobile fallbacks. ThreeUI is per-component raw material for hero scenes and shaders, imported through r3f-scenes' rules, never a second scene architecture. License line matters: only the Community subset is MIT; threeui.com catalog media and Pro/Beta source are not, and ThreeUI's own MCP + skills are Pro-tier (out of scope for this entry). |
| Visual reference | **references/design/inspiration-sources.md** (Awwwards Three.js gallery et al.) | Reference sources are looked at, never installed and never copied. They inform a research packet; the project `DESIGN.md` governs and the anti-slop gate still decides. An award badge is a popularity signal, not a quality gate. |
| Design skills breadth | Impeccable · Claude Design Skills (freshtechbro) · Owl-Listener designer-skills | **Impeccable** (canonical, maintained, Apache-2.0). The collections are *evaluation* — audit and cherry-pick individual skills at most; installing 60+ community skill prompts wholesale violates the routing principle and the security bar. |
| Motion tooling | CSS · Motion/Motion Primitives · **GSAP** | Escalation ladder, not competition: CSS first → Motion for component motion → GSAP (now free) for timeline-heavy narrative. motion-director picks per need. |
| SEO capability | **internal technical-seo + geo** · Claude SEO (AgriciDaniel) | **Internal skills are the baseline** (auditable, ours). Claude SEO is *evaluation*: 25 sub-skills + 18 sub-agents is capability-rich but single-maintainer and prompt-heavy — audit before any adoption, and adopt sub-skills selectively if at all. |
| Scroll-driven 3D/video | **r3f-scenes (R3F/drei)** · **lets-scroll** · Scroll World | Two rulings (2026-08-23). Interaction vs cinematics: R3F = real interactive 3D (product views, exploded views); pre-rendered scroll-scrubbed video = cinematics. Within cinematics: **lets-scroll is primary** — same concept as Scroll World but more mature (seam frame-locking method, manual asset path, native 9:16 mobile chain, cost approval before spend). Scroll World demoted to *evaluation* (redundant); revisit only if lets-scroll stalls. Never install both. |
| Image generation | provider abstraction (**config/providers**) · claude-image-gen | The abstraction is the architecture; claude-image-gen is one *evaluation-status* implementation of it. Never let a tool choice leak provider names into project code. |

## Core / optional / redundant / not-simultaneous

- **Core**: skill-router, quality-pipeline, claude-mem, Graphify,
  Superpowers, anthropic frontend-design, vercel agent-skills,
  skills CLI + find-skills, no-ai-slop, Impeccable, shadcn/ui,
  Playwright MCP, Lighthouse, internal skills (all 27),
  OWASP-as-reference, Awwwards-as-reference.
- **Optional**: Figma MCP, React Bits, Motion Primitives, GSAP, R3F+drei,
  ThreeUI, lets-scroll, superseo-skills, mattpocock-skills (selective),
  media providers.
- **Evaluation (not installed)**: Ruflo, gstack, agent-browser,
  Claude Design Skills, claude-image-gen, omni-skill-claude,
  Claude SEO (superseded by superseo-skills),
  Scroll World (superseded by lets-scroll).
- **Redundant (deliberately not adopted)**: gstack role system (agent
  roster covers it), mattpocock's code-review/tdd/research/implement/
  prototype/triage/codebase-design (our agents + Superpowers cover
  them), second browser harness, second memory system, Claude SEO,
  Scroll World.
- **Never simultaneously**: Playwright MCP + agent-browser as defaults ·
  claude-mem + a second memory store · internal workflows + Ruflo
  orchestration · two design systems in one project · two 3D scene
  architectures · lets-scroll + Scroll World · superseo-skills +
  Claude SEO · mattpocock git-guardrails hook + our pre-tool-guard.sh.

## Adopting anything the pack surfaces

find-skills makes discovery cheap. It does not make adoption cheap. Every
candidate, however popular, clears the same bar before it is registered:

1. **Canonical source** — the real owner's repo, not a same-named clone.
2. **License** — read the file, not the badge. Note anything that is not
   plain permissive (Commons Clause, CC BY-SA, custom, split Community/Pro).
3. **Maintenance** — last push, release cadence, bus factor, named owner.
4. **Read what executes** — clone it and look. Hooks, installers, postinstall
   scripts, network calls, credential handling. Prompt-only is a finding
   worth recording; a `PreToolUse` hook is a stop-and-ask.
5. **Overlap** — which existing capability does it duplicate? Add a row to
   the table above, or don't adopt it.
6. **Pin and record** — `config/skills/external-skills.yaml` *and*
   `docs/dependencies.md`, with a status. `evaluation` is a real answer
   and often the right one.

A skill that fails step 4 or 5 does not get in because it has a million
installs.
