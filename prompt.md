# Doikayt Fiscal Sponsor Research

Plan below is broken up into a number of subgoals in services of this top level goal:

There are specific CHECKPOINT's where the model should stop outputting and allow for human review.
Obey those.

To create:

    A database of potential funding sources for Doikayt Mobilization Labs: 
    (the file 'sponsors.json'.)   The schema is given in the next section.

    One narrative doc as output of Subgoal 5, below

Each subgoal either fills in a 
slice of the record schema, or in some cases consume data from specific columns in 
order to derive data values for yet other different/new columns.


## CANDIDATE RECORD SCHEMA

All research output is a single JSON array — `sponsors.json` — one object per candidate organization, conforming to this schema. Every subgoal below either creates entries in this array or fills in specific fields on existing entries. Nothing is discarded: an Excluded candidate stays in the array with its exclusion reason, same as a Tier 1 candidate.

The schema's subsection headers double as a table of contents for the subgoals — each one names the subgoal that's responsible for populating those specific fields:

Identity & Eligibility (Subgoal 2) — fields like org_name, legal_tax_structure, fiscal_sponsorship_models, geographic_scope. Subgoal 2's text explicitly says "populate the Identity & Eligibility fields defined in the schema above."
Screening Result (Subgoal 3) — tier, exclusion_reason, structural_fit_score. Subgoal 3 says to populate these, and explicitly withholds mission_fit_score for later.
Mission Alignment (Subgoal 4) — the mission_alignment.* object and mission_fit_score. Subgoal 4 walks through the same four sub-fields in the same order (sponsor_mission_summary, doikayt_overlap, potential_concerns, best_fit_framing).
Outreach (Subgoal 7) — the outreach.* object. Subgoal 7 lists the same five sub-fields.
Status / Living Record (Subgoal 8) — status.* and change_log. Subgoal 8 lists the same fields.

So the relationship is one-directional and load-bearing: the schema is the field inventory, and each subgoal is the procedure that writes to one slice of it. A few things worth noting about how tightly they're wired together:

Subgoals 5 and 6 don't own new fields. Subgoal 5 (recurring narratives) reads across mission_alignment.doikayt_overlap / best_fit_framing on all records but produces a separate summary doc, not schema changes. Subgoal 6 (prioritization) also introduces no new fields — it just finalizes tier using the two scores that Subgoals 3 and 4 already set. The doc calls this out explicitly in both places ("not a new set of per-record fields" / "already exist as separate fields in the schema") so it's clear those subgoals are consumers, not producers, of the schema.

Sequencing dependencies are enforced through field-population order, not just prose. Subgoal 3 explicitly defers mission_fit_score to Subgoal 4. Subgoal 7 explicitly says to reuse best_fit_framing from Subgoal 4 rather than re-deriving it. Subgoal 6 explicitly points back to the two scores set in 3 and 4. This is what keeps someone from re-doing work already captured in the record.

The enum "Other"/companion-description fields are introduced once in the schema and then referenced generically in Subgoal 2 ("their companion _other_description / _state fields where applicable") rather than re-enumerated — so the schema is the single source of truth for the enum values themselves, and subgoal text just points back at it.
The exclusion-reason examples are duplicated in one place, deliberately: the schema defines the field as free text, and Subgoal 6 lists example values for it. That's the one spot where a subgoal adds content the schema doesn't already contain, because it's example data (documentation for humans) rather than a structural definition.

Output File: `sponsors.json` — a single JSON array, one object per candidate organization.

### Identity & Eligibility (Subgoal 2 — discovery)

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
  Model(s) offered, using the standard NNFS taxonomy. Array because some sponsors offer more than one model.
  Allowed values (enum, one or more):
    - `"Model A"` — Direct Project: project becomes a program of the sponsor; sponsor owns all activities, staff, IP, contracts.
    - `"Model B"` — Independent Contractor: project operates independently but delivers services to the sponsor as a contractor.
    - `"Model C"` — Pre-Approved Grant Relationship: project retains its own separate existence; sponsor makes grants to it after approving the grant purpose.
    - `"Model D"` — Group Exemption: sponsor extends its group tax exemption to the project, which operates as a subordinate organization.
    - `"Model E"` — Supporting Organization: project becomes a legally distinct nonprofit whose purpose is to support the sponsor.
    - `"Model F"` — Technical Assistance / Free-Standing Fund: sponsor provides admin/back-office support to a project that otherwise retains more independence than Model A.
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

### Screening Result (Subgoal 3)

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

### Mission Alignment (Subgoal 4)

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

### Outreach (Subgoal 7 — fill in only for serious candidates)

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

