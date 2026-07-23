# Antigravity Handoff

## Current Stage & Objective

- **Objective ID:** `G2-S1-O2`
- **Stage:** Stage 1 — Primitives & Schemas
- **Title:** Implement `IRandomSource` Deterministic Primitive
- **Status:** `READY_FOR_CODEX_DESIGN_REVIEW`

---

## 1. Design Overview

Objective `G2-S1-O2` establishes the canonical `IRandomSource` interface and its two reference implementations: `MathRandomSource` (for non-deterministic runtime operation) and `TestRandomSource` (for deterministic unit testing, seedable pseudo-random generation, and replay).

### Canonical Location & Re-export
- `src/core/random.ts`: Primary canonical declaration of `IRandomSource`, `MathRandomSource`, and `TestRandomSource`.
- `src/core/interfaces.ts`: Re-exports `IRandomSource` via `export type { IRandomSource } from './random';` to preserve existing imports without duplication.

---

## 2. Canonical Type & Interface Definitions

```typescript
/**
 * Canonical abstraction for random number generation in Autark.
 * Guarantees a number in the half-open interval [0, 1).
 */
export interface IRandomSource {
  /**
   * Returns a pseudo-random floating point number in range [0, 1).
   * @returns number r where 0 <= r < 1.
   */
  random(): number;
}

/**
 * Production implementation using Math.random().
 */
export class MathRandomSource implements IRandomSource {
  public random(): number {
    return Math.random();
  }
}

/**
 * Deterministic PRNG and sequence feeder for testing and replay.
 * Uses a Mulberry32 PRNG generator or pre-configured sequence array.
 */
export class TestRandomSource implements IRandomSource {
  private initialSeed: number;
  private state: number;
  private sequenceValues: number[] | null;
  private sequenceIndex: number;

  constructor(options?: { seed?: number; sequence?: number[] }) {
    // Default seed 0x12345678 if neither seed nor sequence is provided
    this.initialSeed = options?.seed ?? 123456789;
    this.state = this.initialSeed >>> 0;
    
    if (options?.sequence) {
      for (const val of options.sequence) {
        if (typeof val !== 'number' || !Number.isFinite(val) || val < 0 || val >= 1) {
          throw new Error(`Invalid sequence value ${val}: must be a finite number in [0, 1)`);
        }
      }
      this.sequenceValues = [...options.sequence];
    } else {
      this.sequenceValues = null;
    }
    
    this.sequenceIndex = 0;
  }

  public random(): number {
    if (this.sequenceValues !== null) {
      if (this.sequenceIndex >= this.sequenceValues.length) {
        throw new Error(`TestRandomSource sequence exhausted after ${this.sequenceIndex} calls.`);
      }
      const val = this.sequenceValues[this.sequenceIndex];
      this.sequenceIndex++;
      return val;
    }

    // Mulberry32 deterministic PRNG
    let t = (this.state += 0x6d2b79f5);
    t = Math.imul(t ^ (t >>> 15), t | 1);
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  }

  public reset(newSeed?: number): void {
    if (newSeed !== undefined) {
      this.initialSeed = newSeed;
    }
    this.state = this.initialSeed >>> 0;
    this.sequenceIndex = 0;
  }

  public getSeed(): number {
    return this.initialSeed;
  }
}
```

---

## 3. Invariants & Guardrails

1. **Half-Open Interval Invariant:** `random()` must ALWAYS return $r$ such that $0 \le r < 1$.
2. **Deterministic Repeatability:** Two `TestRandomSource` instances initialized with the exact same seed MUST generate identical output sequences.
3. **Sequence Validation:** Pre-configured sequence arrays must reject values $< 0$, $\ge 1$, `NaN`, `Infinity`, or non-number types upon construction.
4. **Exhaustion Guard:** When sequence array is exhausted, calling `random()` throws an explicit error rather than silently returning `undefined` or `NaN`.
5. **No Wall-Clock / External Mutation:** `TestRandomSource` does not depend on system time or global mutable state.

---

## 4. Verification Plan

### Automated Tests (`src/__tests__/unit/random.test.ts`)
- **`MathRandomSource`:**
  - Returns numbers in range $[0, 1)$ for 1000 consecutive calls.
- **`TestRandomSource` (Seeded PRNG):**
  - Same seed produces identical sequence across separate instances.
  - Different seeds produce distinct sequences.
  - `reset()` resets sequence generation back to beginning.
  - All outputs strictly satisfy $0 \le r < 1$.
- **`TestRandomSource` (Sequence Array):**
  - Yields sequence elements in exact order.
  - Throws explicit error when sequence array is exhausted.
  - Constructor validates and rejects out-of-range elements ($< 0$ or $\ge 1$).

### Verification Command
```bash
npm run build && npm test -- src/__tests__/unit/random.test.ts
```

---

## 5. Scope Boundaries & Exclusions

- **Included:** `IRandomSource` interface, `MathRandomSource`, `TestRandomSource`, unit tests.
- **Excluded:** `IIdGenerator` (deferred to `G2-S1-O3`), `OrganismStateSnapshot`, needs, drives, proposals, or persistence.


## Gen-2 Consolidated Pass Complete

Engine SHA: e541eb93704835d61776e1b638367df5f3254f83
Status: READY_FOR_CODEX_VERIFICATION
Notes: InstinctSystem implemented and integrated. Local unit tests wrote but fail on node-gyp better-sqlite3 build due to missing MSVC on windows. Engine builds perfectly. Ready for Codex verification.
