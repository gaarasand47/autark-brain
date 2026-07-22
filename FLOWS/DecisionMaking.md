# Decision Making Flow

**Status:** `Stable` (Gen-1)

This flow occurs during the `THINK` state.

```mermaid
sequenceDiagram
    participant Heart
    participant WorkingMemory
    participant SemanticMemory
    participant Cortex
    
    Heart->>WorkingMemory: get('current_env')
    WorkingMemory-->>Heart: EnvData
    
    Heart->>SemanticMemory: queryRelevantRules(EnvData)
    activate SemanticMemory
    SemanticMemory-->>Heart: [Rule1, Rule2]
    deactivate SemanticMemory
    
    Heart->>Cortex: infer(Goal, EnvData, Rules, PlanSchema)
    activate Cortex
    Cortex-->>Heart: Plan { Goal, Evidence, SelectedRule, Action }
    deactivate Cortex
    
    Heart->>WorkingMemory: set('current_plan', Plan)
    Heart->>Heart: Set state EXECUTE
```

### Traceability
- **Implemented In:** `src/kernel/Heart.ts` -> `planExecution()` method.
- **Invariants:** The `Cortex` is strictly enforced to return a JSON object matching `PlanSchema`, ensuring deterministic evidence-logging before execution.
