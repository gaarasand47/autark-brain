# Revised Design Plan: Objective `G2-S1-O1` — `IClock` Deterministic Primitive

- **Objective ID:** `G2-S1-O1`
- **Stage:** Stage 1 — Primitives & Schemas
- **Target Component:** `autark` engine (`src/core/clock.ts`, `src/core/interfaces.ts`, & `src/__tests__/unit/clock.test.ts`)
- **Status:** Proposed — Revised for Codex Conditions Verification

---

## 1. Canonical Interface & Declaration Reconciliation

To resolve duplicate `IClock` declarations:
- `src/core/clock.ts` will serve as the single canonical declaration site for `IClock`.
- `src/core/interfaces.ts` will re-export `IClock` (`export { IClock } from './clock';`) to preserve existing imports without introducing a third interface type.

### Canonical `IClock` Contract
```typescript
export interface IClock {
  now(): number;
  setTimeout(callback: () => void, ms: number): any;
  clearTimeout(handle: any): void;
  setInterval(callback: () => void, ms: number): any;
  clearInterval(handle: any): void;
}
```

---

## 2. Complete `TestClock` Contract & Deterministic Timer Queue

`TestClock` will fully implement `IClock` using an internal virtual timer queue. It will **not** delegate to wall-clock `globalThis.setTimeout` or `globalThis.setInterval`.

### `TestClock` Specification
```typescript
export class TestClock implements IClock {
  private currentTime: number;
  private nextTimerId: number = 1;
  private timers: Map<number, { callback: () => void; dueTime: number; interval?: number }>;

  constructor(initialTime: number = 0);
  now(): number;
  advance(ms: number): void;
  set(timestamp: number): void;

  setTimeout(callback: () => void, ms: number): number;
  clearTimeout(handle: number): void;
  setInterval(callback: () => void, ms: number): number;
  clearInterval(handle: number): void;
}
```

- When `advance(ms)` or `set(timestamp)` moves virtual time forward, `TestClock` processes pending timers in ascending order of `dueTime`. For identical `dueTime`, ties are broken by creation order (`timerId`).
- `setInterval` automatically reschedules itself upon expiration until explicitly cleared via `clearInterval`.

---

## 3. Strict Deterministic Input Semantics & Boundaries

- **Constructor:** If `initialTime` is non-finite or `NaN`, throw `RangeError`. Negative values throw `RangeError`. Fractional values are rounded down via `Math.floor()`. Defaults to `0`.
- **`advance(ms)`:** If `ms <= 0`, non-finite, or `NaN`, throw `RangeError("TestClock advance duration must be a positive finite number")`. Fractional `ms` is rounded down via `Math.floor()`.
- **`set(timestamp)`:** If `timestamp < currentTime`, throw `Error("TestClock backward time movement is forbidden to enforce monotonic progression")`. If non-finite or `NaN`, throw `RangeError`.

---

## 4. Proposed Changes & File Paths

### `[MODIFY]` `src/core/clock.ts`
- Retain `IClock` and `SystemClock`.
- Add export for `TestClock` matching the full `IClock` contract.

### `[MODIFY]` `src/core/interfaces.ts`
- Replace duplicate `IClock` definition with `export { IClock } from './clock';`.

### `[NEW]` `src/__tests__/unit/clock.test.ts`
- Tests covering:
  1. `SystemClock.now()` verified via `jest.spyOn(Date, 'now').mockReturnValue(1700000000000)`.
  2. `SystemClock` timer pass-throughs (`setTimeout`, `setInterval`).
  3. `TestClock` initialization, `advance()`, and `set()` time stepping.
  4. `TestClock` deterministic timer queue (`setTimeout`, `setInterval`, `clearTimeout`, `clearInterval`).
  5. Input validation boundary tests (negative, NaN, non-finite, fractional, and backward time movement errors).
  6. Re-export type compatibility from `src/core/interfaces.ts`.

---

## 5. Explicit Exclusions & Scope Restrictions

- Single class name `TestClock` (no `MockClock` or `FakeClock` duplicates created).
- `IRandomSource` (deferred to `G2-S1-O2`).
- `IIdGenerator` (deferred to `G2-S1-O3`).
- **No refactoring of unrelated `Date.now()` consumers** outside `src/core/clock.ts` in this objective.

---

## 6. Verification Plan

- `npm run build` (verifies TypeScript build & re-export compilation).
- `npx jest src/__tests__/unit/clock.test.ts` (executes unit tests).
