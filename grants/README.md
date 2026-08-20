# Doikayt Grant Search

Living research project to identify and pursue grant funders for Doikayt Mobilization Labs.
Peer track to [`../fiscal-sponsorship/`](../fiscal-sponsorship/) — see
[`../doikayt.profile.txt`](../doikayt.profile.txt) for the org profile and current funding
priority that drives screening here, and [`prompt.md`](prompt.md) for the `grants.json` schema.

## Status (as of 2026-08-20)

1 candidate researched: Mozilla Technology Fund (MTF), Tier 3 — see `grants.json` for detail.
MOSS (Mozilla Open Source Support), named in earlier internal discussion as a starting
candidate, turned out to be defunct (indefinite hiatus since Mozilla's 2020 restructuring);
MTF is its stated successor but has no open call as of this writing and recent cycle themes
(AI-centric) don't obviously match Doikayt's domain.

Remaining starting cluster to work through (named in earlier internal discussion, not yet
turned into tracked records): NLnet, Sovereign Tech Fund, Media Democracy Fund, NetGain —
digital-rights / open-source-tech funders whose model (restricted, deliverable-scoped software
grants) is a close structural match for funding the GASify/build-tools/geoCRM stack. This is a
starting point to research, not a pre-screened shortlist — each still needs real research
against the schema in [`prompt.md`](prompt.md), including whether it accepts fiscally sponsored
applicants. Given MOSS's fate, verify each is still actually active before investing further.

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
