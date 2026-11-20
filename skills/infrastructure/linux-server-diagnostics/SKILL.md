---
name: linux-server-diagnostics
description: Diagnose a Linux or cPanel/CloudLinux host from evidence - load, memory and swap, disk and inodes, network, failing services, Apache/Nginx/PHP-FPM, MariaDB, mail and backups - and propose the smallest verified fix. Use for any server health question, outage or slowness report.
---

# Linux Server Diagnostics

Read first, change last, verify always. Most "server problems" are one account,
one service or one full disk.

## Order of investigation

1. **Scope.** One site or all? One service or the host? Since when? What
   changed just before (deploy, update, restart, traffic spike, cron)?
2. **Resource pressure.**
   - Load vs CPU count (`uptime`, `nproc`): load above cores for minutes means
     queueing; check which processes (`top`/`ps` sorted by CPU).
   - Memory: use `available`, not `free`. High swap use with low available
     memory means the box is thrashing; look for the largest resident sets and
     recent OOM kills in the kernel log.
   - Disk: `df -h` and `df -i` (inodes run out before bytes on mail and cache
     directories). A full `/var` or `/tmp` breaks databases, mail and sessions.
   - Network: listening sockets, connection counts per state, packet loss to
     the gateway. A SYN flood or a scraper looks like "the site is slow".
3. **Services.** Failed units (`systemctl --failed`), restart loops (rising
   restart counter), and the unit's own journal for the first error, not the
   last.
4. **Web tier.** Apache or Nginx configuration test before any restart. PHP-FPM
   pool saturation (max children reached) shows as 502/503 under load. Check
   the error log of the affected virtual host, not the global one only.
5. **Database.** MariaDB/MySQL: is it running, was it OOM-killed, are
   connections exhausted, are there long-running queries or a full tmpdir.
6. **Accounts (cPanel/CloudLinux).** A single account hitting LVE limits (CPU,
   memory, entry processes, I/O) shows 503/508 for that site only. That is an
   account limit, not a server fault: a server restart will not fix it.
7. **Mail.** Queue size, frozen messages, blacklisting, disk on the spool.
8. **Backups.** Last successful run time, size compared with previous runs,
   and a test restore of one file. A backup that was never restored is a hope.

## Proposing a change

- Name: the exact action, the target, the evidence that points to it, the
  expected effect, how it will be verified, and what to do if it does not hold.
- Prefer the smallest action: reload over restart, one unit over many.
- A restart that cannot fix the cause (a full disk, a config error, an
  account limit) is futile: decline it and say why.
- Never propose firewall changes, package removals, or deleting data as a
  diagnostic step; those are separate, owner-approved decisions.
- One change at a time, so each can be verified on its own.

## Verification

A fix is verified only by a fresh read after it: the unit active and stable
for a few minutes, the site answering with the expected status, the metric back
under its threshold. If it fails again after a restart, the restart treated a
symptom: report recurrence and escalate the cause.

## Report format

```
SYMPTOM:   what was observed, where, since when
EVIDENCE:  the readings that matter (with times)
CAUSE:     confirmed | not confirmed (what was ruled out)
ACTION:    proposed / taken, with approval reference
VERIFIED:  yes (reading) | no (why)
FOLLOW-UP: the cause to fix if only the symptom was treated
```
