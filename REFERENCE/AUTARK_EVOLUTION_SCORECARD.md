# Autark Evolution Scorecard

Use evidence statuses only: `NOT_STARTED`, `DESIGNED`, `IMPLEMENTED`, `VERIFIED_IN_SIMULATION`, `VERIFIED_WITH_REAL_ADAPTERS`, `PILOTED`, `OPERATIONALLY_PROVEN`, `ECONOMICALLY_PROVEN`.

| Generation | Architecture | Implementation | Deterministic/adversarial tests | Real adapter/E2E | Persistent autonomy | Value/revenue | Recovery | Blockers |
|---|---|---|---|---|---|---|---|---|
| Gen-0 | IMPLEMENTED | VERIFIED_IN_SIMULATION | VERIFIED_IN_SIMULATION | NOT_STARTED | NOT_STARTED | E0 | VERIFIED_IN_SIMULATION | inherited production-readiness review |
| Gen-1 | DESIGNED | IMPLEMENTED | VERIFIED_IN_SIMULATION | NOT_STARTED | NOT_STARTED | E0 | DESIGNED | inherited replay/authority/document drift items |
| Gen-2 | IMPLEMENTED | VERIFIED_IN_SIMULATION | VERIFIED_IN_SIMULATION | NOT_STARTED | NOT_STARTED | E0 | VERIFIED_IN_SIMULATION | deferred chaos/security scope |
| Gen-2A | IMPLEMENTED | VERIFIED_IN_SIMULATION | VERIFIED_IN_SIMULATION | NOT_STARTED | NOT_STARTED | E0/E1 | VERIFIED_IN_SIMULATION | single-writer limitation |
| Gen-3 | IMPLEMENTED | VERIFIED_IN_SIMULATION | VERIFIED_IN_SIMULATION | NOT_STARTED | NOT_STARTED | E1 | VERIFIED_IN_SIMULATION | documented runtime reachability limitation |
| Gen-4 | DESIGNED | NOT_STARTED | NOT_STARTED | NOT_STARTED | DESIGNED | E2 target | DESIGNED | Stage 0 review required |
| Gen-5 | NOT_STARTED | NOT_STARTED | NOT_STARTED | NOT_STARTED | NOT_STARTED | E4/E5 target | NOT_STARTED | enterprise capability undefined |

Scores are not percentages; every status requires archived evidence, scope, commit and reviewer.

