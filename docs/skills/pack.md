# The Claude OS Pack

Everything the OS can draw on, in one list, with the status that decides
whether it is installed. Authoritative data lives in
`config/skills/external-skills.yaml` (machine) and
[`../dependencies.md`](../dependencies.md) (licence + security record);
the rulings that stop two things doing the same job live in
[`../architecture/skill-overlap.md`](../architecture/skill-overlap.md).

**Breadth is availability, not load order.** 27 internal skills + 32
registered externals is a catalogue. The Skill Router still loads the
minimum for the task in front of it. A skill that is registered and not
loaded costs nothing; a loaded skill you did not need pollutes every
decision after it.

## Install

```bash
# The whole OS, as a plugin, from inside Claude Code:
/plugin marketplace add priyanshu-shroti01/claude-skills
/plugin install claude-os@claude-os

# Or clone and bootstrap (also installs hooks, memory, graph, MCP):
git clone https://github.com/priyanshu-shroti01/claude-skills.git claude-os
cd claude-os && scripts/bootstrap.sh
```

The marketplace also carries the vetted external members
(`no-ai-slop`, `superseo`, `mattpocock-selected`, `lets-scroll`) so one
`marketplace add` reaches all of them. `scripts/install-pack.sh` prints
the exact commands per tier.

**The plugin does not install hooks.** `.claude/hooks/pre-tool-guard.sh`
and `session-start.sh` ship only via `scripts/bootstrap.sh`, with your
consent. A plugin that silently adds a `PreToolUse` hook is precisely
what `.claude/rules/security-rules.md` forbids — including when we would
be the ones doing it.

## Internal — 27 skills, 29 agents, 15 workflows

Always present, no install step, ours to fix.
See [`README.md`](README.md) for the skill library and
[`../../AGENTS.md`](../../AGENTS.md) for the agent roster.

## Required externals — bootstrap installs these

| Capability | What | Why it's required |
|---|---|---|
| Historical memory | claude-mem | Decisions, lessons, project history |
| Structural knowledge | Graphify | Architecture, dependencies, blast radius |
| Skill discovery | **skills CLI + find-skills** | The only way to find capabilities the OS lacks. **Discovery only** — adoption goes through SECURITY.md §4 |
| Engineering method | Superpowers | Planning, TDD, debugging, worktrees |
| Design generation | Anthropic frontend-design | Aesthetic generation guidance |
| Design review | Vercel web-design-guidelines | Review-style guideline set |
| React/Next | Vercel react-best-practices + composition-patterns + view-transitions | Framework standards from the framework's authors |
| Docs voice | Vercel writing-guidelines | Prose review for docs |
| Vercel cost/perf | vercel-optimize | Metric-backed optimisation on deployed apps |
| Design language | Impeccable | Design-language tooling, live browser mode |
| Components | shadcn/ui + MCP | The base component system |
| **Prose slop** | **no-ai-slop** | The copy half of the anti-slop gate |
| Browser automation | Playwright MCP | QA + visual QA harness |
| Measurement | Lighthouse | Performance / SEO / a11y numbers |
| Security reference | OWASP Cheat Sheets | Linked, never vendored (CC BY-SA) |
| Visual reference | Awwwards Three.js gallery | Looked at, never copied ([sources](../../references/design/inspiration-sources.md)) |

## Optional externals — opt in per project

| Capability | What | The catch |
|---|---|---|
| Design-to-code | Figma MCP | Plan-gated, proprietary, beta pricing |
| Animated components | React Bits | MIT **+ Commons Clause** — not redistributable |
| Motion components | Motion Primitives | Beta, breaking changes |
| Timeline animation | GSAP | Free, but a custom non-OSI licence |
| Real interactive 3D | react-three-fiber + drei | Pin fiber v9 for React 19 |
| **3D components/shaders** | **ThreeUI** | **Community subset MIT only**; catalog media and Pro/Beta source are not |
| Scroll cinematics | lets-scroll | **Costs real money** — approve the budget first |
| **SEO execution** | **SuperSEO Skills** | Vendor-authored; internal SEO skills stay the gate |
| **Eng. methodology extras** | **mattpocock/skills** | **Cherry-pick 9 of 25** — the rest duplicate our agents; its git hook must not stack on ours |
| Media generation | image / video providers | Needs your own keys and budget |
| Lead research | internal lead-research | Human enables per engagement |

## Not installed, and why

- **Evaluation** — Ruflo, gstack, agent-browser, Claude Design Skills,
  claude-image-gen, omni-skill-claude, Claude SEO *(superseded by
  SuperSEO)*, Scroll World *(superseded by lets-scroll)*.
- **Blocked** — Scout. Scrapes social platforms against ToS and
  SMTP-probes harvested personal emails. `skills/growth/lead-research`
  is the lawful alternative.

"Evaluation" is a real answer and often the right one. A capability the
OS declines to install is a decision, recorded with a reason — not an
oversight.

## Adding to the pack

`find-skills` makes discovery cheap. It does not make adoption cheap.
The bar, from `SECURITY.md` §4 and
[`skill-overlap.md`](../architecture/skill-overlap.md):

1. Canonical source — the real owner, not a same-named clone.
2. Licence — read the file, not the badge.
3. Maintenance — last push, cadence, bus factor.
4. **Clone it and read what executes.** Hooks, installers, postinstall,
   network calls. A `PreToolUse` hook is a stop-and-ask.
5. Overlap — add a ruling, or don't adopt it.
6. Pin and record in **both** the registry and `docs/dependencies.md`.

Install counts and GitHub stars are popularity. They are not step 4.
