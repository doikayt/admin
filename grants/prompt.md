# Doikayt Grant Search — Schema & Criteria

See [`README.md`](README.md) for current status, [`CLAUDE.md`](CLAUDE.md) for how ongoing work
(adding candidates, logging progress) is done, and
[`../doikayt.profile.txt`](../doikayt.profile.txt) for the org profile and current funding
priority that screening is judged against. This file defines the `grants.json` schema and the
screening/mission-alignment/tier criteria every candidate is judged against — the grant-search
counterpart to [`../fiscal-sponsorship/prompt.md`](../fiscal-sponsorship/prompt.md).

## Purpose

Doikayt maintains a research system to identify, evaluate, and prioritize grant funders (and
track applications to same) that could fund completion of Doikayt's GASify/build-tools/geoCRM
software stack — Doikayt's current active funding priority (see
[`../doikayt.profile.txt`](../doikayt.profile.txt) §3) — or Doikayt's work more generally.

The goal is not to find a single funder. The goal is to systematically establish the universe
of plausible grant funders, determine which are actually compatible with Doikayt's structure
(unincorporated, likely operating under a fiscal sponsor), understand how Doikayt's mission and
current project priorities align with each, and maintain a prioritized shortlist for outreach.

## Relationship to fiscal-sponsorship search

Most grant funders require a legal recipient — either Doikayt incorporated directly, or Doikayt
operating under a fiscal sponsor. Since Doikayt is unincorporated, `accepts_fiscally_sponsored_applicants`
(below) is often the deciding structural question, and a funder's answer may depend on which
fiscal sponsor Doikayt ultimately joins. Cross-reference
[`../fiscal-sponsorship/sponsors.json`](../fiscal-sponsorship/sponsors.json) when this matters:
note in `status.current_assessment` which sponsor(s) would satisfy a given funder's requirement.

Restricted, project-scoped funding (funder dictates the project it funds) is explicitly **not**
a downside under Doikayt's current priority — see the funding-priority note in
[`../doikayt.profile.txt`](../doikayt.profile.txt) §3. General/unrestricted funding remains
equally welcome; this is a priority ordering for which *kind* of work to lead with, not an
exclusivity rule.

## CANDIDATE RECORD SCHEMA

All research output is a single JSON array — [`grants.json`](grants.json) — one object per
funder, conforming to this schema. Nothing is discarded: an `Excluded` candidate stays in the
array with its `exclusion_reason`, same as a Tier 1 candidate.

### Identity & Eligibility

- `org_name`
  Example: `"Mozilla Open Source Support (MOSS)"`

- `website`
  Example: `"https://www.mozilla.org/en-US/moss/"`

