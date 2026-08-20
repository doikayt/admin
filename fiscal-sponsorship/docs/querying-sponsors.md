# Querying sponsors.json

Ad-hoc `jq` queries against [`sponsors.json`](../sponsors.json), plus shell
aliases/functions for the same queries. Run all commands from the repo root.

## Raw queries

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

## Aliases

[`docs/sponsors-aliases.sh`](sponsors-aliases.sh) defines a shortcut for each query above.
Source it once per shell session:

```bash
source docs/sponsors-aliases.sh
```

| Command | Equivalent to |
|---|---|
| `sponsors-tier1` | Tier 1 candidates with their next action |
| `sponsors-tier "Tier 2"` | Same, for any tier (function, takes an argument) |
| `sponsors-outreach "Tides Center"` | Outreach questions for a specific org (function, takes an argument) |
| `sponsors-all` | Everything, tier + application status, one line per org |
