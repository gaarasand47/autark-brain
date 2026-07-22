# Dream Cycle Flow

**Status:** `Stable` (Gen-1)

This flow occurs during `SLEEP` when a previous episode failed and requires simulation.

```mermaid
sequenceDiagram
    participant Heart
    participant Treasury
    participant Cortex
    participant DreamEngine
    participant SemanticMemory
    
    Heart->>Treasury: reserveCognitiveBudget(est_cost)
    Treasury-->>Heart: true
    
    Heart->>Cortex: infer(FailedEpisode, MockSchema)
    Cortex-->>Heart: MockScenario
    
    Heart->>DreamEngine: simulate(Hypothesis, MockScenario)
    activate DreamEngine
    DreamEngine->>DreamEngine: Run Sandboxed VM
    DreamEngine-->>Heart: DreamResult (Success, Time, Cost)
    deactivate DreamEngine
    
    Heart->>Treasury: commitExpense(DreamResult.Cost)
    
    alt is Success
        Heart->>SemanticMemory: injectRule(Hypothesis, "Validated via Dream")
    end
```

### Traceability
- **Implemented In:** `src/cognitive/DreamEngine.ts` and `src/kernel/Heart.ts`.
- **Invariants:** The `DreamEngine` must strictly timeout and kill the VM if it hangs. `Treasury` deductions must happen regardless of success or failure.
