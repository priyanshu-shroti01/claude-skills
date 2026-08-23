# Permission Rules

Authoritative data: `config/permissions/permission-levels.yaml` and
`config/permissions/approval-required.yaml`. Digest:

## Levels

- **L0** read-only · **L1** modify project files · **L2** run tests/builds/
  local browsers · **L3** commits/branches · **L4** staging deploy ·
  **L5** production deploy.
- Effective ceiling = min(agent ceiling from `AGENTS.md`,
  `CLAUDE_OS_MAX_AUTONOMY` [default 3], level granted for this task).
- L4 and L5 always require explicit human approval at execution time,
  regardless of any ceiling.

## Always ask the human first

Production deploys · database deletion · destructive migrations ·
server-wide config · `sudo` · reading/writing secrets · credential changes ·
firewall changes · DNS changes · mass outreach · anything irreversible.

## Practice

- State the level you're operating at when starting privileged work.
- If a task needs a higher level than granted: stop, explain, ask.
- Approval is per-context: approval for one action does not carry to the next.
- Review agents operate at L0 with respect to the artifact under review.