### Status / Living Record (Subgoal 8)

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
  Allowed values: `"Not started"`, `"Inquiry sent"`, `"Applied"`, `"Accepted"`, `"Rejected"`, `"N/A"`
  Example: `"Not started"`

- `change_log`
  Array of `{ date, change }` objects, appended over time, never edited in place.
  Example: `[{ "date": "2026-08-11", "change": "Initial entry created" }]`

## SUBGOAL 2 — Establish the Fiscal Sponsor Candidate Universe

Once the initial Doikayt profile is established, identify the broadest practical universe of organizations that could conceivably serve as fiscal sponsors.

Use authoritative directories and primary sources wherever possible, including:

- National Network of Fiscal Sponsors
- Fiscal Sponsor Directory
- individual fiscal sponsor websites
- specialized fiscal-sponsorship directories
- organizations specializing in grassroots, movement, labor, technology, open-source, social-justice, or political-adjacent projects

Do not limit the search prematurely to organizations that appear to be an obvious fit.

The first objective is candidate discovery, not ranking.

For every candidate, create a new entry in `sponsors.json` and populate the **Identity & Eligibility** fields defined in the schema above (`org_name` through `political_activity_restrictions`, including the enum fields — `legal_tax_structure`, `fiscal_sponsorship_models`, `geographic_scope` — and their companion `_other_description` / `_state` fields where applicable). Also set `status.source_urls` and `status.date_last_verified` for every entry as it's created — these are populated at discovery time, not deferred to Subgoal 8.

## SUBGOAL 3 — Screen for Structural Compatibility

CHECKPOINT: After completing Subgoal 2, stop and wait for my review before continuing

Evaluate each candidate against Doikayt's actual intended activities.

Pay particular attention to:

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

Populate `tier`, `structural_fit_score`, and — if incompatible — `exclusion_reason` for each candidate. Do not set `mission_fit_score` yet; that's Subgoal 4.

### Critical screening principle

Do not treat a 501(c)(3) fiscal sponsor as compatible merely because its mission is highly aligned.

If sponsorship requires Doikayt to operate within 501(c)(3) restrictions that would prevent Doikayt from carrying out its intended campaign-related customer activities, classify the sponsor as structurally incompatible: set `tier` to `"Excluded"` and populate `exclusion_reason`.

Do not spend substantial research effort looking for ways to circumvent this constraint.

However, retain such candidates in the database (do not delete the entry) with `exclusion_reason` clearly stated. They may be useful for understanding the funding landscape.

Distinguish:

- Mission fit (`mission_fit_score`)

from

- Legal/structural/activity fit (`structural_fit_score`)

A sponsor can have excellent mission alignment but still be unusable for Doikayt — these are two separate fields for exactly this reason; do not collapse them into `tier` prematurely.

## SUBGOAL 4 — Analyze Mission Alignment

For each serious candidate (i.e. not yet excluded, or excluded but worth understanding for the landscape), determine not merely whether Doikayt technically qualifies, but how Doikayt's mission relates to the sponsor's mission.

Populate the `mission_alignment` object and `mission_fit_score` for each candidate:

**`mission_alignment.sponsor_mission_summary`**
What does the sponsor say it exists to accomplish?

**`mission_alignment.doikayt_overlap`**
What aspects of Doikayt naturally further that mission?

**`mission_alignment.potential_concerns`**
What aspects of Doikayt might cause the sponsor to hesitate?

**`mission_alignment.best_fit_framing`**
How could Doikayt accurately describe itself in a way that makes the mission connection clear?

Do not recommend deceptive or materially misleading positioning.

The objective is to identify the most truthful and strategically effective description of Doikayt's work for that particular sponsor.

### Important distinction

Do not reduce Doikayt to "a political organization" merely because political campaigns may be customers.

Likewise, do not reduce Doikayt to "a software organization" if doing so obscures its grassroots/social-impact purpose.

Preserve the actual combination:

> mission-driven technology + grassroots organizational capacity + selected political/campaign customers.

## SUBGOAL 5 — Identify Recurring Mission/Funding Narratives

After evaluating a substantial number of plausible sponsors, analyze the results across sponsors — this is a cross-record analysis over the `mission_alignment` fields already populated in `sponsors.json`, not a new set of per-record fields.

Identify recurring themes that appear to make Doikayt particularly relevant to potential sponsors, such as—but not limited to:

- democratization of technology
- grassroots organizational capacity
- working-class organizing
- technology access
- Big tech independence
- open-source advocacy 
- free speech, tolerance
- AI access for under-resourced organizations
- anti data center orientation | Green AI (more efficient local models,etc)
- political/campaign infrastructure

Do not assume these are the correct narratives. Determine them from the research — specifically, from patterns across `mission_alignment.doikayt_overlap` and `mission_alignment.best_fit_framing` across the array.

