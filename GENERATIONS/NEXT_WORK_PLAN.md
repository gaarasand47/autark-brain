# Post-Gen-2 Architecture Work Plan

**Status:** Gen-2A implementation candidate under independent verification
**Prerequisite:** Gen-2 Instinct baseline remains immutable and locked.

## Objective A — Vision and generation reconciliation

Resolve whether the next milestone is called `Gen-1 Completion`, `Gen-2A`, or
`Gen-3 Builder`. Preserve Gen-2 Instinct as a named foundation regardless of
the label. Update the roadmap only after independent design review.

## Objective B — Observation architecture

Specify one top-level `ObservationEngine` with bounded source adapters, source
identity, timestamps, freshness, confidence, provenance, deduplication,
correlation IDs, rate/budget limits, failure behavior and read-only authority.
The engine must not execute, spend, sign, broadcast, mutate policy or modify
identity.

## Objective C — Observation-to-memory contract

Define an immutable observation envelope and one canonical ingestion route into
working, episodic, semantic, business and financial memory. Specify retention,
searchability, provenance, idempotency, privacy and corruption recovery.

## Objective D — Learning completion

Define measurable strategy outcomes, reinforcement and decay, forgetting,
hypothesis lifecycle, experiment evidence, prompt/planning/budget improvements,
and failure-safe rejection of unsupported lessons.

## Objective E — Dream and proposal evidence

Expand offline replay and hypothesis simulation while preserving zero real-world
authority. Define the evidence bundle required for any evolution proposal:
reproducible diff, tests, constitutional/security/economic checks, regression
results and rollback material.

## Sequencing rule

Do not begin autonomous-business, collective-organism or artificial-life work
until Objectives B–E are designed, independently reviewed, implemented in narrow
objectives, and verified. Do not begin Gen-3 code merely because Gen-2 is locked.

## Detailed implementation sequence

Each objective below is a separate handoff. The next objective cannot begin
until the preceding implementation has an independent verification result.

### Stage 0 — Architecture reconciliation (documentation only)

- **P0-O1:** Approve the original life architecture as the strategic compass.
- **P0-O2:** Decide the generation label for unfinished Perception/Memory/
  Learning work (`Gen-1 Completion`, `Gen-2A`, or another explicit name).
- **P0-O3:** Define the ObservationEngine top-level organ boundary and its
  authority exclusions.
- **P0-O4:** Define the immutable ObservationEnvelope schema and provenance.
- **P0-O5:** Define the observation-to-memory contract and ownership matrix.
- **P0-O6:** Define acceptance tests, deterministic replay requirements,
  missing-data behavior, budgets, privacy and failure handling.

**Gate:** independent design review approves the reconciled architecture.

### Stage 1 — Deterministic observation primitives

- **P1-O1:** Implement clock, ID, randomness and source-adapter interfaces only
  where absent or incomplete.
- **P1-O2:** Implement the immutable ObservationEnvelope and validation guards.
- **P1-O3:** Implement a deterministic in-process observation source for tests.
- **P1-O4:** Add schema, migration and corruption-recovery tests.

**Gate:** focused Docker tests, replay tests and authority-boundary review pass.

### Stage 2 — ObservationEngine core

- **P2-O1:** Implement one top-level ObservationEngine organ.
- **P2-O2:** Add bounded internal source scheduling and rate/budget controls.
- **P2-O3:** Add source freshness, confidence, deduplication and correlation.
- **P2-O4:** Add safe degradation and unavailable-source behavior.
- **P2-O5:** Add internal metrics observation through the same envelope.

**Gate:** no execution, spending, signing, broadcast, mutation, policy or
identity authority; independent adversarial verification required.

### Stage 3 — Observation-to-memory ingestion

- **P3-O1:** Define the canonical idempotent ingestion boundary.
- **P3-O2:** Persist every accepted observation with provenance and retention.
- **P3-O3:** Route observations into working and episodic memory.
- **P3-O4:** Add semantic extraction only from evidenced observations.
- **P3-O5:** Add searchable business, financial and failure memory projections.

**Gate:** replay, restart, duplicate-delivery, corruption and retention tests.

### Stage 4 — Learning completion

- **P4-O1:** Define strategy outcome and hypothesis schemas.
- **P4-O2:** Implement evidence-based reinforcement and confidence updates.
- **P4-O3:** Implement decay and forgetting with reversible audit history.
- **P4-O4:** Implement hypothesis evaluation using offline simulation only.
- **P4-O5:** Measure improvement in planning, budget, ordering and opportunity
  selection without granting mutation authority.

**Gate:** learning cannot promote unsupported rules or bypass constitutional,
economic, security or human-approval boundaries.

### Stage 5 — Dreaming and evolution evidence

- **P5-O1:** Expand replay across observations, executions and failures.
- **P5-O2:** Generate offline business and architecture hypotheses.
- **P5-O3:** Produce reproducible proposal evidence bundles.
- **P5-O4:** Verify constitutional, security, economic and regression evidence.
- **P5-O5:** Preserve proposal-only evolution and human approval.

**Gate:** independent verification of zero real-world action from dreaming and
proposal generation.

### Stage 6 — Builder/business design (future generation)

Only after Stages 0–5 are complete and reviewed: define bounded opportunity
discovery, product creation, deployment, operations, customer support, revenue
accounting and reinvestment. This is the first stage allowed to propose the
future Builder generation; it is not authorized by the current plan.

## Current Gen-2A implementation evidence

- Engine repair chain: `93c3429`, `594562c`, `81cab86`, `1424fe7`,
  `27b1926`, `bf8d20d`, `86c8e79`.
- Independent focused result: `PASS WITH LIMITATIONS`; build passes and the
  focused ObservationEngine suite passes 3/3.
- Implemented: immutable validated envelopes, deterministic clock/IDs,
  unavailable-source degradation, source budgets, durable atomic observation
  storage, corruption quarantine, idempotency, evidence-bound lessons,
  reversible retirement audit, and offline evidence-validated hypotheses.
- Limitation: persistence serialization is in-process; cross-process locking is
  not implemented.
- Baseline status: `UNVERIFIED` until Docker adversarial verification runs.
  No Gen-2A baseline tag or Gen-3 authorization is issued.
