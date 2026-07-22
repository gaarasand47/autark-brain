# Heart

## 1. Why this exists & Biological Role
The `Heart` is the central execution kernel of Autark. Without it, the organism is merely a collection of inert databases and scripts. The Heart provides the "pulse" (the biological clock) that ensures Autark executes deterministically, synchronously, and autonomously regardless of external user interaction.

## 2. Responsibilities & Inputs/Outputs
- **Responsibilities:**
  - Manages the entire `tick()` lifecycle (`WAKE` -> `THINK` -> `EXECUTE` -> `SLEEP`).
  - Enforces the `CognitiveBudget` by deciding whether to trigger the `DreamEngine` or `ReflectionEngine`.
  - Coordinates all other organs.
- **Inputs:** None directly. It pulls data from the environment during `WAKE`.
- **Outputs:** An orchestrated sequence of state changes and database mutations across all organs.

## 3. Internal Data Structures & State Transitions
- **State Enum:** `WAKE | THINK | EXECUTE | SLEEP`
- **Transitions:** Handled sequentially in a `try/catch/finally` block during `tick()`. 

## 4. Dependency Map
- **Depends On:** 
  - `Treasury` (for Cognitive Budget checks)
  - `WorkingMemory` (for state storage during the tick)
  - `EpisodicMemory` (to flush state at the end of the tick)
  - `DreamEngine`, `ReflectionEngine` (for maintenance during sleep)
- **Used By:** 
  - The entry point (`index.ts`) which instantiates `setInterval(Heart.tick, interval)`.

## 5. Invariants
- **Always Deterministic:** The loop must execute synchronously to avoid race conditions.
- **Never Bypasses Treasury:** It explicitly checks `treasury.reserveCognitiveBudget()` before invoking Dream/Reflection.
- **Flushes Memory:** It must always call `WorkingMemory.clear()` in a `finally` block to prevent amnesia or context leakage between pulses.

## 6. Performance Budget
- **Time:** Base pulse must complete in < 2000ms. If Dreaming is invoked, maximum execution time is 5 minutes.
- **Memory:** `WorkingMemory` footprint during a tick must remain under 10MB.

## 7. Observability
- **Metrics Produced:** `heart_tick_time_ms`, `current_state`, `cognitive_budget_burned`.
- **Logs Produced:** `HEART_START`, `HEART_THINK_PLAN`, `HEART_EXECUTE_SUCCESS`, `HEART_EXECUTE_ERROR`, `HEART_SLEEP_START`, `HEART_SLEEP_MAINTENANCE`.

## 8. Lifecycle
- **Birth/Init:** Created once at boot. Connects to dependencies.
- **Normal Operation:** Loops `tick()` every 60 seconds (configurable).
- **Failure:** Catches errors in `THINK` or `EXECUTE`, logs a failure episode, and forces transition to `SLEEP`.
- **Recovery:** Flushing `WorkingMemory` during `SLEEP` naturally recovers the organism from transient failures.
- **Shutdown:** `clearInterval()` is called. 
- **Persistence:** None directly. It relies on `EpisodicMemory` for state persistence.
- **Restart:** Picks up cleanly because it has no persistent local state.

## 9. Security Boundaries & Economic Cost
- **Security:** The Heart does not interact with the network directly. It relies on `Sandbox` to execute generated skills.
- **Cost:** Running the loop itself costs 0 external capital. However, it directs the burning of capital by waking other expensive organs (Cortex/LLM).

## 10. Technical Debt & Known Limitations
- The synchronous nature of `tick()` means a long-running external API call will block the entire organism. 
- The `try/catch` block is currently too broad.

---
### Implementation Maturity
Stable

### Source Files
- `src/kernel/Heart.ts`

### Future Extensions
- **Gen-2:** Will introduce the `PREDICT` state and Instinct integration.
- **Gen-3:** May transition to a multi-threaded architecture where the Heart acts as a scheduler rather than a direct executor.
