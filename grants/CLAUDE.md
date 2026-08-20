# Doikayt Grant Search — Operating Mode

Read [`README.md`](README.md) for current status, [`../doikayt.profile.txt`](../doikayt.profile.txt)
for the org profile and current funding priority, and [`prompt.md`](prompt.md) for the
`grants.json` schema and the durable screening/mission-alignment criteria.

`grants.json` is a living database. Ongoing work is one of two operations:

## A. Add a newly identified candidate

1. Check `grants.json` first — if this funder already has an entry (including `Excluded`),
   don't re-create it; update the existing record's `change_log` instead.
2. Create a new entry. Populate the Identity & Eligibility fields (`org_name` through
   `political_activity_restrictions`, plus enum companion fields) per the schema in
   [`prompt.md`](prompt.md).
3. Screen it against the criteria in `prompt.md`'s Screening Result section: set `tier` and
   `structural_fit_score`. `accepts_fiscally_sponsored_applicants` is usually the deciding
   structural question — cross-reference [`../fiscal-sponsorship/sponsors.json`](../fiscal-sponsorship/sponsors.json)
   if it matters which sponsor would satisfy it. Set `exclusion_reason` if `Excluded` — never
   delete excluded entries.
4. If not excluded, run mission alignment: populate `mission_alignment.*` and
   `mission_fit_score`.
5. If it lands Tier 1 (or Tier 2 and worth pursuing), populate `outreach.*`, reusing
   `mission_alignment.best_fit_framing` rather than re-deriving it.
6. Set `status.date_last_verified` and `status.source_urls` at creation time. Add an initial
   `change_log` entry.

## B. Log progress on an existing candidate

Application sent, reply received, deadline reconfirmed, terms changed, etc.

1. Find the record by `org_name`.
2. Update `status.current_assessment`, `status.next_action`, and `status.application_status`
   to reflect what happened.
3. Bump `status.date_last_verified` if anything was reconfirmed (deadlines, eligibility,
   fiscal-sponsor acceptance) during the interaction.
4. Append — never edit in place — a `change_log` entry describing what happened and when.
5. If new information changes `tier`, `structural_fit_score`, or `mission_fit_score`, update
   those too and explain why in the same `change_log` entry.

## Deadline triage

Before deciding what to work on in a session, check `application_deadline` across active
candidates (see [`docs/querying-grants.md`](docs/querying-grants.md) for the query):

- **> 7 days out:** normal priority — work in tier order.
- **≤ 7 days out:** immediate action regardless of tier.
- **≤ 1 day out, or passed:** very likely missed — don't rush a submission. Set `next_action`
  to watch for the next `application_cycle` and log what happened.

## Shared discipline

- Never guess — use `"Unclear"` / `"Requires confirmation"` when uncertain.
- Prefer primary sources over third-party descriptions; record `status.source_urls`.
- Flag legal/tax questions as needing counsel review rather than presenting them as settled.
- Commit after each meaningful update so history stays an audit trail.
- For query patterns, see [`docs/querying-grants.md`](docs/querying-grants.md).
