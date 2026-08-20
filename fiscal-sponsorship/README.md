# Doikayt Fiscal Sponsor Research

Living research project to identify and pursue a fiscal sponsor for Doikayt
Mobilization Labs. See [`../doikayt.profile.txt`](../doikayt.profile.txt) for the org profile that drives
screening, and `sponsors.json` for the candidate database (schema described
in the original planning doc, not included here — see chat history if needed).

## Subgoal status (as of 2026-08-13)

- **Subgoal 2 (candidate discovery):** Done. 48 candidates in `sponsors.json` — the original 12,
  5 more from a shallow 2026-08-14 pass of TSNE's fiscal-sponsor-directory referral, and 31 more
  from a full sweep of that same directory (~414 listings checked) on 2026-08-16.
- **Subgoal 3 (structural screening):** Done for all 12. Re-screened twice as
  strategy evolved (c4-first -> split c3/c4 -> deferred-campaign-work, see
  Section 5 of the profile and each record's `change_log`).
- **Subgoal 4 (mission alignment):** Started. `mission_alignment` (shared
  values + an outreach snippet) is now populated for all 4 Tier 1 candidates.
  `mission_fit_score` still `"Unclear"` everywhere — the formal two-score
  process from Subgoal 6 hasn't run.
- **Subgoal 5 (recurring narratives):** Not started (depends on Subgoal 4).
- **Subgoal 6 (prioritization):** Informally done via `tier`, not through the
  formal two-score process (mission_fit_score isn't populated yet).
- **Subgoal 7 (outreach):** Done for all 4 Tier 1 candidates — inquiries sent
  2026-08-13 to Alliance for Global Justice (`fiscalsponsorship@afgj.org`),
  Tides Center (Model C, via "Partner With Us" form — flagged that Model C
  requires $50k-$100k committed funding, which Doikayt doesn't currently
  have; asked whether founder self-funding counts), TSNE (via their inquiry
  form), and Movement Strategy Center (via Contact Us form, attn Daniel
  Parada, Director of Fiscal Sponsorship). All awaiting reply.
- **Subgoal 8 (living record):** Structurally in place and current — all 4
  Tier 1 candidates' `change_log` entries reflect real contact results as of
  2026-08-13.

## Current strategy (see profile Section 5 for full detail)

Doikayt is deferring political-campaign-services work rather than
restructuring around it. Near-term fiscal-sponsor search targets a
straightforward c3 relationship for Doikayt's generic, publicly-available
open-source software work, without changing public branding/messaging. A c4
relationship for campaign work is parked, not abandoned.

**Open risk to resolve on any Model A (comprehensive) candidate:** what
happens if an opportunistic campaign engagement arises while sponsored. This
is baked into `outreach.questions_to_ask` on the live Tier 1 candidates.

## Current Tier 1 candidates (contact these first)

Run `jq -r '.[] | select(.tier == "Tier 1") | .org_name' sponsors.json` to
regenerate this list from source. As of this snapshot (2026-08-20):

- Tides Center
- Movement Strategy Center
- Open Collective Foundation
- Software Freedom Conservancy

## Querying sponsors.json

See [`docs/querying-sponsors.md`](docs/querying-sponsors.md) for `jq` query
examples and shell aliases.

## Resuming this research in a new session

1. Clone/pull this repo.
2. Hand Claude `sponsors.json`, [`../doikayt.profile.txt`](../doikayt.profile.txt), and this README.
3. Tell it what happened since the last commit (contact results, new
   information, strategy changes) — it should update `sponsors.json` in
   place: bump `status.date_last_verified`, `status.current_assessment`,
   `status.next_action`, `status.application_status`, and always append
   (never edit in place) to `change_log`.
4. Commit after each meaningful update so the history stays a real audit
   trail of how the research evolved.
