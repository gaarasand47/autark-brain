# Observation Flow

**Status:** `Stable` (Gen-0/Gen-1)

This flow occurs during the `WAKE` state. The organism observes its environment and populates `WorkingMemory`.

```mermaid
sequenceDiagram
    participant Heart
    participant Sandbox
    participant WorkingMemory
    
    Heart->>Heart: tick() begins
    Heart->>Heart: Set state WAKE
    Heart->>Sandbox: executeSkill('observeEnvironment')
    activate Sandbox
    Sandbox-->>Heart: EnvData (Market, API status, Inbox)
    deactivate Sandbox
    
    Heart->>WorkingMemory: set('current_env', EnvData)
    WorkingMemory-->>Heart: Success
    
    Heart->>Heart: Set state THINK
```

### Traceability
- **Implemented In:** `src/kernel/Heart.ts` -> `tick()` method.
- **Invariants:** If `observeEnvironment` fails, the organism logs the failure and transitions directly to `SLEEP`.
