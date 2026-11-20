# Runtime catalog: exporting skills to another runtime

Claude OS skills are written for Claude Code, which reads `SKILL.md` straight
from this tree. A product runtime (first consumer: ShrotiHost Agents) cannot
and should not: it needs a pinned, verifiable artefact it can load without a
checkout, the network or anything executable. The runtime catalog is that
artefact.

## Contract
- **Source:** first-party `skills/<category>/<name>/SKILL.md` plus
  `config/skills/runtime-export.yaml` (risk, trigger phrases, dependencies, and
  `runtime: false` for skills that only make sense inside Claude Code).
  `SKILL.md` keeps the Agent Skills shape (`name`, `description`); nothing a
  runtime needs is added to it.
- **Exporter:** `python3 scripts/export-runtime-catalog.py` writes
  `dist/runtime-catalog/catalog.json` and `catalog.json.sha256`. `--check`
  validates only. It refuses a tree with uncommitted skill changes, so the
  recorded commit is the content.
- **Format 1:** `schemas/runtime-catalog.schema.json`. Keys sorted, the commit
  date as `exportedAt`, so the same commit always produces the same bytes.
  Each skill carries the sha256 of its instructions; the file's sha256 is the
  release pin.
- **Not exported, ever:** scripts or any file beside a `SKILL.md` (a skill with
  them is flagged `hasScripts`), hooks, commands, settings, plugin metadata, and
  every `external/` skill (listed under `excluded` with the reason: no runtime
  review, licence file present or missing).
- **Refused at export:** a name that is not the folder name, a skill with no
  runtime metadata (or metadata naming no skill), invalid risk, instructions
  under 200 or over 24,000 characters, a missing dependency or a cycle, and
  instruction-shaped attacks (ignore your instructions, bypass an approval,
  grant yourself a right, pipe a download into a shell, send a secret to a URL,
  role markup, speaking as the founder). The consuming runtime repeats every
  check; the export is not trusted just because it passed here.

## Release
1. Bump `VERSION` (and `SYSTEM_MANIFEST.yaml`, plugin metadata, CHANGELOG).
2. Commit, then `python3 scripts/export-runtime-catalog.py`.
3. `gh release create v<VERSION> dist/runtime-catalog/catalog.json dist/runtime-catalog/catalog.json.sha256`.
4. In the runtime, import that file with its sha256 (ShrotiHost:
   `node scripts/import-skill-catalog.mjs catalog.json <sha256>`).

A runtime keeps the previous release beside the current one, so rolling back is
a switch, not a rebuild. It never fetches a catalog at run time.

## What a skill is to a runtime
Method, not authority. Loading a skill grants no tool, permission or approval;
the runtime's own policy engine decides every action. Risk in the export is the
risk of the work the skill guides, for the runtime to weigh; it never lowers a
runtime gate.

Tests: `tests/skills/test_runtime_catalog.sh`.
