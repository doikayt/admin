# Notes: Software Freedom Conservancy and secure-user-mgt

Working notes, started 2026-11-18. The idea: Software Freedom Conservancy (SFC) funds or hosts
the development of the secure-user-mgt layer, and becomes its first user and beta tester.

## What we already have on record

- **Inquiry sent 2026-08-21** to `apply@sfconservancy.org`, from the draft in
  [`../blurbs/sfc-inquiry-email.md`](../blurbs/sfc-inquiry-email.md). Ticket
  `[sfconservancy.org #31739]`; automated confirmation from `apply@tix.sfconservancy.org`.
- **No substantive reply** is recorded since then (about three months). The record's
  `next_action` says to reply on that ticket, keeping `[sfconservancy.org #31739]` in the
  subject, and not to send a fresh inquiry.
- **SFC is Tier 1**, structural and mission fit Strong, re-scored 2026-08-20
  (`sponsors.json`, its `change_log`).
- **The inquiry did not mention secure-user-mgt.** It led with typescript-build-config and
  build-tools, GASify's Google Sheets dependency with a de-Google spike (Nominatim), and a
  GitHub-to-Codeberg migration spike tied to the Give Up GitHub campaign.
- **Stale line:** [`README.md`](README.md) still lists SFC as "outreach not yet started",
  which conflicts with `sponsors.json`.

## The two angles

1. **SFC funds the work and uses the result.** SFC gets the framework free and helps beta test
   it, for its own accounts or for its member projects.
2. **Codeberg alignment.** secure-user-mgt is already hosted on Codeberg, which matches the Give
   Up GitHub campaign the inquiry raised. This is evidence the migration spike has started, not
   only a plan.

## Points to check before pitching

- **Is SFC a funder?** Our record describes SFC as a home for member projects: legal home,
  bookkeeping, fundraising infrastructure, about 10% of project revenue. That suggests member
  projects raise their own money and SFC holds it, rather than SFC granting money for
  development. Requires confirmation. If so, the ask is "sponsor us so we can raise money for
  this", not "fund this".
- **Bitwarden is not fully free software.** The framework depends on Bitwarden's hosted
  service. SFC's mission is software freedom, so expect the question of a fully free
  alternative (Vaultwarden is AGPL). Requires confirmation of how SFC would view this, and of
  Bitwarden's current licensing.
- **Customer and sponsor at once.** Being SFC's member project and its supplier at the same time
  may raise a conflict-of-interest question. Flag for counsel review.
- **The stronger customer is the portfolio.** SFC's member projects (for example Git, Wine,
  Selenium, per our record) hold publish tokens, domains and maintainer accounts, and they
  change maintainers. The handover and offboarding procedures fit the fiscal sponsor package
  idea from the secure-user-mgt go-to-market discussion: we operate the metadata and
  procedures, projects keep their own secrets. Requires confirmation that SFC offers any
  account or infrastructure help to members today.

## Suggested next step

Reply on ticket #31739, not a new inquiry. Short, and adding one thing: secure-user-mgt exists,
is on Codeberg, and could serve SFC's member projects. Possible questions:

1. Does Conservancy fund member development directly, or only hold funds members raise?
2. Do member projects get help with shared accounts, publish tokens or handovers when
   maintainers leave?
3. Would a dependency on a hosted, partly proprietary password manager be a concern?

## Open

- Whether to send the reply now or wait for SFC's preliminary questions.
- Whether secure-user-mgt belongs in the sponsorship application at all, or in a separate
  conversation about services to member projects.
