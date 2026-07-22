# ADR-007: Continuous Biological Heartbeat Over Job Queue

**Date:** July 23, 2026
**Status:** Accepted

## 1. Context
Autark's Gen-1 execution loop was initially structured as a traditional asynchronous Job Queue. The `WorkerLoop` would eagerly poll the database and lock execution in a `while` loop until a task was completed (`while (currentState !== SLEEP)`). 

This design created several architectural failures:
- **Comatose Boot:** The organism could not boot its capabilities unless it had a task in the queue.
- **Unreachable Maintenance:** The moment a task finished, the loop terminated, bypassing over 100 lines of critical biological maintenance logic (`DreamEngine`, `SemanticMemory` extraction, `SQLite WAL Checkpoint`). 
- **Orphaned Tasks on Crash:** A mid-execution crash would leave a task stranded in `ARTIFACT_GENERATED` because the queue only dequeued `QUEUED` tasks.

## 2. Decision
We refactored `WorkerLoop.ts` and `Heart.ts` to implement a true **Continuous Biological Heartbeat**.

1. **Pulse, Not Loop:** `WorkerLoop` simply calls `runHeart(state)` once every 1,000ms. It does not enforce completion. It only provides the physical electrical pulse.
2. **Autonomous State Progression:** `Heart.ts` fully dictates its own biological state (`BOOT -> OBSERVE -> THINK -> ... -> SLEEP`).
3. **Dynamic Task Resumption:** During the `OBSERVE` state, the `Heart` dequeues *any* active task whose lease has expired, mapping its database status (`GENERATE`, `SANDBOX`, etc.) directly back to the biological state to resume execution seamlessly.

## 3. Consequences
- **Positive:** The organism successfully mimics a biological life-cycle. It boots autonomously, rests when idle, dreams and learns from failures, and flawlessly recovers from mid-flight power failures.
- **Negative:** The 1-second pulse introduces a guaranteed 1,000ms latency between every single state transition (e.g. `THINK` to `AUTHORIZE`). This artificial delay limits high-frequency trading capabilities, but enforces the strict biological constraints required for safety.
