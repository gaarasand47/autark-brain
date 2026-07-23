# Codex Phase 3 Repair Verification

## Verdict

**FAIL**

## Exact Scope and Test Evidence

- Engine: `d3d71d526d8226fcd0c3a54066db5c3d84648d20`
- Brain documentation repair: `4d52f6690e6c247653061bdfe6cf003619dfc3e4`
- Brain handoff commit: `392da0b7060b31dc171b65dd882b63f2b0dc90d5`
- Docker build: PASS
- Focused combined repair suite: FAIL, 14/15 tests passed
- Failure: valid persisted proposal evidence is quarantined as corruption.

## Verified Repairs

- Tests now target the production `runHeart` API.
- BOOT recovery, SLEEP persistence, Cortex context, and selected-goal routing
  tests execute.
- Snapshot provenance, drive tests, and critical-Hunger class tests pass.
- Quarantine table renaming is transactional and includes schema metadata.

## Findings Still Open

1. **Valid persistence recovery is broken.**
   `GoalProposal.evidence` is canonically `EvidenceRef[]` and persistence
   writes JSON objects. `parseAndValidateEvidence()` incorrectly requires
   every item to be a string. Docker therefore changes a valid recovered
   state from `VALID` to `UNAVAILABLE`. Validate the complete `EvidenceRef`
   object schema and retain the valid round-trip test.

2. **Acknowledgement statuses still contradict the canonical interfaces.**
   The architecture specifies `ACCEPTED | REJECTED | EXPIRED`. Code uses
   `ACKNOWLEDGED | REJECTED`, excludes `ACCEPTED` and `EXPIRED` from
   `CortexOutput`, and Heart retains an invented `ACKNOWLEDGED` fallback.
   Use one canonical status union end-to-end and forward it without fallback
   inference.

3. **Proposal safety guard was weakened.**
   Removing `state.suggestedObjectiveClass === null` permits proposals from
   inconsistent or deliberately malformed states. Restore fail-closed
   behavior. Tests must use a valid suggested class and prove null disables
   proposal generation.

4. **Quarantine naming is nondeterministic.**
   `Math.random()` was introduced into persistence recovery. Use an injected
   deterministic ID source or another deterministic collision-safe mechanism;
   do not use ambient randomness.

5. **Recovery validation still needs adversarial coverage.**
   Add tests for malformed evidence objects, nested drive corruption,
   non-finite/out-of-range proposal numbers, invalid schema metadata, repeated
   same-clock quarantines, and quarantine failure behavior.

6. **Canonical brain documents remain inconsistent.**
   `ORGANS/INSTINCT_SYSTEM.md`, both interface specs, and the evaluation flow
   still say `Proposed`; their acknowledgement unions conflict with code.
   `GEN-2.md` simultaneously says implementation complete and that no source
   implementation starts before review. Reconcile all previously listed
   canonical documents and record the current failed-verification state.

## Required Next Action

Repair only these six findings. Run the combined Docker suites including the
existing `InstinctSystem.test.ts`, commit engine and brain separately, provide
exact full SHAs and actual results, set
`STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`, and stop.
