---
name: functional-qa
description: Functional test procedure - deriving test plans from specs, exercising happy/edge/failure paths in the running app, and reporting verified results. Use before any behavior change is called done.
---

# Functional QA

Verify behavior against specification in the **running application**.
Run by qa-agent; Playwright MCP is the standard browser harness (overlap
ruling: `docs/architecture/skill-overlap.md`).

## Test plan derivation

From the spec/brief — not the implementation:
1. Enumerate user flows + acceptance criteria.
2. Per flow: happy path · input edges (empty, max-length, boundary,
   unicode, paste) · timing edges (double-click, back button, refresh
   mid-flow, slow network) · failure paths (API error, validation, auth
   expiry, offline).
3. Per integration point: what happens when the other side is down/slow/
   returns garbage.

## Execution rules

- Test the running app (dev/staging build), never conclusions from code.
- Forms: every field's validation (client AND server — bypass the client
  once), error display, success path, and *data actually arrived* (check
  the store/inbox/endpoint).
- State transitions: verify the UI can't reach invalid states via
  rapid/reordered actions.
- Auth: positive and negative — the forbidden thing must actually be
  forbidden.
- Evidence per failure: screenshot/trace + exact reproduction steps.
- Regressions: reproduce the bug first (failing check), then verify the
  fix turns it green; the check joins the suite.

## Report format

```
CASE | RESULT (pass/fail/blocked) | EVIDENCE | REPRO (failures)
```
Summary: **verified working** / **verified broken** / **not tested** —
the third listed honestly with reasons (time, environment, blocked deps).

## Exit bar

A behavior change passes functional QA when: all planned cases executed,
failures filed with repro, no blocker/major open, and the "not tested"
list is empty or human-accepted.
