# Failure Recovery Flow

**Status:** `Stable` (Gen-1)

This flow demonstrates how the organism handles mid-execution catastrophic crashes (e.g. power failure, Out of Memory, fatal exception) without losing tasks or double-spending.

```mermaid
sequenceDiagram
    participant WorkerLoop
    participant Heart
    participant WorkQueue
    participant Ledger
    
    WorkerLoop->>Heart: tick(GENERATE)
    activate Heart
    Heart-->>Heart: 💥 FATAL CRASH
    deactivate Heart
    
    Note over WorkerLoop: Server Reboots
    WorkerLoop->>Heart: tick(BOOT)
    Heart->>Heart: Registers Capabilities
    Heart-->>WorkerLoop: nextState = OBSERVE
    
    WorkerLoop->>Heart: tick(OBSERVE)
    activate Heart
    Heart->>WorkQueue: dequeue()
    Note over WorkQueue: Finds old task with expired lease (status: GENERATE)
    WorkQueue-->>Heart: task (status: GENERATE)
    
    Heart->>Heart: Resumes dynamically
    Heart-->>WorkerLoop: nextState = ARTIFACT
    deactivate Heart
    
    Note over WorkerLoop: Execution Resumes Cleanly
```

### Traceability
- **Implemented In:** `src/execution/WorkQueue.ts` and `src/kernel/Heart.ts`.
- **Invariants:** 
  1. `WorkQueue.dequeue()` MUST fetch any active task where `lease_expiry < now`, not just `QUEUED` tasks.
  2. `Heart.ts` `OBSERVE` state MUST dynamically map the task's database status back to the equivalent `OrganismState` to resume without re-planning.
