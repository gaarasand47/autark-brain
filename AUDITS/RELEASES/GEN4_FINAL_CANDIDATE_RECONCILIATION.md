# Gen-4 Final Candidate — Brain Reconciliation

Status: **GEN-4 FINAL CANDIDATE / INDEPENDENT BASELINE VERDICT PENDING**

This record reconciles the Brain with the exact final engine candidate. It does
not issue a baseline verdict, create a tag, or authorize Gen-4 live operation.
Historical failed and unverified reports remain immutable and are superseded
only by the evidence below.

## Exact provenance

| Item | Exact value |
|---|---|
| Engine implementation candidate | `6c190ffa510e0fa8df07135b6bbe67d4cebd9989` |
| Evidence archive commit | `b55df135255adeb70a0d9becbb62e6a6d629ad59` |
| Docker image | `autark-gen4-task4-1@sha256:64c17e645b95b0a7cb252402bd34b1e46bb055dd9566acf65f99d6c08b984f84` |
| Evidence archive | `autark/GEN4_SHUTDOWN_EVIDENCE/` at evidence commit |
| Previous exact-candidate evidence | `autark` commit `4e3f88e6204de9a0efa9264e99c75595647be7b6` |

## Objective reconciliation

### O6 — Central persistence

Canonical `FencedStateStore` migration, Windows-safe bounded replacement, real
child-process contention (50/50 repetitions), stale-writer rejection, replay
conflict handling, quarantine-byte preservation, and deterministic
disposal/shutdown are recorded in the final candidate evidence.

### O7 — Temporal Mission

Temporal Mission implementation and independent focused verification are
recorded as complete in the final candidate evidence, including mission
transitions, contention, replay, and persistence.

### O8 — Credentials, disaster recovery, and human intervention

Credential issuance/activation, disaster recovery, persisted emergency stop,
human-authorized recovery, and simulated/live provider separation are included
in the final focused verification set.

### O9 — Pilot and outcomes

Canonical pilot intent, authority and limits, measured outcomes, four-day
chronology, and exact replay are included in the final focused verification
set. This record does not authorize live credentials, deployment, customers, or
revenue activity.

### O10 — Heart and Operator authority integration

Heart reaches operational behavior through the public `OperatorSystem` facade.
The final candidate has no direct Heart Treasury access, direct Heart RPC
execution, or direct protected DeterministicLab execution. `EmergencyAuthority`
is mandatory at protected subsystem boundaries; emergency state is runtime
reachable and fail-closed.

## Final verification totals

- Focused O6–O10 evidence: 12 suites / 91 tests passed.
- Full suite: 39/39 suites and 210/210 tests passed.
- Full-suite natural shutdown repetitions: 10/10 exited 0.
- No `--forceExit` was used.
- Docker release rebuilt successfully with the digest recorded above.
- Evidence checksums verified.

The resolved shutdown issue was a test teardown race in
`src/__tests__/test_unauthorized_execution.test.ts`: SIGINT child termination
was not awaited. It was corrected in engine commit
`6c190ffa510e0fa8df07135b6bbe67d4cebd9989`. This was a test teardown issue,
not a runtime authority failure.

## Post-baseline limitation

Native Windows `npm ci` requires local C++ tooling for `better-sqlite3`.
Docker dependency installation and the pinned release build are verified.
This is a post-baseline host-environment limitation, not a Gen-4 baseline
failure.

## A–I evidence matrix for independent review

| ID | Frozen criterion | Status | Evidence reference |
|---|---|---|---|
| A | O6 central persistence | PASS evidence reported; independent verdict pending | `GEN4_FINAL_EVIDENCE` and `GEN4_SHUTDOWN_EVIDENCE` at the engine evidence commit |
| B | O7 temporal mission | PASS evidence reported; independent verdict pending | Focused O7 suites and contention logs in engine evidence archive |
| C | O8 credentials, DR, intervention | PASS evidence reported; independent verdict pending | Focused O8 suites and emergency-authority logs |
| D | O9 pilot and outcomes | PASS evidence reported; independent verdict pending | Focused O9 suites and replay evidence |
| E | O10 Heart/Operator authority integration | PASS evidence reported; independent verdict pending | Heart route scan, subsystem gate scan, focused O10 suites |
| F | Docker and security release | PASS evidence reported; independent verdict pending | Docker rebuild log, digest, pinned base, security triage |
| G | Runtime authority reachability | PASS evidence reported; independent verdict pending | Static route/gate scans and protected-action tests |
| H | Brain reconciliation readiness | RECONCILED | This document and append-only workflow status |
| I | Final integrated baseline verification | NOT YET VERDICTED | Full totals and 10 natural exits archived; independent review remains required |

The independent reviewer must issue the final A–I verdict. This document does
not write `GEN-4 BASELINE PASS` and does not create immutable baseline tags.
