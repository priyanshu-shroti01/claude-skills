# Reference: Launch Runbook Skeleton

The production-agent instantiates this per launch (deployment-gates skill
owns the procedure; this is the fill-in artifact).

## Pre-flight (T-1 day)

- [ ] PRODUCTION_READINESS audit: attached, recommendation: ______
- [ ] All gates green with evidence (list refs): ______
- [ ] Deploy plan: version/tag ______ · steps ______ · migrations ______
- [ ] Rollback: exact steps ______ · tested? ______ · data stance ______
- [ ] Env vars verified in target (names only): ______
- [ ] DNS/TLS ready: ______ · redirects staged: ______
- [ ] Monitoring/error tracking live + test event received: ______
- [ ] Backup taken & restore path known (data-bearing apps): ______
- [ ] **Staging approval recorded**: who ______ when ______

## Launch window

1. Deploy to staging → smoke: health endpoint · money path · forms ·
   error tracker quiet · logs sane.
2. **Production approval recorded**: who ______ when ______
3. Deploy to production → immediate verify: same smoke set + analytics
   event fires + cert/redirect spot-checks + sitemap reachable.
4. Monitor window (agreed: ______ min): error rate, vitals field data,
   4xx/5xx patterns.

## If verification fails

Execute rollback per plan **immediately** → verify rollback → incident
note (what/why/impact) → diagnose offline → new approval for retry.
Never debug live; never fix-forward without fresh approval.

## Post-launch (T+48h, T+1wk)

- [ ] growth-agent report vs. launch success metrics
- [ ] Search Console: coverage/enhancement reports clean
- [ ] learning-agent retrospective filed

## Record

Deploy artifact (version, times, approvers, verification results,
anomalies) → project log.
