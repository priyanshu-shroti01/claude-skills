#!/usr/bin/env bash
# Permission model integrity: levels defined, sensitive list complete,
# settings.json denies the obvious, ceilings consistent (via verify).
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

python3 - <<'PYEOF'
import json, sys, yaml
fails = []

levels = yaml.safe_load(open("config/permissions/permission-levels.yaml"))
for lv in range(6):
    if lv not in levels.get("levels", {}):
        fails.append(f"level {lv} undefined")
for lv in (4, 5):
    if "approval" not in levels["levels"][lv]:
        fails.append(f"level {lv} missing approval requirement")
if levels.get("resolution", {}).get("default_max_autonomy") != 3:
    fails.append("default_max_autonomy != 3")
if len(levels.get("agent_ceilings", {})) != 29:
    fails.append(f"agent_ceilings has {len(levels.get('agent_ceilings', {}))} entries, want 29")

approval = yaml.safe_load(open("config/permissions/approval-required.yaml"))
text = json.dumps(approval).lower()
for needle in ("production deployment", "destructive migrations", "sudo",
               "firewall", "dns", "mass outreach", "credential"):
    if needle not in text:
        fails.append(f"approval-required missing: {needle}")

settings = json.load(open(".claude/settings.json"))
deny = " ".join(settings.get("permissions", {}).get("deny", []))
for needle in ("sudo", ".env", "--force"):
    if needle not in deny:
        fails.append(f"settings.json deny list missing: {needle}")
hooks = json.dumps(settings.get("hooks", {}))
if "pre-tool-guard.sh" not in hooks:
    fails.append("settings.json does not wire pre-tool-guard hook")

for f in fails:
    print("FAIL", f)
sys.exit(1 if fails else 0)
PYEOF
RC=$?
[ $RC -ne 0 ] && exit 1

# ceilings consistency (agents section of verify)
bash scripts/verify.sh --section agents >/dev/null 2>&1 || { echo "ceiling cross-check failed"; exit 1; }
exit 0
