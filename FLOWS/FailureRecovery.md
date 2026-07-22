# Failure Recovery Flow

**Status:** `Stable` (Gen-1)

This flow demonstrates how the organism handles a mid-tick catastrophic failure without corrupting state.

```mermaid
sequenceDiagram
    participant Heart
    participant Sandbox
    participant WorkingMemory
    participant EpisodicMemory
    
    Heart->>Sandbox: executeSkill('riskyAction')
    activate Sandbox
    Sandbox-->>Heart: throw Error("Network Timeout")
    deactivate Sandbox
    
    Note over Heart: Catch Block Triggered
    
    Heart->>Heart: Log Error to WorkingMemory
    Heart->>Heart: Force Transition to SLEEP
    
    Heart->>EpisodicMemory: commitEpisode(FailedSummary)
    
    Note over Heart: Finally Block Triggered
    
    Heart->>WorkingMemory: clear()
    WorkingMemory-->>Heart: Flushed
    
    Heart->>Heart: Wait for next tick
```

### Traceability
- **Implemented In:** `src/kernel/Heart.ts`.
- **Invariants:** `WorkingMemory` MUST be cleared via the `finally` block to prevent the corrupted state from leaking into the next pulse.
