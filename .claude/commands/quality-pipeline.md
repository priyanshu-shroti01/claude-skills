---
description: Run the universal quality pipeline gates against current work
---

Target: $ARGUMENTS (default: the work in progress on the current branch)

Follow `skills/core/quality-pipeline/SKILL.md`. Determine which gates apply
to this work, run each applicable gate in order (code review → security →
functional QA → visual QA → accessibility → SEO → performance → anti-slop →
production check), and produce the gate report: PASS/FAIL per gate with
findings. Remember: implementer and reviewer must be separate — delegate
review gates to the appropriate review agents rather than self-assessing.
