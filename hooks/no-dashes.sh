#!/usr/bin/env bash
# Stop hook. Blocks a reply that contains an em dash or an en dash, the two
# characters the house standard forbids everywhere. Exits 0 (allow) on any
# problem of its own, so a broken check never blocks your work.
set -u

payload="$(cat)"

command -v python3 >/dev/null 2>&1 || exit 0

python3 - "$payload" <<'PY'
import json, os, sys

BANNED = {"—": "em dash", "–": "en dash"}

try:
    data = json.loads(sys.argv[1])
except Exception:
    sys.exit(0)

# Already blocked once this turn. Let it through so we never loop.
if data.get("stop_hook_active"):
    sys.exit(0)

path = data.get("transcript_path") or ""
if not path or not os.path.exists(path):
    sys.exit(0)

try:
    with open(path, encoding="utf-8") as fh:
        lines = [l for l in fh if l.strip()]
except Exception:
    sys.exit(0)

text = ""
for line in reversed(lines):
    try:
        entry = json.loads(line)
    except Exception:
        continue
    msg = entry.get("message") or {}
    if entry.get("type") != "assistant" and msg.get("role") != "assistant":
        continue
    content = msg.get("content")
    if isinstance(content, str):
        text = content
    elif isinstance(content, list):
        text = "".join(c.get("text", "") for c in content if isinstance(c, dict))
    break

found = sorted({name for ch, name in BANNED.items() if ch in text})
if not found:
    sys.exit(0)

print(json.dumps({
    "decision": "block",
    "reason": (
        "Your reply contains an " + " and an ".join(found) + ". The house standard "
        "forbids both characters everywhere, including chat. Rewrite the reply "
        "using a full stop, a comma, a colon, or brackets. Write number ranges "
        "as \"150 to 200ms\". Send the corrected reply now."
    ),
}))
sys.exit(0)
PY
