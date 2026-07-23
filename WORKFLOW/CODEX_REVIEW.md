# Codex Review

## Review Metadata

- **Objective:** `G2-S1-O1` — `IClock` deterministic primitive
- **Design handoff commit:** `28625bd`
- **Review type:** Independent design review
- **Verdict:** `APPROVED WITH CONDITIONS`

## Findings and Required Conditions

1. **Reconcile the existing duplicate `IClock` declarations.**
   `src/core/clock.ts` and `src/core/interfaces.ts` already declare equivalent
   but independent `IClock` interfaces. The plan must identify one canonical
   declaration and preserve current imports through a type re-export or
   another explicit compatibility mechanism. Do not add a third interface.

2. **Define the complete `TestClock` contract.**
   The existing `IClock` includes `setTimeout`, `clearTimeout`, `setInterval`,
   and `clearInterval`. A class implementing `IClock` cannot provide only
   `now`, `advance`, and `set`. Specify deterministic timer behavior and tests,
   or explicitly reconcile the inherited timer surface before implementation.
   Do not silently delegate test timers to wall-clock globals.

3. **Specify deterministic input semantics.**
   Define behavior for negative, non-finite, and fractional values passed to
   the constructor, `advance`, and `set`, including whether backward `set`
   operations are permitted. Tests must cover the selected boundaries.

4. **Strengthen verification.**
   Test `SystemClock` with a controlled `Date.now` spy and an exact expected
   value rather than a timing-dependent positivity assertion. Include
   `npm run build`, the focused Jest test, and compatibility tests for all
   inherited clock methods.

5. **Keep implementation scope bounded.**
   This objective may canonicalize the existing clock type and add
   `TestClock`; it must not replace unrelated direct `Date.now()` calls or
   refactor consumers beyond the minimum import compatibility change.
   Use the single name `TestClock`; do not introduce a mock/fake clock.

## Required Next Action

Revise only the `G2-S1-O1` design handoff to satisfy these conditions. Set
`STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION` and stop.

No production implementation is authorized.