- `funder_type`
  Allowed values (enum, single):
    - `"Private foundation"`
    - `"Public foundation / community foundation"`
    - `"Donor-advised fund"`
    - `"Corporate giving program"`
    - `"Government entity"`
    - `"Fiscal-sponsor-run fund"` — e.g. a fund administered by a fiscal sponsor as part of its
      own grantmaking (distinct from that sponsor's fiscal-sponsorship service)
    - `"Other"`
    - `"Unclear"`

- `funder_type_other_description`
  Required if `funder_type` is `"Other"`; omit or leave empty otherwise.

- `geographic_scope`
  Same enum as [`../fiscal-sponsorship/prompt.md`](../fiscal-sponsorship/prompt.md)'s
  `geographic_scope`: `"National (US)"`, `"State"` (+ `geographic_scope_state`),
  `"Regional (multi-state)"`, `"Local/metro"`, `"International"`, `"Other"`
  (+ `geographic_scope_other_description`), `"Unclear"`.

- `accepts_fiscally_sponsored_applicants`
  Whether an applicant without its own legal entity, operating under a fiscal sponsor, can
  apply and receive funds through that sponsor.
  Allowed values: `true`, `false`, `"Unclear"`, `"Requires confirmation"`
  Example: `true`

- `accepts_unincorporated_direct_applicants`
  Whether an applicant with no legal entity *and* no fiscal sponsor can apply directly (rare,
  but some funders explicitly support this).
  Allowed values: `true`, `false`, `"Unclear"`, `"Requires confirmation"`

- `stated_mission`
  The funder's mission, close to verbatim from their own materials.

- `funding_priorities`
  Program areas / what they fund.
  Example: `["open source infrastructure", "digital rights", "internet freedom"]`

- `funding_type`
  Descriptive only — not a screening factor under the current priority (see "Relationship to
  fiscal-sponsorship search" above).
  Allowed values (enum, one or more): `"General operating support"`,
  `"Restricted / project-specific"`, `"Capacity building"`, `"Emergency/rapid-response"`,
  `"Other"`, `"Unclear"`

- `grant_size_range`
  Example: `"$10,000–$250,000"`

- `typical_grant_period`
  Example: `"1 year, renewable"`

- `application_cycle`
  Free text describing the recurring pattern, if any.
  Example: `"Annual, opens January, closes March"`, `"Rolling"`, `"Unclear"`

- `application_deadline`
  The next known concrete deadline.
  Format: `YYYY-MM-DD`, or `"Rolling"`, or `"Unclear"`
  Example: `"2026-09-15"`

- `application_process`
  Short description of how to apply.

- `eligibility_requirements`
  Any stated requirements beyond funder_type/geography.

- `political_activity_restrictions`
  Stated limits on lobbying, campaign activity, advocacy.

### Screening Result

Same shape as [`../fiscal-sponsorship/prompt.md`](../fiscal-sponsorship/prompt.md): `tier`
(`"Tier 1"`/`"Tier 2"`/`"Tier 3"`/`"Excluded"`), `exclusion_reason` (required if Excluded),
`mission_fit_score`, `structural_fit_score` (each `"Strong"`/`"Moderate"`/`"Weak"`/`"Unclear"`).

### Mission Alignment

Same shape: `mission_alignment.sponsor_mission_summary` (funder's mission, in your own words),
`mission_alignment.doikayt_overlap`, `mission_alignment.potential_concerns`,
`mission_alignment.best_fit_framing`. Where Doikayt's active funding priority (GASify/
build-tools/geoCRM) is the natural pitch for a funder, `best_fit_framing` should lead with that
rather than a generic mission statement.

### Outreach

Only fill in for serious candidates (Tier 1, and Tier 2 as warranted). Same shape as
fiscal-sponsorship: `outreach.contact_person`, `outreach.recommended_approach`,
`outreach.questions_to_ask`, `outreach.info_funder_likely_requires`,
`outreach.issues_to_clarify_before_applying`. Draw on `mission_alignment.best_fit_framing`
rather than re-deriving it. Do not draft outreach messages until the underlying research is
sufficiently reliable.

### Status / Living Record

Same shape as fiscal-sponsorship: `status.date_last_verified`, `status.source_urls`,
`status.current_assessment`, `status.next_action`, `status.application_status`
(`"Not started"`, `"Inquiry sent"`, `"Applied"`, `"Accepted"`, `"Rejected"`, `"N/A"`),
`change_log` (array of `{ date, change }`, appended, never edited in place).

## Screening criteria (structural compatibility)

Evaluate each candidate against Doikayt's actual situation. Pay particular attention to:

- Whether the funder requires an independent 501(c)(3), or accepts fiscally sponsored
  applicants (`accepts_fiscally_sponsored_applicants`) — this is usually the deciding
  structural question for Doikayt right now
- Whether the funder can accommodate a project that may ultimately operate as a 501(c)(4)
- Political campaign activity / political advocacy / lobbying
- Providing technical services to political campaigns
- Earned revenue and charging for services
- Whether project-restricted funding is offered (acceptable — see funding-priority note) and
  whether it could fund the GASify/build-tools/geoCRM stack specifically
- Geographic eligibility
- Application-cycle timing (see "Deadline triage" below)

### Critical screening principle

Do not treat a funder as compatible merely because its mission is highly aligned — as with
fiscal sponsors, distinguish mission fit (`mission_fit_score`) from structural/eligibility fit
(`structural_fit_score`). A funder can have excellent mission alignment but be structurally
unusable right now (e.g. doesn't accept fiscally sponsored applicants and Doikayt has no
sponsor yet) — these are two separate fields for exactly this reason.

## Deadline triage

Unlike fiscal sponsorship (mostly rolling), grant funders operate on cycles, and timing can
override tier when deciding what to work on right now:

- **More than 7 days to `application_deadline`:** normal priority — work candidates in tier
  order as usual.
- **7 days or fewer to `application_deadline`:** treat as immediate action regardless of tier —
  a Tier 2 candidate with a deadline this week outranks a Tier 1 candidate with a deadline next
  quarter. Reflect this in `status.next_action`.
- **1 day or fewer to `application_deadline`, or the deadline has passed:** treat as very
  likely missed. Don't burn effort on a rushed submission. Set `status.next_action` to watch
  for the next cycle (per `application_cycle`) and note what happened in `change_log` — don't
  silently drop the candidate.

See [`docs/querying-grants.md`](docs/querying-grants.md) for a `jq` query that surfaces
upcoming deadlines across the whole database.

## Mission alignment approach

Same approach as fiscal-sponsorship research: for each serious candidate, determine not merely
whether Doikayt technically qualifies, but how Doikayt's mission and current work relate to the
funder's mission — funder mission, Doikayt overlap, potential concerns, best-fit framing. Do
not recommend deceptive or materially misleading positioning.

## Tier definitions

- **Tier 1 — Pursue Now** — strong mission and structural fit.
- **Tier 2 — Investigate** — potentially strong but important questions remain (often:
  fiscal-sponsor-acceptance unconfirmed).
- **Tier 3 — Possible Later** — interesting but Doikayt is currently too early, lacks a
  required fiscal sponsor, or the opportunity is better suited to a later stage.
- **Excluded** — clearly incompatible; `exclusion_reason` must be set.

Common `exclusion_reason` values:

- Requires independent 501(c)(3), doesn't accept fiscally sponsored applicants
- Campaign-related activities incompatible
- Geographic restriction
- Mission incompatibility
- Project-stage restriction (e.g. requires existing revenue/users at a scale Doikayt hasn't
  reached)
- Technology/funding-area outside scope

The exclusion list is important. Do not repeatedly rediscover the same dead ends — check
[`grants.json`](grants.json) for an existing entry before re-researching a funder.

## RESEARCH DISCIPLINE

Do not equate "funder" with "compatible funder," or "mission-aligned" with "structurally
usable right now." The central question is:

> Can this funder legally and practically give money to the organization Doikayt actually is
> (unincorporated, likely fiscally sponsored), for the work Doikayt is actually doing?

When legal/tax questions arise, distinguish factual research from legal conclusions. Flag
issues that should ultimately be reviewed by qualified counsel rather than presenting uncertain
legal interpretations as facts — record these in `status.current_assessment` or
`outreach.issues_to_clarify_before_applying` with an explicit "requires counsel review" note.

Prefer primary sources and current funder documentation over third-party descriptions. Never
guess — use `"Unclear"` / `"Requires confirmation"` when uncertain.
