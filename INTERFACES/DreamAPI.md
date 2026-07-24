# Dream API

**Status:** `Experimental` (Gen-1)

The `DreamAPI` defines how the organism simulates hypotheses safely.

## 1. `simulate(hypothesis: string, scenarioId: string)`
- **Inputs:** 
  - `hypothesis`: The logic or strategy to test (stringified code or prompt).
  - `scenarioId`: A reference to a mocked environment state.
- **Outputs:** `Promise<DreamResult>`
  - `DreamResult`: `{ success: boolean, executionTime: number, errorTrace?: string, cost: number }`
- **Side effects:** Spawns a heavily sandboxed `vm` thread. Mocks API boundaries. Consumes `CognitiveBudget`.
- **Failure conditions:** Throws if the `CognitiveBudget` is insufficient. 
- **Invariants:** MUST enforce a strict timeout (e.g., 5000ms). The `Sandbox` MUST NOT have access to `process.env`, `require('fs')`, or `require('net')`.

## 2. `generateScenario(episodeId: string)`
- **Inputs:** An ID of a failed `EpisodicMemory`.
- **Outputs:** `Promise<string>` (Scenario ID).
- **Side effects:** Calls `Cortex` to generate a mocked JSON environment based on why the episode failed. Consumes `CognitiveBudget`.
