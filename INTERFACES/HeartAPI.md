# Heart API

**Status:** `Stable` (Gen-0)

The `HeartAPI` defines how the organism interfaces with its own execution loop. Unlike traditional APIs that are called externally, the Heart API is mostly internal, invoked by the `index.ts` bootstrapper.

## 1. `start()`
Initiates the biological pulse.
- **Inputs:** None.
- **Outputs:** `void`.
- **Side effects:** Begins an asynchronous `setInterval` loop bound to `tick()`. 
- **Failure conditions:** Throws if the organism is already running.
- **Guarantees:** Will immediately trigger the first `WAKE` state.

## 2. `stop()`
Halts the biological pulse.
- **Inputs:** None.
- **Outputs:** `void`.
- **Side effects:** Calls `clearInterval()`.
- **Failure conditions:** None. Idempotent.
- **Guarantees:** Will not interrupt an active `tick()`. The organism will finish its current pulse (including `SLEEP`) before fully halting.

## 3. `tick()`
The core private execution cycle.
- **Inputs:** None.
- **Outputs:** `Promise<void>`.
- **Side effects:** Mutates `WorkingMemory`, requests `Treasury` budget, invokes `Cortex`, appends to `EpisodicMemory`.
- **Failure conditions:** Caught internally. Results in a failure episode logged to `EpisodicMemory` and a forced transition to `SLEEP`.
- **Invariants:** Must execute `WorkingMemory.clear()` in a `finally` block.

## 4. `forcePulse()`
Manually triggers a tick out of band (useful for testing or emergency intervention).
- **Inputs:** None.
- **Outputs:** `Promise<void>`.
- **Failure conditions:** Throws if a `tick()` is currently executing (preventing race conditions).
