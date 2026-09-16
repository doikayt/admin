# Reddit outreach intros — Commons-Hub Pattern

Shared intro body is identical across all three; each closes with one
subreddit-specific line pointing at the section that community will care
about most. Link placeholder: `[link]` — swap in the actual doc URL before
posting.

---

## r/Cooperatives

I've been working on a governance/ownership pattern for open source software
collectives — call it the Commons-Hub Pattern. The core problem it's trying
to solve: OSS projects that get valuable enough to fund real work face two
questions nobody's really settled — who gets to govern the project's
direction, and who gets to benefit economically from it? The standard answer
(one corporate entity holding both) doesn't fit software that's explicitly
meant to be open in who contributes, who benefits, and who steers.

The proposal splits those two questions across three separate mechanisms: an
ordinary nonprofit board sets mission and policy; a narrowly-scoped DAO
decides — by equal vote among the people who actually did the work — how the
proceeds of a specific funded program get split; and a separate,
non-transferable "voice" token handles day-to-day operational decisions,
vesting with earned trust and decaying on inactivity rather than
accumulating into permanent control.

It also covers how a nonprofit ("Commons") plus satellite structure can spin
out a wholly-owned for-profit subsidiary — the same shape Mozilla Foundation
uses for Mozilla Corporation — and, after a real-world case study (the
August 2026 US government takedown of the Autistici/Inventati hosting
collective), what actually makes a distributed nonprofit structure resilient
to state or corporate deplatforming, versus what's just generic security
hygiene any single org could adopt.

It's an early draft — not reviewed by counsel, not written by a trained
economist — and I'd genuinely like pushback from people who work in
employee/worker ownership. Full doc: [link].

**Given what this sub focuses on**, you'll probably be most interested in
§3 (Distribution of Economic Benefits) — specifically the ESOP mechanics
section walking through the buyout/vesting/repurchase-obligation cash flows,
when an ESOP is actually worth the $200k–500k setup cost versus just
administrative overhead, and the C-corp/S-corp tradeoff at a founder's exit
(IRC §1042 rollover vs. tax-exempt income once the trust owns a majority
stake).

---

## r/opensource (cross-post candidate: r/FOSS)

I've been working on a governance/ownership pattern for open source software
collectives — call it the Commons-Hub Pattern. The core problem it's trying
to solve: OSS projects that get valuable enough to fund real work face two
questions nobody's really settled — who gets to govern the project's
direction, and who gets to benefit economically from it? The standard answer
(one corporate entity holding both) doesn't fit software that's explicitly
meant to be open in who contributes, who benefits, and who steers.

The proposal splits those two questions across three separate mechanisms: an
ordinary nonprofit board sets mission and policy; a narrowly-scoped DAO
decides — by equal vote among the people who actually did the work — how the
proceeds of a specific funded program get split; and a separate,
non-transferable "voice" token handles day-to-day operational decisions,
vesting with earned trust and decaying on inactivity rather than
accumulating into permanent control.

It also covers how a nonprofit ("Commons") plus satellite structure can spin
out a wholly-owned for-profit subsidiary — the same shape Mozilla Foundation
uses for Mozilla Corporation — and, after a real-world case study (the
August 2026 US government takedown of the Autistici/Inventati hosting
collective), what actually makes a distributed nonprofit structure resilient
to state or corporate deplatforming, versus what's just generic security
hygiene any single org could adopt.

It's an early draft — not reviewed by counsel, not written by a trained
economist — and I'd genuinely like pushback from people who've watched OSS
projects get enclosed or re-licensed from the inside. Full doc: [link].

**Given what this sub focuses on**, you'll probably be most interested in
§1 (The Commons Layer and Its Satellites) — specifically the "bulwarks
against enclosure" section, which looks directly at why MongoDB, Elastic,
and HashiCorp relicensed away from open source, and argues why locking
governance of the Commons to a mission-bound 501(c)(3) — instead of a
for-profit answerable to shareholders — removes the exact pressure that
drove those relicensing decisions.

---

## r/DAO

I've been working on a governance/ownership pattern for open source software
collectives — call it the Commons-Hub Pattern. The core problem it's trying
to solve: OSS projects that get valuable enough to fund real work face two
questions nobody's really settled — who gets to govern the project's
direction, and who gets to benefit economically from it? The standard answer
(one corporate entity holding both) doesn't fit software that's explicitly
meant to be open in who contributes, who benefits, and who steers.

The proposal splits those two questions across three separate mechanisms: an
ordinary nonprofit board sets mission and policy; a narrowly-scoped DAO
decides — by equal vote among the people who actually did the work — how the
proceeds of a specific funded program get split; and a separate,
non-transferable "voice" token handles day-to-day operational decisions,
vesting with earned trust and decaying on inactivity rather than
accumulating into permanent control.

It also covers how a nonprofit ("Commons") plus satellite structure can spin
out a wholly-owned for-profit subsidiary — the same shape Mozilla Foundation
uses for Mozilla Corporation — and, after a real-world case study (the
August 2026 US government takedown of the Autistici/Inventati hosting
collective), what actually makes a distributed nonprofit structure resilient
to state or corporate deplatforming, versus what's just generic security
hygiene any single org could adopt.

It's an early draft — not reviewed by counsel, not written by a trained
economist — and I'd genuinely like pushback from people who design DAO
tooling day to day. Full doc: [link].

**Given what this sub focuses on**, you'll probably be most interested in
§2 (Governance Layer), specifically the DAO section — it's a deliberately
narrow-scope DAO: it doesn't set policy or decide what to build, it governs
exactly one thing (splitting a funded program's proceeds among contributors
by equal vote), with the vote itself run off-chain (Coordinape/Snapshot) and
only the treasury/payout leg on-chain via multisig.

---

## Note on cross-posting

Each version leads with the same core pitch but closes on a different
section — post the version matching the sub, not the same text everywhere.
A reader in one of these communities will judge the whole piece by whether
*their* slice holds up, so don't post the r/DAO close into r/Cooperatives or
vice versa.
