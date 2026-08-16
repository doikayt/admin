# Doikayt Fiscal Sponsor Research — Schema & Criteria

The original bootstrap plan (candidate discovery through initial outreach) is complete — see
[`README.md`](README.md) for status and [`CLAUDE.md`](CLAUDE.md) for how ongoing work
(adding candidates, logging progress) is done now. This file retains only what's still load-
bearing day to day: the `sponsors.json` schema and the screening/mission-alignment/tier
criteria every candidate is still judged against.

# Purpose

Doikayt maintains a research system to identify, evaluate, and prioritize fiscal sponsors
(and track applications to same) that could potentially host Doikayt while it is still an
early-stage, unincorporated organization.

The goal is not to find a single sponsor. The goal is to systematically establish the
universe of plausible sponsors, determine which are actually compatible with Doikayt,
understand how Doikayt's mission aligns with each, and maintain a prioritized shortlist for
outreach.

This research also helps Doikayt understand how to describe and position itself when
approaching fiscal sponsors and, eventually, other funding sources.

Do not assume that Doikayt's eventual legal structure has already been decided.

## Constraint: NO RUSH TO INCORPORATE

Doikayt has not yet determined the optimal permanent legal structure. In particular, we are
considering the implications of a 501(c)(4), earned revenue, political-campaign customers,
and potentially a future nonprofit/for-profit structure — similar to what OpenAI did, but
much more ethically.

For this reason, research focuses specifically on fiscal sponsorship as the preferred
mechanism for operating and raising funds while Doikayt remains unincorporated.

Do not assume Doikayt should incorporate now. Do not make incorporation the default
recommendation simply because a particular fiscal sponsor requires it.

If the research establishes that fiscal sponsorship is not viable for Doikayt's intended
activities, document that finding and explain why rather than forcing the project into an
unsuitable sponsorship model.

The Doikayt organizational profile lives in
[`doikayt.profile.txt`](doikayt.profile.txt).

## CANDIDATE RECORD SCHEMA

All research output is a single JSON array — [`sponsors.json`](sponsors.json) — one object
per candidate organization, conforming to this schema. Nothing is discarded: an `Excluded`
candidate stays in the array with its `exclusion_reason`, same as a Tier 1 candidate.

### Identity & Eligibility

- `org_name`
  Legal or commonly-used name of the organization.
  Example: `"Tides Center"`

- `website`
  Primary URL for the organization.
  Example: `"https://www.tides.org"`

- `legal_tax_structure`
  Allowed values (enum, single):
    - `"501(c)(3) public charity"`
    - `"501(c)(3) private foundation"`
    - `"501(c)(4)"`
    - `"501(c)(6)"`
    - `"Fiscal intermediary (non-501c3 nonprofit)"`
    - `"Government entity"`
    - `"Other"`
    - `"Unclear"`
  Example: `"501(c)(3) public charity"`

- `legal_tax_structure_other_description`
  Required if `legal_tax_structure` is `"Other"`; omit or leave empty otherwise.
  Example: `"Fiscally sponsored itself under a larger umbrella, no independent tax status"`

- `fiscal_sponsorship_models`
  Model(s) offered, using the standard NNFS taxonomy. Array because some sponsors offer
  more than one model.
  Allowed values (enum, one or more):
    - `"Model A"` — Direct Project: project becomes a program of the sponsor; sponsor owns
      all activities, staff, IP, contracts.
    - `"Model B"` — Independent Contractor: project operates independently but delivers
      services to the sponsor as a contractor.
    - `"Model C"` — Pre-Approved Grant Relationship: project retains its own separate
      existence; sponsor makes grants to it after approving the grant purpose.
    - `"Model D"` — Group Exemption: sponsor extends its group tax exemption to the
      project, which operates as a subordinate organization.
    - `"Model E"` — Supporting Organization: project becomes a legally distinct nonprofit
      whose purpose is to support the sponsor.
    - `"Model F"` — Technical Assistance / Free-Standing Fund: sponsor provides
      admin/back-office support to a project that otherwise retains more independence
      than Model A.
    - `"Other"` — sponsor uses a nonstandard or hybrid model.
    - `"Unclear"` — not stated or ambiguous in source material.
  Example: `["Model A", "Model C"]`

- `fiscal_sponsorship_models_other_description`
  Required if `fiscal_sponsorship_models` includes `"Other"`; omit or leave empty otherwise.
  Example: `"Custom hybrid: Model A for staffing, Model C for grants pass-through"`

- `geographic_scope`
  Allowed values (enum, single):
    - `"National (US)"`
    - `"State"` — use in combination with `geographic_scope_state` below
    - `"Regional (multi-state)"`
    - `"Local/metro"`
    - `"International"`
    - `"Other"`
    - `"Unclear"`
  Example: `"State"`

