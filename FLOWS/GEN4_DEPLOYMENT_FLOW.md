# Deployment and Rollback Flow

`candidate → evidence validation → approval → staged → canary → acceptance → active`; any failed gate becomes `PAUSED` or `ROLLING_BACK`. Rollback is checksum-selected, policy-checked, budgeted, observable, and independently recorded. Deployment never implies customer or revenue activity.
