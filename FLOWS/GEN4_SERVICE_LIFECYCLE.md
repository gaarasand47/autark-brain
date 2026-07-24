# Service Lifecycle

`STAGED → CANARY → ACTIVE → PAUSED → ROLLING_BACK → RETIRED`. Every transition has a guard, evidence hash, actor/authority, expiry, and persisted version. Health breaches pause first; activation and recovery require separate approval.