- `geographic_scope_state`
  Required if `geographic_scope` is `"State"`; omit or leave empty otherwise.
  Example: `"California"`

- `geographic_scope_other_description`
  Required if `geographic_scope` is `"Other"`; omit or leave empty otherwise.
  Example: `"Limited to a named list of partner cities, not a contiguous region"`

- `accepts_unincorporated_projects`
  Whether a project without its own legal entity can apply.
  Allowed values: `true`, `false`, `"Unclear"`, `"Requires confirmation"`
  Example: `true`

- `stated_mission`
  The sponsor's mission, close to verbatim from their own materials.
  Example: `"Partnering with change agents to build a world of shared prosperity..."`

- `project_types_sponsored`
  Categories of projects they take on.
  Example: `["social justice", "arts", "environmental"]`

- `fees`
  Fee structure as stated by the sponsor.
  Example: `"8% of revenue, no minimum"`

- `application_process`
  Short description of how to apply.
  Example: `"Online inquiry form, followed by staff interview"`

- `eligibility_requirements`
  Any stated requirements beyond project type.
  Example: `["Must have annual budget under $2M to qualify for entry tier"]`

- `political_activity_restrictions`
  Stated limits on lobbying, campaign activity, advocacy.
  Example: `"No campaign intervention; limited lobbying under 501(h)"`

### Screening Result

- `tier`
  Allowed values: `"Tier 1"`, `"Tier 2"`, `"Tier 3"`, `"Excluded"`
  Example: `"Excluded"`

- `exclusion_reason`
  Required if `tier` is `"Excluded"`; omit or leave empty otherwise.
  Example: `"Requires 501(c)(3); incompatible with campaign-related customer activity"`

- `mission_fit_score`
  Allowed values: `"Strong"`, `"Moderate"`, `"Weak"`, `"Unclear"`
  Example: `"Strong"`

- `structural_fit_score`
  Allowed values: `"Strong"`, `"Moderate"`, `"Weak"`, `"Unclear"`
  Example: `"Weak"`

### Mission Alignment

- `mission_alignment.sponsor_mission_summary`
  One or two sentences: what the sponsor exists to accomplish, in your own words.
  Example: `"Funds and incubates social-change projects, emphasis on economic justice."`

- `mission_alignment.doikayt_overlap`
  What in Doikayt's actual work furthers that mission.
  Example: `"Labor-movement tooling directly furthers their economic-justice focus."`

- `mission_alignment.potential_concerns`
  What might make the sponsor hesitate.
  Example: `"Paid political-campaign customers may read as partisan activity."`

- `mission_alignment.best_fit_framing`
  Truthful framing that leads with the strongest overlap for this sponsor specifically.
  Example: `"Position as movement-technology infrastructure, not as a campaign vendor."`

### Outreach

Only fill in for serious candidates (Tier 1, and Tier 2 as warranted).

- `outreach.contact_person`
  Example: `"Jane Doe, Program Officer"`

- `outreach.recommended_approach`
  Example: `"Warm intro via [contact] before cold application"`

- `outreach.questions_to_ask`
  Example: `["Can projects retain IP?", "Is c4 conversion later supported?"]`

- `outreach.info_sponsor_likely_requires`
  Example: `["Board bios", "12-month budget projection"]`

- `outreach.issues_to_clarify_before_applying`
  Example: `["Whether campaign customer revenue counts as earned income restriction"]`

Draw on `mission_alignment.best_fit_framing` as Doikayt's strongest relevant narrative for
that sponsor — don't re-derive it. Do not draft outreach messages until the underlying
sponsor research is sufficiently reliable.

### Status / Living Record

- `status.date_last_verified`
  Format: `YYYY-MM-DD`
  Example: `"2026-08-11"`

- `status.source_urls`
  Example: `["https://www.tides.org/fiscal-sponsorship/"]`

- `status.current_assessment`
  Free-text, current state of thinking.
  Example: `"Excluded for now; revisit if Doikayt spins off a pure-c3 arm."`

- `status.next_action`
  Example: `"None — parked as reference"`

- `status.application_status`
  Allowed values: `"Not started"`, `"Inquiry sent"`, `"Applied"`, `"Accepted"`, `"Rejected"`,
  `"N/A"`
  Example: `"Not started"`

- `change_log`
  Array of `{ date, change }` objects, appended over time, never edited in place.
  Example: `[{ "date": "2026-08-11", "change": "Initial entry created" }]`

## Screening criteria (structural compatibility)

Evaluate each candidate against Doikayt's actual intended activities. Pay particular
attention to:

