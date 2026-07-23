# Codex Repair Verification

## Verdict

**FAIL**

## Exact Repair Scope

- Engine repair: `92484a822d7a5e5216bce57ccfed6c9a64670717`
- Brain repair: `ac42a60e489a2295e73a1c1a39d4d57c2a450539`
- Docker build: PASS
- Existing focused suites: PASS, 24/24 tests
- No required repair regression tests were added.

## Verified Repairs

- Heart now supplies motivational state to the real Cortex call.
- The unreachable duplicate SLEEP branch was removed.
- BOOT invokes recovery.
- Proposal evidence is propagated.
- Motivational boundaries are strongly typed.
- Recovery rejects persisted `actionAuthority = 1`.

## Findings Still Open

1. **Acknowledgement is not a blind Cortex pass-through.**
   Heart marks every proposal `ACKNOWLEDGED` whenever any plan is produced.
   Cortex does not return or send an explicit proposal ID and lifecycle status.
   Implement the specified Cortex -> Heart -> InstinctSystem acknowledgement
   route without Heart inventing acknowledgement decisions.

2. **Snapshot version is still discarded.**
   `DriveEngine.arbitrate()` accepts `snapshotVersion`, but
   `InstinctSystem.evaluate()` still calls it with only `snapshot.snapshotId`.
   Pass `snapshot.version` and cover it with a regression test.

3. **Critical-Hunger allowlisting remains absent.**
   The repair adds comments but still emits generic
   `FINANCIAL_TRANSACTION`. `LOW` risk is not an enforceable conservation or
   cost-reduction allowlist. Encode an explicit allowlisted proposal/action
   identity and reject any non-allowlisted critical-Hunger output.

4. **Recovery validation remains incomplete.**
   Persisted evaluation status, drive kinds/statuses, objective classes, risk
   classes, lifecycle statuses, numeric ranges, nested drives, and evidence
   are still cast with `as any` or parsed without canonical validation.
   The `schema_version` row is inserted but never read or enforced.

5. **Quarantine is not atomic or collision-safe.**
   It renames two tables separately, swallows failures, uses `Date.now()`
   rather than the injected clock, and can leave a partially renamed schema.
   Preserve corrupt records atomically under deterministic unique names and
   verify the retained data.

6. **Hysteresis/arbitration remains incorrect.**
   During arbitration, the previous dominant drive can replace a stronger
   drive merely because it was previously dominant. Hysteresis may lower its
   activation threshold but must not defeat a strictly stronger active drive
   outside the defined margin.

7. **Decay and hysteresis are unverified.**
   No deterministic `TestClock` regression tests were added for elapsed-time
   decay, enter/exit thresholds, suppression, or tie ordering.

8. **Production integration regressions are absent.**
   No tests prove BOOT recovery, reachable SLEEP persistence, actual Cortex
   motivational input, or acknowledgement routing.

9. **Canonical brain documentation remains incomplete.**
   The repair updates `CURRENT_STATE.md` only. It does not reconcile
   `GENERATIONS/GEN-2.md`, `ORGANS/INSTINCT_SYSTEM.md`, the Heart/Instinct and
   Instinct/Cortex interfaces, evaluation flow, `ROADMAP.md`, or
   `TRACEABILITY.md` with the implementation and failed-verification status.

10. **The handoff remains internally stale.**
    `ANTIGRAVITY_HANDOFF.md` still declares objective `G2-S1-O2` and
    `READY_FOR_CODEX_DESIGN_REVIEW`, followed by an appended consolidated
    repair note. Replace it with one coherent repair handoff containing both
    full SHAs, exact changed files, tests, limitations, and repair status.

## Required Next Action

Repair only these remaining findings and add the regression tests already
required by the original review. Commit engine and brain changes separately,
record their full SHAs in a coherent handoff, set
`STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`, and stop.
