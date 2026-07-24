# State Atlas

**Status:** `Stable` (Gen-1)

The organism's lifecycle is dictated by the states of the `Heart`. The Heart transitions through these states sequentially during every `tick()`.

---

## 1. WAKE
- **Purpose:** Initialization of the pulse. Gathering environmental observations and establishing the baseline for the current tick.
- **Entry Conditions:** The beginning of the `Heart.tick()` loop.
- **Exit Conditions:** Environment data has been loaded into `WorkingMemory`.
- **Allowed Transitions:** `THINK`, `SLEEP` (if catastrophic error occurs during observation).
- **Time Budget:** < 500ms.
- **Failure Behavior:** If observation fails, log the failure and transition directly to `SLEEP` to avoid blind execution.

---

## 2. THINK
- **Purpose:** Analyzing observations against `SemanticMemory` to formulate a plan.
- **Entry Conditions:** Successful exit from `WAKE`.
- **Exit Conditions:** A `PLAN` is formulated and logged, including Goal, Evidence, Rules, and Confidence.
- **Allowed Transitions:** `EXECUTE`, `SLEEP` (if no action is deemed necessary).
- **Time Budget:** < 2000ms.
- **Failure Behavior:** If planning fails (e.g., LLM timeout), abort the plan and transition to `SLEEP`.

---

## 3. EXECUTE
- **Purpose:** Taking action in the external environment or executing internal skills based on the `PLAN`.
- **Entry Conditions:** A valid `PLAN` exists with Confidence > Threshold.
- **Exit Conditions:** Actions are complete, and results (success/failure/profits) are logged.
- **Allowed Transitions:** `SLEEP`.
- **Time Budget:** Varies based on action (usually bounded to < 10000ms).
- **Failure Behavior:** If execution fails mid-flight, immediately halt, log the failure episode, and transition to `SLEEP`.

---

## 4. SLEEP
- **Purpose:** Metabolic maintenance. Compaction, memory decay, and simulation (Dreaming).
- **Entry Conditions:** The end of `EXECUTE`, or an aborted `WAKE`/`THINK`.
- **Exit Conditions:** `WorkingMemory` is flushed. All maintenance is complete.
- **Allowed Transitions:** End of tick (waits for next pulse).
- **Time Budget:** Max 5 minutes (if Dreaming). Otherwise < 1000ms.
- **Failure Behavior:** If maintenance fails, log the error. The `WorkingMemory` must be flushed via a `finally` block regardless of failure to prevent memory leaks into the next pulse.

---
### Implementation Maturity
Stable

### Source Files
- `src/kernel/Heart.ts`

### Future Extensions
- **Gen-2:** May introduce a `PREDICT` state between `WAKE` and `THINK` to run the World Model before planning.