- Whether the sponsor requires the project to operate as a 501(c)(3)
- Whether the sponsor can accommodate a project that may ultimately operate as a 501(c)(4)
- Political campaign activity
- Political advocacy
- Lobbying
- Providing technical services to political campaigns
- Earned revenue and charging for services
- Hiring employees
- Paying contractors
- Receiving grants
- Receiving contributions
- Ownership and control of intellectual property
- Ability to operate under the Doikayt name
- Ability to maintain an independent identity
- Ability to establish an independent nonprofit later
- Exit provisions

### Critical screening principle

Do not treat a 501(c)(3) fiscal sponsor as compatible merely because its mission is highly
aligned.

If sponsorship requires Doikayt to operate within 501(c)(3) restrictions that would prevent
Doikayt from carrying out its intended campaign-related customer activities, classify the
sponsor as structurally incompatible: set `tier` to `"Excluded"` and populate
`exclusion_reason`.

Do not spend substantial research effort looking for ways to circumvent this constraint.
However, retain such candidates in the database (do not delete the entry) — they may be
useful for understanding the funding landscape.

Distinguish mission fit (`mission_fit_score`) from legal/structural/activity fit
(`structural_fit_score`). A sponsor can have excellent mission alignment but still be
unusable for Doikayt — these are two separate fields for exactly this reason; do not
collapse them into `tier` prematurely.

## Mission alignment approach

For each serious candidate, determine not merely whether Doikayt technically qualifies, but
how Doikayt's mission relates to the sponsor's mission:

- **Sponsor mission** — what does the sponsor say it exists to accomplish?
- **Doikayt overlap** — what aspects of Doikayt naturally further that mission?
- **Potential concerns** — what aspects of Doikayt might cause the sponsor to hesitate?
- **Best-fit framing** — how could Doikayt accurately describe itself in a way that makes
  the mission connection clear?

Do not recommend deceptive or materially misleading positioning. The objective is the most
truthful and strategically effective description of Doikayt's work for that particular
sponsor.

### Important distinction

Do not reduce Doikayt to "a political organization" merely because political campaigns may
be customers. Likewise, do not reduce Doikayt to "a software organization" if doing so
obscures its grassroots/social-impact purpose. Preserve the actual combination:

> mission-driven technology + grassroots organizational capacity + selected
> political/campaign customers.

## Tier definitions

- **Tier 1 — Pursue Now** — strong mission and structural fit.
- **Tier 2 — Investigate** — potentially strong but important questions remain.
- **Tier 3 — Possible Later** — interesting but Doikayt is currently too early, lacks some
  requirement, or the opportunity is better suited to a later stage.
- **Excluded** — clearly incompatible; `exclusion_reason` must be set.

Common `exclusion_reason` values:

- Requires 501(c)(3)
- Campaign-related activities incompatible
- Geographic restriction
- Earned-revenue restriction
- Mission incompatibility
- Project-stage restriction
- Doesn't sponsor unincorporated projects
- Technology/project type outside scope

The exclusion list is important. Do not repeatedly rediscover the same dead ends — check
[`sponsors.json`](sponsors.json) for an existing entry before re-researching an
organization.

## Deferred: recurring narrative themes (not yet run)

A cross-record synthesis over `mission_alignment.doikayt_overlap` /
`mission_alignment.best_fit_framing`, once enough candidates have mission alignment
populated. Candidate themes to test against the data (not assumed correct — derive from
the actual records):

- democratization of technology
- grassroots organizational capacity
- working-class organizing
- technology access
- Big tech independence
- open-source advocacy
- free speech, tolerance
- AI access for under-resourced organizations
- anti data center orientation / Green AI (efficient local models, etc.)
- political/campaign infrastructure

Output should be a separate summary document, not new `sponsors.json` fields — it
synthesizes across records rather than modifying them. Findings should eventually inform
website positioning, sponsor outreach, grant applications, and funding strategy.

## RESEARCH DISCIPLINE

Do not equate:

- "nonprofit organization" with "fiscal sponsor"
- "funding organization" with "fiscal sponsor"
- "mission-aligned organization" with "potential sponsor"
- "501(c)(3)" with "compatible sponsor"

The central question is:

> Can this organization legally and practically serve as a fiscal sponsor for the
> organization Doikayt actually intends to be?

When legal/tax questions arise, distinguish factual research from legal conclusions. Flag
issues that should ultimately be reviewed by qualified counsel rather than presenting
uncertain legal interpretations as facts — record these in `status.current_assessment` or
`outreach.issues_to_clarify_before_applying` with an explicit "requires counsel review"
note.

Prefer primary sources and current sponsor documentation over third-party descriptions.
