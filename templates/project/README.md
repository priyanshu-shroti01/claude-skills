# Project templates

Consumed by `scripts/project-init.sh`:

- `CLAUDE.md.template` — project operating charter ({{VAR}} placeholders
  substituted at init; unresolved ones are left as visible TODOs).
- `DESIGN.md.template` — empty design language, filled by the
  design-direction skill before high-fidelity UI work.
- The project also receives a copy of the root `PRODUCTION_READINESS.md`
  and a starter `.claude/` (settings + hooks + skill links).

Stack-specific starting points live in the sibling directories
(`../nextjs`, `../react`, `../backend`, `../website`) — they document the
sanctioned init commands rather than vendoring scaffolds that would go
stale.
