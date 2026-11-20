---
name: php-module-packaging
description: Packaging a commercial PHP/WHMCS module for distribution — release builds, asset tamper manifests, ionCube encoding, licensing, and keeping a public encoded repo separate from private source. Use when cutting a module release or setting up its distribution.
---

# PHP Module Packaging

A commercial module ships as a build artifact, not the working tree. The goal:
a reproducible release, protected code, and a clean split between what the
public sees and what stays private.

## Release build

- One script (`build/release.sh`) produces `dist/`: the files that ship, no
  tests, no `.git`, no dev tooling, no `templates_c`/`storage`/`error_log`.
- The build is reproducible and carries a build id (date + commit) so a
  deployed copy can be traced back to a source commit.
- Run the full test suite on every PHP version the target panels run (e.g. 8.1
  through 8.4) before tagging a release — a module that lints on 8.3 can fatal
  on 8.1.

## Tamper manifest

- If the module stores SHA-256 hashes of its own CSS/JS (a tamper check), any
  asset edit must be followed by a manifest rebuild, or the module refuses to
  load. Rebuild the manifest in the release step, never by hand.
- After any asset change: rebuild manifest → rebuild release → run tests. Skip
  one and the shipped module is inconsistent with its own check.

## Code protection

- Encoding (ionCube) protects the core; keep the **source private** and publish
  only the **encoded** build. Match the encoder target to the panel's loader
  and PHP version.
- Encoding is the last step, after the redesign/logic is final — re-encoding is
  cheap but must happen on the final files, so don't encode mid-change.
- GPL-covered platform? The service-and-signed-updates model (licence server +
  signed update feed) protects the business without fighting the licence; an
  encoder alone doesn't make non-free code compliant.

## Distribution layout

- **Public repo:** encoded build only, under the brand's org account.
- **Private repo:** full source, separate.
- Never push source or PDFs/customer data to the public repo. Purge anything
  sensitive from history before it's public, and keep the public and private
  remotes clearly distinct so a push never crosses over.

## Licensing

- Issue signed, time-bound entitlements from a licence server; validate them in
  the module without phoning home on every request (cache + grace window, so a
  licence-server blip doesn't break a customer's panel).
- US spelling in copy, but never rename a stored identifier (`licenceKey` vs
  `licenseKey`) to match — that breaks existing installs.

## Checklist before a release goes out

1. Tests green on all target PHP versions.
2. Manifest matches assets.
3. `dist/` has no source-only, dev, or sensitive files.
4. Build id recorded; rollback to the previous release is one step.
5. Encoded build in the public repo, source in the private one.
