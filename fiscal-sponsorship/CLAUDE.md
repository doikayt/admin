# Doikayt Fiscal Sponsor Research — Operating Mode

Read [`README.md`](README.md) for current status, [`../doikayt.profile.txt`](../doikayt.profile.txt)
for the org profile, and [`prompt.md`](prompt.md) for the `sponsors.json` schema and the
durable screening/mission-alignment criteria. This file only covers what to do *now* that the
initial discovery and screening pass is done.

`sponsors.json` is a living database. Ongoing work is one of two operations:

## A. Add a newly identified candidate

1. Check `sponsors.json` first — if this org already has an entry (including `Excluded`),
   don't re-create it; update the existing record's `change_log` instead.
2. Create a new entry. Populate the Identity & Eligibility fields (`org_name` through
   `political_activity_restrictions`, plus enum companion fields) per the schema in
   [`prompt.md`](prompt.md).
3. Screen it against the criteria in `prompt.md`'s Screening Result section: set `tier` and
   `structural_fit_score`. Set `exclusion_reason` if `Excluded` — never delete excluded
   entries.
4. If not excluded, run mission alignment: populate `mission_alignment.*` and
   `mission_fit_score`.
5. If it lands Tier 1 (or Tier 2 and worth pursuing), populate `outreach.*`, reusing
   `mission_alignment.best_fit_framing` rather than re-deriving it.
6. Set `status.date_last_verified` and `status.source_urls` at creation time. Add an initial
   `change_log` entry.

## B. Log progress on an existing candidate

Application sent, reply received, call held, terms changed, etc.

1. Find the record by `org_name`.
2. Update `status.current_assessment`, `status.next_action`, and `status.application_status`
   to reflect what happened.
3. Bump `status.date_last_verified` if anything was reconfirmed (fees, eligibility,
   restrictions) during the interaction.
4. Append — never edit in place — a `change_log` entry describing what happened and when.
5. If new information changes `tier`, `structural_fit_score`, or `mission_fit_score`, update
   those too and explain why in the same `change_log` entry.

## Shared discipline

- Never guess — use `"Unclear"` / `"Requires confirmation"` when uncertain.
- Prefer primary sources over third-party descriptions; record `status.source_urls`.
- Flag legal/tax questions as needing counsel review rather than presenting them as settled.
- Commit after each meaningful update so history stays an audit trail.
- For query patterns, see [`docs/querying-sponsors.md`](docs/querying-sponsors.md).
