#!/usr/bin/env bash
# Integration configuration: registry entries and integration docs exist and
# agree for graphify + claude-mem (memory/graph layers), and every registry
# entry has the mandatory audit fields.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

python3 - <<'PYEOF'
import os, sys, yaml
fails = []
reg = yaml.safe_load(open("config/skills/external-skills.yaml"))["registry"]

# Mandatory audit fields per SECURITY.md §4 / section 28
required_fields = ("status", "url", "license", "install", "purpose",
                   "security_notes", "maintenance", "version_pin", "verify")
for name, entry in reg.items():
    for field in required_fields:
        if field not in entry:
            fails.append(f"registry {name}: missing field '{field}'")
    if entry.get("status") not in ("required", "optional", "evaluation", "blocked"):
        fails.append(f"registry {name}: bad status {entry.get('status')}")
    if entry.get("status") == "blocked":
        notes = str(entry.get("security_notes", ""))
        if "REASON" not in notes or "ALTERNATIVE" not in notes:
            fails.append(f"registry {name}: blocked without REASON/ALTERNATIVE")

# Memory + graph integrations documented and consistent
for name, doc in (("claude-mem", "integrations/claude-mem/README.md"),
                  ("graphify", "integrations/graphify/README.md")):
    if name not in reg:
        fails.append(f"registry missing {name}")
    if not os.path.exists(doc):
        fails.append(f"missing integration doc: {doc}")
    else:
        text = open(doc, encoding="utf-8").read()
        if reg.get(name, {}).get("url", "\x00") not in text:
            fails.append(f"{doc}: does not reference registry URL for {name}")

# Skills that consume them exist
for p in ("skills/core/memory/SKILL.md", "skills/core/graph-knowledge/SKILL.md"):
    if not os.path.exists(p):
        fails.append(f"missing consumer skill: {p}")

for f in fails:
    print("FAIL", f)
sys.exit(1 if fails else 0)
PYEOF
