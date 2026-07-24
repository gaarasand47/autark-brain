# Gen-2A Perception and Learning Handoff

**Status:** Awaiting independent Docker adversarial verification
**Scope:** Gen-2A Stages 0–5 only; Builder/business (Stage 6) excluded.

## Exact engine repair chain

`93c3429` -> `594562c` -> `81cab86` -> `1424fe7` -> `27b1926` ->
`bf8d20d` -> `86c8e79`

## Implemented boundaries

- ObservationEnvelope is validated, deeply immutable and provenance-bearing.
- ObservationEngine is read-only and degrades malformed or failed sources to
  `UNAVAILABLE` envelopes.
- Observation fingerprints exclude dynamic observation time and suppress
  duplicate delivery.
- JsonObservationStore uses atomic serialized in-process writes, restart
  recovery, corruption quarantine and safe unavailable state.
- LessonLedger requires evidence, uses deterministic reinforcement/decay and
  preserves retirement audit records.
- HypothesisEngine accepts only accepted observation evidence and emits
  offline proposals with authority `NONE`.

## Independent evidence

- TypeScript build: passed.
- Focused Gen-2A tests: 3/3 passed.
- Independent verdict: `PASS WITH LIMITATIONS`.
- Docker adversarial verification: `UNVERIFIED` because Docker Desktop's Linux
  engine is unavailable in the review environment.

## Required next action

Start Docker, run focused and adversarial Gen-2A tests, inspect persistence
restart/corruption/concurrency behavior, and verify that no observation or
learning path has execution, spending, signing, broadcast, mutation, policy or
identity authority. Only then may a Gen-2A baseline tag be created.
