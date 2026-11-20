---
name: whmcs-operations
description: Working safely inside a live WHMCS install — addon and server modules, hooks, localAPI vs the Capsule ORM, scripts run as the panel user, and the things that quietly break billing. Use when building or changing a WHMCS module, hook, or admin script.
---

# WHMCS Operations

WHMCS is a live billing system. A bad write here does not throw — it
mis-charges, double-provisions, or silently stops renewals. Treat every
change as touching real money.

## Run as the panel user, from the panel dir

Scripts bootstrap WHMCS and must run as the user that owns the install,
on the same PHP the panel uses:

```bash
sudo -u <paneluser> /opt/cpanel/ea-phpXX/root/usr/bin/php /path/script.php
```

```php
<?php
chdir('/home/<paneluser>/portal.example.in'); require 'init.php';
use Illuminate\Database\Capsule\Manager as DB;
```

- A file you create as root must be `chown`ed back to the panel user, or the
  panel can't read it and cron silently skips it.
- Never run module cron on a PHP version the panel has dropped — a dead cron
  looks healthy but does nothing (the classic "renewals stopped" cause).

## localAPI vs Capsule — pick deliberately

- **Reads / reports:** Capsule (`DB::table(...)`). Fast, no side effects.
- **Anything with side effects** (payments, provisioning, emails, status
  changes): the **localAPI**, never a raw `UPDATE`. `AddInvoicePayment`,
  `SendEmail`, `ModuleCreate`, `AcceptOrder` fire the hooks and state machine
  that a raw write skips.

The trap: marking an invoice paid with a raw `UPDATE tblinvoices` leaves the
service's due date, provisioning and domain registration untriggered. Use
`AddInvoicePayment` (and confirm `processPaidInvoice` ran) so the paid-invoice
chain completes.

## Hooks

- Register in `includes/hooks/` (or the module). Keep each hook **idempotent
  and fast** — hooks run inside the request; a slow or throwing hook degrades
  the whole panel (a hanging outbound call in a hook can eat every PHP-FPM
  worker).
- Guard side-effecting hooks behind an explicit opt-in setting, so enabling a
  module never changes billing behaviour by surprise.
- `AcceptOrder`, `InvoicePaid`, `AfterModuleCreate` are the load-bearing ones
  — read the current handler before adding another.

## Products, pricing, provisioning

- `tblproducts.type` drives the client-area UI and the provisioning call:
  `hostingaccount` → CreateAccount, `reselleraccount` → CreateReseller (needs
  reseller-management rights on the server). Changing `type` changes the
  client-area login button — know that before you flip it.
- Pricing lives in `tblpricing` keyed by `type='product'`, `relid`, `currency`.
  A missing currency row means the product silently can't be ordered in that
  currency.
- Hidden products (`hidden=1`) are orderable by direct link but not listed —
  the right way to stage a launch.

## Before any change

1. Back up the rows or files you touch (JSON dump of the rows, tarball of the
   files), with the rollback command written down.
2. On schema or type changes, confirm no active service depends on the old
   behaviour.
3. `php -l` every PHP file you deploy; lint as the panel user on the panel's
   PHP.
4. Verify by reading back through the API/Capsule, not by assuming the write
   landed.

## Never

- Read or print email bodies, `.env` secrets, or card/gateway credentials.
- Touch the live Template / OrderFormTemplate settings as a side effect.
- Leave a script holding secrets world-readable.
- Change version numbers or rename stored identifiers (module names, gateway
  keys, licence keys) unless that is the explicit task.
