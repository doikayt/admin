# Self-Hosted, Open-Source Alternative to Google Sheets — Research Note

Context: `blurbs/why-charitable.txt` and `blurbs/alignment-with-tides-mission.txt` both commit to
exploratory research into whether GASify/geoCRM's functionality could run on a self-hosted,
open-source alternative to Google Workspace, as a genuine migration path off Big Tech — but
neither names a specific target platform. (Note: `blurbs/geocrm.md`'s "Expansion Opportunity:
Microsoft 365" section is unrelated — that's an installed-base/growth angle for a proprietary,
non-open-source platform, not a candidate for this migration-path research.)

## Leading candidate: Grist (`grist-core`)

- **License:** Apache License 2.0 — OSI-approved, genuinely open source. Confirmed via
  [gristlabs/grist-core](https://github.com/gristlabs/grist-core) on GitHub.
- **Self-hostable:** Yes — SQLite-based storage, designed for self-hosting/intranet operation.
- **Automation/scripting capability (the part that matters for replicating GAS):**
  - Formulas support full Python syntax and the Python standard library, not just a formula
    language — a closer match to GAS's scripting power than a typical spreadsheet.
  - REST API with an interactive API console.
  - Configurable outgoing webhooks, including column-specific triggers and formula-based
    conditions — the closest open-source analog to a GAS trigger (e.g. "run this when a
    column changes").
  - Custom widgets can be built on top of the data.
- **Caveat:** the more polished "Automations" visual-workflow feature (with email
  actions/delivery logging), OAuth app management, and MCP server support are reserved for
  the paid hosted service and are *not* in `grist-core`. The underlying building blocks
  (Python formulas, REST API, webhooks with triggers) are present in the open-source edition
  and are sufficient to replicate GASify/geoCRM-style automation; the paid layer is convenience
  on top, not a capability gate.

## Candidate ruled out: NocoDB

- Superficially similar (spreadsheet-like UI over a real database, webhooks, REST API,
  60k+ GitHub stars) but licensed under NocoDB's own **Sustainable Use License**, confirmed via
  the repository's `LICENSE.md` — this is a source-available license, not an OSI-approved
  open-source license. Using it would undercut the "genuine FOSS, not just source-visible"
  framing this research exists to support, so it's not a fit for this specific pitch even
  though it's technically capable.

## Also evaluated: ONLYOFFICE — weaker fit, not ruled out

- **License:** Community Edition (`ONLYOFFICE/DocumentServer`) is genuinely AGPL-3.0,
  OSI-approved, self-hostable.
- **Automation gap:** Community Edition ships macros and plugins (in-document scripting,
  closer to VBA/LibreOffice Basic than to a trigger system), but the **Automation API** —
  the piece that would actually replicate a GAS-style "run this when the data changes" hook
  — is reserved for the proprietary Developer Edition. So the genuinely open-source edition
  is weaker than Grist's for this specific use case, though it's a real literal Google
  Sheets/Excel file-format clone, which Grist is not (Grist is spreadsheet-as-database, not
  a spreadsheet-file editor). Worth revisiting if file-format compatibility with existing
  `.xlsx`/Sheets exports turns out to matter more than trigger/automation power.

## Ruled out (not open source, despite the name sounding like it)

- **Zoho Sheet / Zoho Workplace** — proprietary, cloud-only, no self-hosting option. Same
  disqualifying problem as the Microsoft 365 "Expansion Opportunity" item: real installed
  base, but not usable for a "genuine FOSS migration path" pitch. (No product called "SoHo
  Office" exists — this was likely what got misremembered as "SoHo.")

## Not yet evaluated

Collabora Online (LibreOffice-engine-based, self-hostable, macro-capable) and Baserow /
SeaTable (Airtable-style alternatives, license unconfirmed) — worth a look if Grist's approach
(spreadsheet-as-lightweight-database, not a literal spreadsheet-file clone) turns out to be the
wrong shape for a specific migration case.

## Bottom line

Grist is the most promising target found so far: genuinely OSI-approved-licensed, self-hostable,
and its core open-source edition already ships the automation primitives (Python formulas, REST
API, triggered webhooks) needed to approximate what GAS gives GASify/geoCRM today.
