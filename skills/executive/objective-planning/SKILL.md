---
name: objective-planning
description: Turn an owner's objective into measurable outcomes, a dependency-ordered plan, delegated tasks with success conditions, approval requests and a report. Use when acting as a CEO, commander or department head that receives an objective rather than a task.
---

# Objective Planning

The job is not to repeat the objective back as a to-do list. It is to decide
what "done" means, find what is missing, put the work in an order that can
actually run, give each piece to someone who can do it, and report what was
verified, not what was attempted.

## 1. Restate the objective as outcomes

Write 1-3 outcomes, each checkable by someone who did not do the work.

- Bad: "Improve security."
- Good: "Every internet-facing service is listed with its version and exposure;
  each critical finding has an owner, a fix or an accepted-risk decision."

If you cannot write a checkable outcome, the objective is ambiguous: ask one
question that changes the plan, or state the assumption you are making and
continue. Never ask a question whose answer would not change what you do.

## 2. Challenge the objective before planning it

Check, in order, and say so plainly when one fails:
1. **Authority.** Does any likely step need an approval you do not hold
   (money, customer-visible change, production change, deletion, credentials,
   policy or organisation change)? Name it now, not at the end.
2. **Capability.** Does the organisation have the tools for it? A step no one
   can perform is an escalation, not a plan step.
3. **Evidence.** What must be read before anything is changed? Reads come first.
4. **Realism.** Deadline, budget and the number of changes that can be verified
   separately. Two changes at once cannot be told apart if something breaks.

## 3. Decompose

- Each task has: owner (by role), input, action, **success condition**,
  verification method, and whether it needs approval.
- Order by dependency, reads before writes, cheap before expensive.
- One task = one owner = one verifiable result. Split anything with "and".
- Keep a round small (about ten tasks). Plan the next round from results,
  not from guesses about results.

## 4. Delegate

Give a task to the role whose charter covers it and who holds the tool. If the
best owner lacks the tool, do not route around it: give it to a holder, or
escalate the gap. A manager's job on delegation is to check the success
condition is concrete before the employee starts.

## 5. Prepare approvals properly

An approval request states: the exact action and arguments, the target, why,
the blast radius, the rollback, and what happens if it is refused. Group the
gated steps of one plan into one request when they belong together; never
bundle unrelated changes to get them through. Approval is permission to try,
not proof that it worked.

## 6. Monitor and review

- A tool returning success is not verification. Each write gets a fresh read
  that shows the intended state.
- A failed task gets one retry for transient errors, then a different owner,
  then an escalation with what was tried. Never loop.
- Review an employee's result against its success condition, not its prose.

## 7. Report

Four headings, facts only: **Found**, **Done (verified)**, **Not done and why**,
**Needs you** (each with the decision and the options). Unverified claims are
labelled as such. No adjectives about effort.

## Performance review (periodic)

For each owner: tasks completed against success conditions, verification
failures, escalations that should not have been needed, approvals refused and
why. Recommend training text or a narrower scope; never a new permission as a
reward.
