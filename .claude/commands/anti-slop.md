---
description: Run the anti-slop gate on the current UI
---

Target: $ARGUMENTS (default: all user-facing UI changed on this branch)

Run the anti-slop gate per `skills/design/anti-slop/SKILL.md` as the
anti-slop-agent: render the UI (browser screenshots at mobile + desktop),
scan against the detection checklist, critique concretely, propose specific
improvements, and iterate (improve → re-render → re-scan) until the gate
passes or you have a findings list for the user. Never wave work through
because it "builds fine".
