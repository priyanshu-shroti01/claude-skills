#!/usr/bin/env bash
# MCP templates: valid JSON, expected servers, env placeholders only —
# no literal credentials.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT" || exit 1

python3 - <<'PYEOF'
import json, re, sys
fails = []
expect = {
    "config/mcp/playwright.json": "playwright",
    "config/mcp/shadcn.json": "shadcn",
    "config/mcp/github.json": "github",
    "config/mcp/figma.json": "figma",
}
for path, server in expect.items():
    try:
        data = json.load(open(path, encoding="utf-8"))
    except Exception as e:
        fails.append(f"{path}: invalid JSON: {e}"); continue
    if server not in data.get("mcpServers", {}):
        fails.append(f"{path}: missing server '{server}'")
    text = open(path, encoding="utf-8").read()
    # any Bearer/token value must be an ${ENV} placeholder
    for m in re.finditer(r'"(?:Authorization|token|apiKey|api_key)"\s*:\s*"([^"]+)"', text, re.I):
        val = m.group(1)
        if "${" not in val:
            fails.append(f"{path}: literal credential-looking value: {val[:20]}")
for f in fails:
    print("FAIL", f)
sys.exit(1 if fails else 0)
PYEOF
