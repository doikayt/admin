# Doikayt Grant Search

Living research project to identify and pursue grant funders for Doikayt Mobilization Labs.
Peer track to [`../fiscal-sponsorship/`](../fiscal-sponsorship/) — see
[`../doikayt.profile.txt`](../doikayt.profile.txt) for the org profile and current funding
priority that drives screening here, and [`prompt.md`](prompt.md) for the `grants.json` schema.

## Status (as of 2026-08-20)

The full starting cluster named in earlier internal discussion (MOSS, NLnet, Sovereign Tech
Fund, Media Democracy Fund, NetGain) has been researched. **No Tier 1 candidate identified
yet.** Summary:

- **NLnet Foundation** — Tier 2. Best structural fit found so far (individuals or
  not-yet-established organizations can apply directly, per NLnet's own materials — no fiscal
  sponsor or legal entity needed at all), but mission fit against GASify/geoCRM specifically is
  unclear: NLnet's flagship funded projects (Tor, WireGuard, Jitsi, PeerTube) are core
  internet/protocol infrastructure, and GASify/geoCRM depend on the proprietary Google Apps
  Script platform. `build-tools`/`typescript-build-config` may be the stronger specific pitch.
  Calls reopen 2026-09-03, deadline 2026-11-03 — real near-term action item.
- **Mozilla Technology Fund (MTF)** — Tier 3. Successor to MOSS (defunct since 2020). No open
  call found; recent cycle themes have been AI-centric, not a domain match.
- **Sovereign Tech Fund** — Tier 3. Roughly EUR 50,000 minimum project scope and a focus on
  already-critical/widely-used infrastructure — both mismatched to Doikayt's current stage.
- **Media Democracy Fund** — Tier 3. Good thematic mission overlap, but does not accept
  unsolicited applications — no path in without a warm referral.
- **NetGain Partnership** — Tier 3. A foundation collaborative, not an independently operating
  grantmaker; last confirmed open call was 2020; historical grant recipients skew toward
  research/policy orgs at a larger scale ($250k+ average) than fits Doikayt now.

See `grants.json` for full detail on each. Given MOSS's fate, always verify a funder is still
actually active before investing further research time.

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
