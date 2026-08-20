# Shell aliases/functions for querying grants.json.
# Source from grants/: `source docs/grants-aliases.sh`
# See docs/querying-grants.md for what each one does.

alias grants-tier1="jq -r '.[] | select(.tier == \"Tier 1\") | \"\\(.org_name)\\n  \\(.status.next_action)\\n\"' grants.json"

grants-tier() {
  jq -r --arg t "$1" '.[] | select(.tier == $t) | "\(.org_name)\n  \(.status.next_action)\n"' grants.json
}

alias grants-all="jq -r '.[] | \"\\(.tier)\\t\\(.org_name)\\t\\(.status.application_status)\"' grants.json | sort"

grants-deadlines-soon() {
  local cutoff today
  cutoff="$(date -d '+7 days' +%Y-%m-%d)"
  today="$(date +%Y-%m-%d)"
  jq -r --arg cutoff "$cutoff" --arg today "$today" \
    '.[] | select(.application_deadline >= $today and .application_deadline <= $cutoff) | "\(.org_name)\t\(.application_deadline)"' \
    grants.json | sort -k2
}

grants-outreach() {
  jq --arg org "$1" '.[] | select(.org_name == $org) | .outreach.questions_to_ask' grants.json
}
