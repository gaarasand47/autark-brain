# Codex Gen-3 Stage 0 Design Review

**Verdict:** `APPROVED WITH CONDITIONS`
**Reviewed commits:** engine `facbaf0`; Brain `5d1901c`
**Inherited baseline:** Gen-2A-Baseline at `86c8e79`

The repaired Stage 0 documentation addresses the prior sixteen findings. The
narrow OpportunityCandidate slice is evidence-bound and has no authority over
execution or external systems.

Independent evidence:

- pinned Node 22 Docker build: passed;
- TypeScript compilation: passed;
- focused OpportunityCandidate tests: 4/4 passed;
- authority scan: no execution, Treasury, wallet, signing, broadcast,
  deployment, policy, identity, approval, process or network access.

Conditions:

1. Keep implementation limited to the narrow evidence-bound OpportunityCandidate
   slice until its independent verification is complete.
2. Do not implement Project lifecycle, workspace construction, persistence,
   ValidationPipeline, release packaging, operation or later Gen-3 stages yet.
3. Independently verify actual workspace controls, persistence/recovery and
   lifecycle guards when those components are implemented.
4. Preserve exact evidence observedAt/expiry checks in regression tests.
5. Do not create a Gen-3 baseline or modify Gen-2A.

No deployment, operation, customers, revenue, autonomous mutation or Gen-2A
change is authorized.

## G3-S1-O2 Project lifecycle design review

**Reviewed plan:** `e92ca54`
**Verdict:** `APPROVED WITH CONDITIONS`

The repaired plan defines the Project schema and finite bounds, exact guarded
transitions and terminal states, actor/approval ownership, idempotency and
conflict semantics, schema-versioned atomic persistence/recovery, quarantine and
unavailable envelopes, deterministic replay inputs, candidate evidence
freshness/membership, adversarial assertions and authority scanning.

Implementation conditions: enforce the normative plan exactly, especially UTC
timestamp validation, bounded arrays, evidence expiry/freshness, terminal
no-outgoing edges and quarantine provenance. Independently test each condition.
No scope expansion or Gen-3 baseline is authorized.

## G3-S1-O2 implementation verification

**Verified engine:** `3a9bffa`
**Verdict:** `PASS WITH LIMITATIONS`

Pinned Docker build and TypeScript compilation passed. Focused suites passed
3/3 with 17/17 tests. Restart recovery, corruption sidecar/quarantine,
malformed transition logs, repeated same-clock quarantine, persisted replay
conflicts, concurrent single-writer serialization, lifecycle coverage and
authority scans passed.

Limitation: persistence locking remains in-process/one writer-process only;
cross-process locking is not implemented, consistent with the architecture.
No Gen-3 baseline, artifact, deployment, operation, customer, revenue or Gen-4
behavior is authorized.

## G3-S1-O3 ProjectSpecification design review

**Reviewed plan:** `8f8b250`
**Verdict:** `APPROVED WITH CONDITIONS`

The plan correctly remains documentation-only and limits the objective to an
immutable specification linked to one approved Project, bounded DAG/capability
references, budget/provenance and acceptance tests.

Before implementation, define exact field types and finite bounds; deterministic
task/node IDs and edge representation with cycle detection; capability registry
identity/version and membership semantics; decimal/rounding and deterministic
budget allocation; project-version/provenance hash binding and replay/idempotency;
immutable persistence/recovery; and the explicit authority-scan scope. No
execution, artifact, deployment or approval authority is included.

## G3-S1-O3 repair review

**Reviewed plan:** `ac3eaad`
**Verdict:** `APPROVED WITH CONDITIONS`

The repaired plan specifies exact fields and bounds, canonical deterministic
IDs/serialization, Kahn DAG cycle detection, capability registry snapshots,
integer-cent budget allocation, project/candidate/scope binding, replay/conflict
semantics, immutable versioned persistence/recovery/quarantine and transitive
authority scanning.

Implementation conditions: enforce immutability after creation, canonical hash
and sorted-ID rules, capability snapshots, and all listed adversarial tests for
cycles, duplicates, bounds, budgets, version/replay, immutability, recovery and
authority. No scope expansion.

## G3-S1-O3 implementation verification

**Reviewed engine commit:** `ec52565`
**Verdict:** `PASS WITH LIMITATIONS`

Pinned Docker build and TypeScript compilation passed. Five focused suites
passed (23/23). Durable same-key replay conflicts, restart recovery,
corruption quarantine with raw-byte hash, persistence locking, DAG/canonical
hashing, bounds, immutability, and authority checks passed.

Accepted limitations: no explicit stale-lock takeover or cross-process
concurrency test; capability registry provenance is not persisted as a
snapshot hash; authority scanning remains regex-based. These limitations are
recorded and do not grant execution, deployment, Treasury, wallet, signing,
broadcast, mutation, policy, identity, customer, or approval authority.

## Gen-3 limitation-fix verification

Reviewed engine commit `713913d`: **PASS WITH LIMITATIONS**. Docker and
TypeScript passed; five focused suites passed (27/27). Registry snapshot
hashing, stale-lock takeover, competing-writer rejection, replay conflict,
and raw-byte quarantine hashing were independently verified. Remaining limits
are full multi-process stress coverage and runtime-complete authority
 reachability proof.

## G4-O1 implementation verification

**Verified engine:** `efd03e2`  
**Verdict:** `PASS`

Pinned Docker image digest `sha256:5907dbe...` was recorded. The focused O1
suite passed 9/9 tests covering typed intent/persistence validation,
replay/recovery, fencing/quarantine, and authority boundaries. Limitations:
dependency advisories and broader multi-process stress are deferred to later
hardening. No authority is granted beyond the bounded O1 scope.

## G4-O2 implementation verification

**Reviewed engine:** `a4916e9`  
**Verdict:** `FAIL`

Independent review found the O2 candidate does not satisfy its bounded
contract. Typed validation, deterministic persistence/recovery,
writer-fencing, and adversarial coverage remain incomplete. Repair is required
within O2; no later objective, baseline, deployment, credential, or protected
action authority is authorized.

## G4-O2 repair verification

**Verified engine:** `ae40e73`  
**Verdict:** `PASS`

Pinned Docker image digest `sha256:bbacb066...` and four focused tests passed.
The repaired O2 persistence and authority boundaries are independently
verified. Caveat: the quarantine-path assertion inherited from O1 remains
tracked for later hardening; it does not expand O2 authority or permit a
baseline without the documented limitation.

## G4-O3 implementation verification

**Verified engine:** `66c0ff1`  
**Verdict:** `PASS`

Pinned Docker image digest `sha256:84b665...` and six focused tests passed.
The O3 bounded implementation is independently verified within scope. The
inherited O1 quarantine-path assertion remains tracked and does not grant
deployment, live credentials, or protected-action authority.
