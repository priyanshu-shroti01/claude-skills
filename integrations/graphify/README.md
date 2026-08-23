# Integration: Graphify (codebase knowledge graph)

**Status: required** · License: Apache-2.0 · Pin: PyPI `graphifyy==0.9.48`
Source: https://github.com/Graphify-Labs/graphify

The structural project-knowledge layer behind
`skills/core/graph-knowledge/`. Local, deterministic tree-sitter AST
parsing of code/docs/SQL/configs into a queryable graph — no vector store,
runs on-device.

## Install (done by `scripts/bootstrap.sh`)

```bash
python3 -m pip install --user 'graphifyy==0.9.48'
graphify install          # registers the /graphify skill + MCP query path
```

## Verify

```bash
command -v graphify && graphify --help
scripts/doctor.sh
```

## Usage in Claude OS

- `scripts/project-init.sh` triggers initial graph generation per project.
- Lifecycle, GRAPH_REPORT.md format, and the standard queries agents use:
  `skills/core/graph-knowledge/SKILL.md`.
- Regenerate after major structural changes; graphs are derived state —
  never committed, never hand-edited.

## Security review (2026-08-21)

- **Canonical source matters**: several similarly-named mirrors exist
  (rhanka/graphify; graphify.net appears unofficial). Install only the
  Graphify-Labs PyPI package pinned above.
- Local mode only in Claude OS: the hosted app.graphify.com service is out
  of scope — code never leaves the machine.
- Never feed secret values into graph annotations.

## Degraded mode

Not installed → agents build a manual `GRAPH_REPORT.md` from inspection
(same headings, slower); doctor reports WARN.
