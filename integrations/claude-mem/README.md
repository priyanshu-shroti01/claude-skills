# Integration: claude-mem (persistent memory)

**Status: required** · License: Apache-2.0 · Pin: 13.15.3
Source: https://github.com/thedotmack/claude-mem (npm `claude-mem`)

The persistent memory layer behind `skills/core/memory/`. Stores compressed
session activity + explicit memories in local SQLite/Chroma and injects
relevant context into future sessions.

## Install (done by `scripts/bootstrap.sh`)

```bash
npx claude-mem@13.15.3 install
```

Alternative (plugin route): `/plugin marketplace add thedotmack/claude-mem`
→ `/plugin install claude-mem`. Pick one route, not both.

## Verify

```bash
claude-mem --version   # or: test -d ~/.claude-mem
scripts/doctor.sh      # reports claude-mem status
```

## Configuration notes

- Storage is local to the machine; nothing syncs anywhere by itself.
- Usage discipline lives in `skills/core/memory/SKILL.md` — what to
  record, what never to record (secrets, transient state).
- Division of labor vs. the knowledge graph: memory = historical
  (decisions/lessons); graph = structural (code relationships). See
  `docs/architecture/skill-overlap.md`.

## Security review (2026-08-21)

- Installs session lifecycle hooks — review what it registered after
  install (`~/.claude/settings.json` hook entries).
- Captures session activity: keep secrets out of sessions (SECURITY.md);
  never paste credentials into chat where memory could compress them.
- Do NOT use any `curl | bash` install path some docs mention — the npx/
  plugin routes above only (SECURITY.md §4).

## Degraded mode

Not installed → projects fall back to a `MEMORY.md` file with the same
conventions (project-init handles this); doctor reports WARN.
