# Doikayt Fiscal Sponsor Research

Living research project to identify and pursue a fiscal sponsor for Doikayt
Mobilization Labs. See `doikayt.profile.txt` for the org profile that drives
screening, and `sponsors.json` for the candidate database (schema described
in the original planning doc, not included here — see chat history if needed).

## Subgoal status (as of 2026-08-12)

- **Subgoal 2 (candidate discovery):** Done. 12 candidates in `sponsors.json`.
- **Subgoal 3 (structural screening):** Done for all 12. Re-screened twice as
  strategy evolved (c4-first -> split c3/c4 -> deferred-campaign-work, see
  Section 5 of the profile and each record's `change_log`).
- **Subgoal 4 (mission alignment):** NOT done. `mission_fit_score` is
  `"Unclear"` on every record; `mission_alignment.*` is empty everywhere.
- **Subgoal 5 (recurring narratives):** Not started (depends on Subgoal 4).
- **Subgoal 6 (prioritization):** Informally done via `tier`, not through the
  formal two-score process (mission_fit_score isn't populated yet).
- **Subgoal 7 (outreach):** Done for the 4 Tier 1 candidates (Tides Center,
  Movement Strategy Center, Alliance for Global Justice, TSNE) — each has a
  populated `outreach` object with contact questions ready to use.
- **Subgoal 8 (living record):** Structurally in place. Not yet "living" in
  the sense of reflecting real contact results — that's the next phase.

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
regenerate this list from source. As of this snapshot:

- Tides Center
- Movement Strategy Center
- Alliance for Global Justice
- TSNE (Third Sector New England)

## Querying sponsors.json

```bash
# Tier 1 candidates with their next action
jq -r '.[] | select(.tier == "Tier 1") | "\(.org_name)\n  \(.status.next_action)\n"' sponsors.json

# Same, parameterized by tier
jq -r --arg t "Tier 2" '.[] | select(.tier == $t) | "\(.org_name)\n  \(.status.next_action)\n"' sponsors.json

# Outreach questions for a specific org
jq '.[] | select(.org_name == "Tides Center") | .outreach.questions_to_ask' sponsors.json

# Everything, tier + application status, one line per org
jq -r '.[] | "\(.tier)\t\(.org_name)\t\(.status.application_status)"' sponsors.json | sort
```

## Resuming this research in a new session

1. Clone/pull this repo.
2. Hand Claude `sponsors.json`, `doikayt.profile.txt`, and this README.
3. Tell it what happened since the last commit (contact results, new
   information, strategy changes) — it should update `sponsors.json` in
   place: bump `status.date_last_verified`, `status.current_assessment`,
   `status.next_action`, `status.application_status`, and always append
   (never edit in place) to `change_log`.
4. Commit after each meaningful update so the history stays a real audit
   trail of how the research evolved.
