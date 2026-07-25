# Gen-4 Objective Sequence and Completion Gates

**Status:** architecture planning for the remaining objectives. O1–O5 have
independent implementation evidence; O6 remains unverified and must not be
treated as complete. This document authorizes no live credentials, production
deployment, customer activity, or Gen-5 behavior.

## Proven implementation history

The engine branch `gen4-development` contains the following bounded objectives:

| Objective | Scope | Engine evidence | Brain status |
|---|---|---|---|
| O1 | Gen-4 contracts, versioned store, lifecycle primitives | `efd03e2` | independently PASS |
| O2 | OperatorSystem and ServiceRegistry lifecycle | `ae40e73` | independently PASS |
| O3 | DeploymentController artifact staging and rollback | `66c0ff1` | independently PASS |
| O4 | ServiceMonitor and read-only providers | `a3e389d` | independently PASS |
| O5 | MaintenanceController bounded proposals | `d7b6ca8` | independently PASS |
| O6 | IncidentManager, recovery, fencing, quarantine | `57ea382` and repairs | **UNVERIFIED / repair required** |

The O1 inherited quarantine-path caveat remains recorded and is not silently
converted into a pass. O6 must receive a fresh independent review at its exact
final commit.

## Remaining architecture objectives

### O6 — Incident and recovery closure

Complete the incident state machine and persistence boundary. Required
invariants: atomic versioned writes; owner-token and monotonically increasing
epoch fencing; stale-lock takeover; stale-writer rejection; deterministic
replay and replay-conflict rejection; raw-byte quarantine evidence; illegal
transition rejection; emergency-stop authority revocation; natural shutdown;
and recovery after restart or corruption. The store remains single-writer;
multi-process contention is a verification requirement, not permission for
parallel authority.

### O7 — Temporal mission and operator lifecycle

Define `Mission`, `Phase`, `Milestone`, `Task`, and `ActionProposal` as
immutable, versioned records. Define deterministic transitions, deadlines,
drift detection, pause/resume, completion proof, and restart replay. O7 may
schedule and prioritize bounded operator work but cannot execute protected
actions, approve itself, bypass Policy/Approval/Treasury, or invent outcomes.
All temporal decisions require provenance and evidence references.

### O8 — Credential, disaster-recovery, and human-intervention closure

Define scoped, expiring, revocable credential leases and a credential broker
boundary. Secrets are never persisted in plaintext or exposed to the Cortex,
Builder, IncidentManager, or logs. Add backup/restore manifests, integrity
checks, quarantine, recovery-point objectives, recovery-time objectives,
operator handoff, emergency stop, and human override semantics. Live providers
remain unavailable unless explicitly configured and human-approved; simulated
providers are marked `SIMULATED` and cannot authorize protected actions.

### O9 — Zero-value/testnet pilot and measured outcome loop

Define a testnet or zero-value deployment vertical slice with explicit entry,
abort, and exit gates. It must produce signed/checksummed artifacts, health and
cost observations, rollback evidence, incident timelines, and measurable
`ProjectOutcome`/`OperationalOutcome` records without claiming unobserved
revenue or customer results. Four-day human-observed operation is a later gate,
not an automatic deployment. No real-money or customer action is authorized.

### O10 — Integrated Gen-4 baseline gate

Integrate O1–O9 and run independent Docker, replay, persistence, authority,
shutdown, dependency, provider, recovery, and endurance verification. Archive
exact engine/Brain SHAs, image digest, commands, timestamps, exit codes, raw
logs, checksums, and limitations. A baseline tag is allowed only after an
independent `PASS` (or an explicitly authorized documented limitation) and a
human decision. Gen-5 is not started automatically.

## Cross-objective exit invariants

Every objective must preserve: permanent human constitutional sovereignty;
separation of proposal, approval, execution, and outcome authorities;
read-only Cortex observation; no wallet, signing, broadcast, production-code
mutation, customer communication, or revenue authority; deterministic
recovery; immutable provenance; and bounded resource/egress policy.