The objective is to learn:

> Which truthful aspects of Doikayt's mission have the strongest resonance across the fiscal-sponsorship landscape?

These findings should eventually inform:

- website positioning
- sponsor outreach
- grant applications
- funding strategy

This subgoal's output is a separate summary document, not new schema fields — it synthesizes across `sponsors.json` rather than modifying it.

## SUBGOAL 6 — Prioritize Sponsors

CHECKPOINT: After completing Subgoal 5, stop and wait for my review before continuing

Only after discovery and screening, produce a prioritized shortlist.

Use at least two distinct dimensions — these already exist as separate fields in the schema:

**Mission Fit** (`mission_fit_score`)
How naturally does Doikayt's mission fit the sponsor?

**Structural/Operational Fit** (`structural_fit_score`)
Can the sponsor actually host Doikayt's intended activities?

Do not collapse these prematurely into a single score.

Finalize `tier` for every candidate, approximately as:

- **Tier 1 — Pursue Now**
  Strong mission and structural fit.
- **Tier 2 — Investigate**
  Potentially strong but important questions remain.
- **Tier 3 — Possible Later**
  Interesting but Doikayt is currently too early, lacks some requirement, or the opportunity is better suited to a later stage.
- **Excluded**
  Clearly incompatible — `exclusion_reason` must be set.

Examples of `exclusion_reason` values:

- Requires 501(c)(3)
- Campaign-related activities incompatible
- Geographic restriction
- Earned-revenue restriction
- Mission incompatibility
- Project-stage restriction
- Doesn't sponsor unincorporated projects
- Technology/project type outside scope

The exclusion list is important. Do not repeatedly rediscover the same dead ends — check `sponsors.json` for an existing entry before re-researching an organization.

## SUBGOAL 7 — Develop Sponsor-Specific Outreach Strategy

For the strongest candidates (Tier 1, and Tier 2 as warranted), populate the `outreach` object:

- `outreach.contact_person`
- `outreach.recommended_approach`
- `outreach.questions_to_ask`
- `outreach.info_sponsor_likely_requires`
- `outreach.issues_to_clarify_before_applying`

Also draw on `mission_alignment.best_fit_framing` (already populated in Subgoal 4) as Doikayt's strongest relevant narrative for that sponsor — don't re-derive it.

Do not draft outreach messages until the underlying sponsor research is sufficiently reliable.

## SUBGOAL 8 — Maintain the Research as a Living System

Treat this as ongoing research rather than a one-time report.

For every important sponsor record, maintain the `status` object and `change_log`:

- `status.date_last_verified`
- `status.source_urls`
- `status.current_assessment`
- `status.next_action`
- `status.application_status`
- `change_log` — append an entry (never edit in place) whenever eligibility, fees, or political/activity restrictions change

When information is uncertain, use the schema's built-in `"Unclear"` / `"Requires confirmation"` enum values rather than guessing or leaving a field blank.

Prefer primary sources and current sponsor documentation over third-party descriptions.

## RESEARCH DISCIPLINE

Do not equate:

- "nonprofit organization" with "fiscal sponsor"
- "funding organization" with "fiscal sponsor"
- "mission-aligned organization" with "potential sponsor"
- "501(c)(3)" with "compatible sponsor"

The central question is:

> Can this organization legally and practically serve as a fiscal sponsor for the organization Doikayt actually intends to be?

When legal/tax questions arise, distinguish factual research from legal conclusions. Flag issues that should ultimately be reviewed by qualified counsel rather than presenting uncertain legal interpretations as facts — record these in `status.current_assessment` or `outreach.issues_to_clarify_before_applying` with an explicit "requires counsel review" note.

## INITIAL WORKFLOW

Work incrementally.

**First:**

1. Review the Doikayt Fiscal Sponsorship Profile: HERE: @doikayt.profile.txt 
2. Identify ambiguities, contradictions, or missing information that materially affect sponsor research.
3. Confirm the schema above is sufficient for the candidate-data — flag any additional fields needed before discovery begins.

**Then:**

1. Build the broad candidate universe (Subgoal 2 → populate `sponsors.json`).
2. Screen candidates (Subgoal 3).
3. Analyze mission alignment (Subgoal 4).
4. Identify recurring narratives (Subgoal 5).
5. Prioritize the strongest candidates (Subgoal 6).
6. Develop outreach strategy for top candidates (Subgoal 7).
7. Maintain as a living system going forward (Subgoal 8).

Do not jump immediately to a short list of ten organizations.

The objective is to build a defensible research process and reusable knowledge base — `sponsors.json` — not merely produce a list.

At each stage, preserve the underlying research and reasoning so that subsequent stages can build upon it.

