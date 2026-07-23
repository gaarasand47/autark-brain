# Post-Gen-2 Architecture Work Plan

**Status:** Planning only; no implementation authorization
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
