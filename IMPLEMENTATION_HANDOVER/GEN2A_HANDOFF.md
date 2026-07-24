# Gen-2A Perception and Learning Handoff

**Status:** PASS WITH LIMITATIONS; ready for human Gen-2A baseline lock
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
- Docker adversarial verification: `PASS WITH LIMITATIONS`; raw evidence is in
  `AUDITS/GEN2A/DOCKER_VERIFICATION_2026-07-24-PASS.md`.

## Required next action

The Gen-2A baseline may be tagged for human authorization. Cross-process
locking remains explicitly out of scope; no Gen-3 behavior is authorized.
