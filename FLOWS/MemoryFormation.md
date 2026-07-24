# Memory Formation Flow

**Status:** `Stable` (Gen-1)

This flow occurs during the transition from `EXECUTE` to `SLEEP`.

```mermaid
sequenceDiagram
    participant Heart
    participant WorkingMemory
    participant Cortex
    participant EpisodicMemory
    
    Heart->>Heart: End of EXECUTE
    Heart->>Heart: Set state SLEEP
    Heart->>WorkingMemory: getAll()
    WorkingMemory-->>Heart: Raw State
    
    Heart->>Cortex: infer(Raw State, SummarySchema)
    activate Cortex
    Cortex-->>Heart: Structured Summary
    deactivate Cortex
    
    Heart->>EpisodicMemory: commitEpisode(Summary, Result, Cost)
    activate EpisodicMemory
    EpisodicMemory-->>Heart: episode_id
    deactivate EpisodicMemory
    
    Heart->>WorkingMemory: clear()
    WorkingMemory-->>Heart: Flushed
```

### Traceability
- **Implemented In:** `src/kernel/Heart.ts` -> `flushToEpisodic()` method.
- **Invariants:** `WorkingMemory` MUST be cleared even if `commitEpisode` throws an error.
