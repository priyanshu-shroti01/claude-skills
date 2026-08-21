# Integration: Growth data sources

**Status: optional** — growth-agent works from inspection alone (labeled
as such) until data sources are connected.

## Analytics + Search Console

```bash
# .env
GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account.json  # outside the repo!
ANALYTICS_PROPERTY_ID=…
SEARCH_CONSOLE_SITE_URL=https://…
```

- Service-account JSON lives **outside** any repo (the pre-tool-guard
  hook blocks writes of `credentials*.json` into projects).
- Minimum scopes: read-only analytics/webmasters.
- Consumed by: `skills/growth/growth-analysis`,
  `workflows/continuous-growth`, seo-agent (query data).

## Lead research

**kiryano/Scout is BLOCKED** — see `config/skills/external-skills.yaml`:
platform-ToS scraping, personal-email harvesting + SMTP probing
(GDPR/CAN-SPAM exposure), stale.
ALTERNATIVE (in use): `skills/growth/lead-research` — lawful public-data
research, approval-gated outreach, human-executed contact.

## Claude OS rules

- No data source → say so; never fabricate numbers
  (growth-agent charter).
- Mass outreach is on the always-approval list
  (`config/permissions/approval-required.yaml`) — no exceptions.
- Lead lists never enter global memory or public repos.
