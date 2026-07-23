# Codex Phase 4 Repair Verification

## Verdict

**FAIL**

## Exact Scope and Evidence

- Engine: `bd0d08b740ffee97caa601f708eb1dfa3c0a8290`
- Brain documentation repair: `b030b5e9c99a682fad6c653e8f5a99b4b4c99713`
- Brain workflow head: `d0755cef47d590a4bd04bfb8e49b1892a9086c8e`
- Docker build: PASS
- Full Docker suite: FAIL, 67/68 tests passed

## Verified Repairs

- Canonical acknowledgement status union is used without Heart fallback.
- Valid `EvidenceRef` objects recover successfully.
- Null suggested objective class fails closed.
- Quarantine naming uses injected deterministic IDs.
- New adversarial persistence tests execute and pass.
- Existing Heart, persistence, drive, authority, and Gen-1 regressions pass.

## Remaining Findings

1. **Critical-Hunger risk tightening is undone by the generic class override.**
   `GoalProposalEngine` first selects `FINANCIAL_CONSERVATION`/`LOW` for
   critical Hunger, then replaces that class with
   `state.suggestedObjectiveClass` (`FINANCIAL_TRANSACTION`). The Docker
   boundary test fails accordingly. Make the override monotonic: a suggested
   class may tighten risk but must never widen or replace the critical-Hunger
   conservation class. Retain the failing regression test.

2. **Canonical documentation is still inconsistent.**
   `ORGANS/INSTINCT_SYSTEM.md`, both interface specifications, and
   `FLOWS/INSTINCT_EVALUATION_FLOW.md` still report `Proposed`; workflow and
   generation documents claim completion despite failed verification.
   Reconcile the status and acknowledgement/objective-class contracts across
   all canonical files. `CURRENT_TASK.md` also remains stale at `G2-S1-O2`.

3. **Recovery numeric range validation remains incomplete.**
   Finite checks exist, but proposal urgency/confidence and evidence numeric
   values are not consistently bounded, and timestamp ordering is not
   validated. Add focused adversarial coverage for out-of-range finite values
   and invalid `expiresAt <= createdAt`.

## Required Next Action

An implementation-authorized agent must repair only these three findings,
run the complete Docker suite, update the canonical brain documents and
handoff with exact SHAs/results, set
`STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`, and stop.
