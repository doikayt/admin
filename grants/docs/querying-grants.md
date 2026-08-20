# Querying grants.json

Ad-hoc `jq` queries against [`../grants.json`](../grants.json), plus shell aliases in
[`grants-aliases.sh`](grants-aliases.sh).

```sh
# Tier 1 candidates and their next action
jq -r '.[] | select(.tier == "Tier 1") | "\(.org_name)\n  \(.status.next_action)\n"' grants.json

# All candidates in a given tier
jq -r --arg t "Tier 2" '.[] | select(.tier == $t) | "\(.org_name)\n  \(.status.next_action)\n"' grants.json

# Full tier/status table
jq -r '.[] | "\(.tier)\t\(.org_name)\t\(.status.application_status)"' grants.json | sort

# Deadlines within the next 7 days (deadline triage — see prompt.md)
jq -r --arg cutoff "$(date -d '+7 days' +%Y-%m-%d)" --arg today "$(date +%Y-%m-%d)" \
  '.[] | select(.application_deadline >= $today and .application_deadline <= $cutoff) | "\(.org_name)\t\(.application_deadline)"' \
  grants.json | sort -k2

# A candidate's outreach questions
jq '.[] | select(.org_name == "Mozilla Open Source Support (MOSS)") | .outreach.questions_to_ask' grants.json
```

[`grants-aliases.sh`](grants-aliases.sh) defines a shortcut for each query above.

```sh
source docs/grants-aliases.sh
```
