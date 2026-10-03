# TODO (high priority, do next): augment the funder list

Written 2026-10-02. The grant search has only 5 funders in
[`../grants.json`](../grants.json), all from one starting cluster, so the "no Tier 1
candidate" result partly reflects a thin search. Widening it comes before further work on
any single funder. Screening criteria live in [`../prompt.md`](../prompt.md).

## Why now

- NLnet closes 2026-11-03 and Prototype Fund closes 2026-11-30, so the pool needs to be
  wider while there is still time to apply to something.
- Doikayt is unincorporated and US-based, and many funders require residency or a legal
  entity (Prototype Fund appears to). A larger pool raises the odds of a structural fit.

## Steps

1. **Add Prototype Fund** (`https://www.prototypefund.de/en`), from Pranjal.
   - Proposed tier: Tier 2. Move to Tier 1 only if a German-resident co-applicant exists.
   - Residency rules and the cohort 03 window (2026-10-01 to 2026-11-30, up to EUR 95k
     over 6 months or EUR 158k over 10) are search-derived. The site returns a 403 bot
     challenge to curl and WebFetch, so confirm them in a browser.
   - Ask Pranjal about German residency or a co-applicant.
2. **Mine curated lists**, deduplicate against `grants.json`, and screen the survivors in
   batches. A small Node script can do the dedupe.
   - [awesome-maintainer-funding](https://github.com/mechko/awesome-maintainer-funding)
   - [awesome-developer-grants](https://github.com/alihesari/awesome-developer-grants)
   - [Curioss funding opportunities](https://curioss.org/resources/funding-opportunities/)
   - [OSS.Fund guide](https://www.oss.fund/guides/how-to-fund-open-source-project/)
3. **Screen these named leads** (unverified, from a 2026-10-02 search):
   - GitHub Secure Open Source Fund: $10k per project, rolling, Session 5 open.
   - Open Technology Fund, FOSS Sustainability Fund: closed now, so watch for reopening.
   - Sovereign Tech Fellowship, which is separate from the Sovereign Tech Fund entry.
   - FUTO Grants, Sequoia Open Source Fellowship, FOSS United Fellowships.
   - Mozilla Foundation Incubator (already in
     [`../../incubators/guide.md`](../../incubators/guide.md), not in `grants.json`).
   - Ford, Sloan, Schmidt Sciences, Digital Infrastructure Fund: nothing found yet.
4. **Follow the August leads** in [`search-resources.md`](search-resources.md): FDO via a
   participating library, GrantStation via TechSoup, and the bank grantmaking databases.
5. **Ask warm contacts** (Pranjal, Alex Moss, Tech for Palestine) what funders they have
   applied to or know of.
6. **Check who funds peer projects** (Codeberg, Tor, Mastodon and similar).

## Discipline

- Record every new funder per [`../CLAUDE.md`](../CLAUDE.md), with source URLs and a
  `change_log` entry.
- Mark search-derived fields as unconfirmed until read from a primary source.
- Run the deadline triage ([`querying-grants.md`](querying-grants.md)) once the new
  entries are in.
