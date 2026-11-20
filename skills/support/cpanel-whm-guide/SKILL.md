---
name: cpanel-whm-guide
description: Accurate step-by-step help for common cPanel and WHM/reseller tasks — SSL via Let's Encrypt/AutoSSL, nameservers, addon domains, email, MySQL, WordPress, and reseller onboarding (WHM, WHMCS). Use when helping a hosting customer or reseller do something in their panel.
---

# cPanel / WHM Guide

Help customers do the routine things themselves so support only gets the real
technical issues. Steps must match what the panel actually shows; a wrong menu
path wastes everyone's time.

## cPanel — common tasks

- **SSL (Let's Encrypt / AutoSSL):** SSL/TLS Status → select the domain →
  *Run AutoSSL*. Certificates are free and auto-renew. Explain propagation:
  a new domain gets its cert within minutes of DNS resolving to the server.
- **Nameservers:** the customer sets these at their *registrar*, not in cPanel.
  Give the brand's nameservers (e.g. `ns1.example.in` / `ns2.example.in`) and
  note DNS takes a few hours, up to 24–48h worldwide.
- **Addon domain:** Domains → Create A New Domain → enter the domain (its doc
  root and subdomain are filled automatically). The domain must point at the
  server's nameservers first.
- **Email:** Email Accounts → Create. Then *Connect Devices* shows the exact
  IMAP/SMTP settings. For deliverability, make sure SPF and DKIM exist (Email
  Deliverability shows what's missing).
- **MySQL:** MySQL Databases → create DB → create user → add user to DB with
  privileges. phpMyAdmin for the data.
- **WordPress:** WP Toolkit (if provisioned) → Install, or Softaculous. Keep
  core/plugins updated; that's the top cause of hacked sites.
- **PHP version / limits:** MultiPHP Manager to switch version; PHP options for
  `memory_limit`, `upload_max_filesize`.

## WHM / reseller onboarding (for new resellers)

Many resellers are starting their hosting business and have never seen WHM.
Walk them through the arc, not just one button:

1. **WHM basics:** WHM is where a reseller manages *their* customers. Log in
   via the client area's WHM button (or `:2087`).
2. **Packages:** Packages → Add a Package (disk, bandwidth, features) — the
   plans they'll sell.
3. **Create accounts:** Account Functions → Create a New Account, on a package.
4. **Private nameservers:** so their customers see *their* brand's nameservers
   — set the hostnames and the registrar glue records.
5. **WHMCS:** we provide the WHMCS zip with the licence key inside; they enter
   the key during the installer. Then: add their WHM as a *server*, create
   products mapped to WHM packages, connect a payment gateway, set up domains
   and email templates, place a test order end to end, then launch.
6. **Common first errors:** DNS not pointed yet, package feature mismatch,
   WHMCS server connection (IP/API token), gateway test mode left on.

## Rules

- Only state limits/features that are actually provisioned on the plan — never
  advertise capacity that isn't there.
- If a task needs root or a server-side change the customer can't do, say so
  and hand it to support rather than sending them in circles.
- Give the menu path *and* what success looks like, so they know it worked.
