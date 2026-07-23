# Codex Phase 2 Repair Verification

## Verdict

**FAIL**

## Exact Scope

- Engine repair: `a356ea31c4319e768a90c1245578da9f59fde671`
- Brain repair: `ce10d5c1393a93b938688696294065a910f1f1da`
- Docker build: PASS
- `DriveEngine.test.ts`: PASS
- `InstinctSystem.test.ts`: PASS
- `HeartIntegration.test.ts`: FAILS TO LOAD

## Verified Repairs

- Snapshot version now reaches `DriveEngine`.
- Critical Hunger maps to the explicit `FINANCIAL_CONSERVATION` class.
- Proposal evidence propagation remains present.
- Drive decay, suppression, tie ordering, and basic hysteresis tests pass.
- Heart passes motivational context into the production Cortex call.

## Findings Still Open

1. **The required production Heart regression suite is invalid.**
   `HeartIntegration.test.ts` imports nonexistent
   `../../kernel/interfaces` and a nonexistent exported `Heart` class. The
   production module exports `runHeart`. Docker Jest fails before executing
   the suite. Rewrite the tests against the actual production API and prove
   BOOT recovery, reachable SLEEP persistence, Cortex input, and selective
   acknowledgement.

2. **Acknowledgement is still inferred by Heart, not blindly forwarded.**
   Heart treats `plan.goalId` as an acknowledgement and invents the
   `ACKNOWLEDGED` status. Implement the canonical explicit
   Cortex -> Heart `acknowledgeProposal(goalId, status)` route, preserving the
   exact Cortex status without Heart policy.

3. **Recovery validation remains incomplete.**
   The persisted nested drive objects and evidence arrays are still accepted
   directly from `JSON.parse`. Numeric fields are converted with `Number`
   without finite/range checks. Snapshot IDs/versions, evaluator/proposal
   versions, timestamps, confidence, urgency, expected value, and expiration
   are not structurally validated. Add complete validation and adversarial
   tests for malformed JSON, invalid nested enums, non-finite/out-of-range
   numbers, and invalid lifecycle/evidence structures.

4. **Atomic quarantine remains incomplete.**
   Only two data tables are renamed; `schema_version` is not quarantined or
   repaired consistently. Rename failures are swallowed, deterministic names
   can collide at the same clock value, and `initSchema()` runs even after a
   failed/partial quarantine. Make the full quarantine transition atomic,
   collision-safe, failure-visible, and verify retained corrupt records.

5. **Critical-Hunger enforcement lacks boundary coverage.**
   Add tests proving every critical-Hunger proposal is
   `FINANCIAL_CONSERVATION`/`LOW`, ordinary Hunger cannot become less
   restrictive as scarcity rises, and unavailable Treasury data emits no
   proposal. Ensure downstream Cortex/constraint handling recognizes the new
   class as advisory and does not bypass inherited approval boundaries.

6. **Canonical brain documentation is still incomplete.**
   Only `GENERATIONS/GEN-2.md` changed. Reconcile
   `ORGANS/INSTINCT_SYSTEM.md`, both interface specifications, the evaluation
   flow, `ROADMAP.md`, `CURRENT_STATE.md`, and `TRACEABILITY.md`. Do not mark
   implementation complete while repair verification is failing.

7. **The handoff records the wrong brain SHA.**
   It lists `6318d5ff...`; the submitted brain commit is
   `ce10d5c1393a93b938688696294065a910f1f1da`. Record both exact full SHAs,
   actual Docker results, and unresolved limitations.

## Required Next Action

Repair only these seven remaining findings. Run the corrected focused Docker
suites, commit engine and brain repairs separately, write one coherent
handoff, set `STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`, and stop.
