# Design Plan: Objective `G2-S1-O1` — `IClock` Deterministic Primitive

- **Objective ID:** `G2-S1-O1`
- **Stage:** Stage 1 — Primitives & Schemas
- **Target Component:** `autark` engine (`src/core/clock.ts` & `src/__tests__/unit/clock.test.ts`)
- **Status:** Proposed — Awaiting Codex Design Review

---

## 1. Purpose & Core Design

The purpose of `G2-S1-O1` is to establish the canonical, deterministic time primitive (`IClock`) required by all Gen-2 organs (`InstinctSystem`, `NeedMonitor`, `DriveEngine`, `GoalProposalEngine`, `Heart`) to eliminate direct `Date.now()` calls that break deterministic replayability.

```typescript
export interface IClock {
  /**
   * Returns current time in milliseconds since Unix epoch.
   * Guaranteed deterministic when backed by TestClock during replay/testing.
   */
  now(): number;
}
```

---

## 2. Proposed Changes & File Paths

### `[MODIFY]` `src/core/clock.ts` (in `autark` repository)
- Refactor/strengthen `IClock` interface to include canonical `now(): number`.
- Ensure `SystemClock` implements `IClock` returning wall-clock time (`Date.now()`).
- Implement `TestClock` implementing `IClock` with explicit step/advance and set methods:
  - `constructor(initialTime?: number)`
  - `now(): number`
  - `advance(ms: number): void`
  - `set(timestamp: number): void`

### `[NEW]` `src/__tests__/unit/clock.test.ts` (in `autark` repository)
- Unit tests verifying:
  - `SystemClock.now()` returns valid positive Unix timestamp.
  - `TestClock` starts at initialized time (or 0 default).
  - `TestClock.advance(ms)` deterministically steps time forward.
  - `TestClock.set(timestamp)` sets exact time.

---

## 3. Explicit Exclusions

- `IRandomSource` (deferred to `G2-S1-O2`).
- `IIdGenerator` (deferred to `G2-S1-O3`).
- `OrganismStateSnapshot`, `NeedSignal`, `DriveState`, or `InstinctEvaluationResult` schemas.
- Organ integration into `Heart`, `InstinctSystem`, or `Cortex`.

---

## 4. Safety, Authority & Determinism Invariants

- **Authority:** Zero execution, Treasury, signing, broadcast, policy, or approval authority.
- **Determinism:** `TestClock` guarantees 100% deterministic time progression across test executions.
- **Backwards Compatibility:** Existing `IClock` timer signatures (`setTimeout`, `setInterval`) remain intact if present, ensuring no breaking changes to Gen-1 imports.

---

## 5. Verification & Acceptance Plan

- **Automated Unit Tests:** `npx jest src/__tests__/unit/clock.test.ts`
- **Verification Criteria:** All tests pass with zero failures.
