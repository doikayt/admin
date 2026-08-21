# Doikayt Grant Search

Living research project to identify and pursue grant funders for Doikayt Mobilization Labs.
Peer track to [`../fiscal-sponsorship/`](../fiscal-sponsorship/) — see
[`../doikayt.profile.txt`](../doikayt.profile.txt) for the org profile and current funding
priority that drives screening here, and [`prompt.md`](prompt.md) for the `grants.json` schema.

## Status (as of 2026-08-20)

The full starting cluster named in earlier internal discussion (MOSS, NLnet, Sovereign Tech
Fund, Media Democracy Fund, NetGain) has been researched. **No Tier 1 candidate identified
yet.** Summary:

- **NLnet Foundation** — Tier 2. Best structural fit found so far, and now **primary-source
  confirmed**: NLnet's own Eligibility page states "no categorical exclusions of persons or
  entities" and "no geographical restrictions" — no legal entity or fiscal sponsor required at
  all. First-proposal grant cap is EUR 50,000. **Hard deadline confirmed: calls reopen
  2026-09-03, deadline 2026-11-03 12:00 CEST.** Mission fit is still the open question — NLnet's
  scope leans toward core internet/protocol infrastructure and general FOSS engineering, and
  GASify/geoCRM's dependency on the proprietary Google Apps Script platform is real tension
  against that; `build-tools`/`typescript-build-config` likely pitches better. One nuance: the
  confirmed eligibility text was read on the NGI Zero-era fund page, which NLnet is
  transitioning away from — needs re-confirming against whichever fund(s) actually reopen.
- **Mozilla Technology Fund (MTF)** — Tier 3. Successor to MOSS (defunct since 2020). No open
  call found; recent cycle themes have been AI-centric, not a domain match.
- **Sovereign Tech Fund** — Tier 3 (corrected from an earlier overstated Excluded verdict).
  Their "not looking for user-facing applications" language excludes geoCRM specifically, but
  not GASify — the framework layer is developer tooling, closer to their actual target category
  ("administration tools for developers"). The real blocker for GASify is their "Prevalence"
  criterion (must already be widely relied upon externally), which it doesn't meet yet, plus the
  EUR 50,000 minimum project cost. Too early, not categorically wrong — revisit once GASify has
  real external adoption.
- **Media Democracy Fund** — Tier 3. Good thematic mission overlap, but does not accept
  unsolicited applications — no path in without a warm referral.
- **NetGain Partnership** — Tier 3. A foundation collaborative, not an independently operating
  grantmaker; last confirmed open call was 2020; historical grant recipients skew toward
  research/policy orgs at a larger scale ($250k+ average) than fits Doikayt now.

See `grants.json` for full detail on each. Given MOSS's fate, always verify a funder is still
actually active before investing further research time. Note: the WebFetch tool was blocked
(403/incomplete) on several of these domains; a direct `curl` with a browser user-agent from
this sandbox got through where WebFetch didn't — worth trying before assuming a site is
unreachable.

## Current Tier 1 candidates (contact these first)

None yet. Run `jq -r '.[] | select(.tier == "Tier 1") | .org_name' grants.json` once
candidates exist.

## Querying grants.json

See [`docs/querying-grants.md`](docs/querying-grants.md) for `jq` query examples and shell
aliases, including the deadline-triage query (see `prompt.md`'s "Deadline triage" section).

## Resuming this research in a new session

1. Clone/pull this repo.
2. Hand Claude `grants.json`, [`../doikayt.profile.txt`](../doikayt.profile.txt), and this
   README.
3. Tell it what happened since the last commit (outreach results, new information, strategy
   changes) — it should update `grants.json` in place: bump `status.date_last_verified`,
   `status.current_assessment`, `status.next_action`, `status.application_status`, and always
   append (never edit in place) to `change_log`.
4. Commit after each meaningful update so the history stays a real audit trail of how the
   research evolved.
