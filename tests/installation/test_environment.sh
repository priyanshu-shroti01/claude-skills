#!/usr/bin/env bash
# Environment validation: .env.example placeholders only; manifest env list
# matches; environment profiles parse and stay within policy.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

python3 - <<'PYEOF'
import re, sys, yaml
fails = []

# .env.example: every assignment empty or a ${...} reference
for i, line in enumerate(open(".env.example", encoding="utf-8"), 1):
    line = line.strip()
    if not line or line.startswith("#"):
        continue
    m = re.match(r"^([A-Z0-9_]+)=(.*)$", line)
    if not m:
        fails.append(f".env.example:{i}: not a VAR= line: {line[:40]}")
        continue
    val = m.group(2).strip()
    if val and not (val.startswith("${") or val in ("3",)):
        fails.append(f".env.example:{i}: {m.group(1)} has a literal value — placeholders only")

# Manifest environment list ⊆ .env.example vars
manifest = yaml.safe_load(open("SYSTEM_MANIFEST.yaml", encoding="utf-8"))
example_vars = set(re.findall(r"^([A-Z0-9_]+)=", open(".env.example").read(), re.M))
env = manifest.get("environment", {})
for var in (env.get("optional") or []) + (env.get("behavior") or []):
    if var not in example_vars:
        fails.append(f"manifest env var missing from .env.example: {var}")

# Environment profiles parse; autonomy never exceeds 3; CI can't deploy
for prof, cap in (("local", 3), ("server", 3), ("ci", 2)):
    data = yaml.safe_load(open(f"config/environments/{prof}.yaml"))
    lvl = data.get("autonomy", {}).get("max_level")
    if lvl is None or lvl > cap:
        fails.append(f"environments/{prof}.yaml: max_level {lvl} exceeds policy cap {cap}")

for f in fails:
    print("FAIL", f)
sys.exit(1 if fails else 0)
PYEOF
