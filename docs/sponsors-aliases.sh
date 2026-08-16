# Shell aliases/functions for querying sponsors.json.
# Source from the repo root: `source docs/sponsors-aliases.sh`
# See docs/querying-sponsors.md for what each one does.

alias sponsors-tier1="jq -r '.[] | select(.tier == \"Tier 1\") | \"\\(.org_name)\\n  \\(.status.next_action)\\n\"' sponsors.json"

sponsors-tier() {
  jq -r --arg t "$1" '.[] | select(.tier == $t) | "\(.org_name)\n  \(.status.next_action)\n"' sponsors.json
}

sponsors-outreach() {
  jq --arg org "$1" '.[] | select(.org_name == $org) | .outreach.questions_to_ask' sponsors.json
}

alias sponsors-all="jq -r '.[] | \"\\(.tier)\\t\\(.org_name)\\t\\(.status.application_status)\"' sponsors.json | sort"
