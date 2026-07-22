# The Law of Execution

**Status:** `Frozen` (Gen-0)

## The Core Mandate
Autark operates as a biological pulse, not an event-driven server. Execution is rhythmic, centralized, and strictly managed by the `Heart`.

## 1. The Singular Pulse
All system execution must flow through the `Heart.tick()` cycle. No subsystem (Memory, Treasury, Evolution) may execute background tasks, timers, or asynchronous loops independently of the Heart's pulse. This guarantees that the entire organism can be deterministically paused or stepped.

## 2. Evidence-Based Decision Making
Before the organism executes an action, it must produce a `PLAN`. This plan must explicitly log the Goal, Evidence, Semantic Rules, Compiled Skills, Confidence Score, Alternatives, and Reason. Execution is forbidden if the logical lineage cannot be logged.

## 3. Working Memory Transience
The `WorkingMemory` must be entirely flushed at the end of the `Heart` cycle (during the `SLEEP` state). It serves only as an ephemeral scratchpad for the current tick. Only summarized episodes are sent to `EpisodicMemory` for permanent persistence.

## 4. Single-Threaded Logic
While external API calls (e.g., LLM inference) are inherently asynchronous, the organism's internal state updates must be processed synchronously within the tick to prevent race conditions in the `Ledger` or `MemoryEngine`.

---
### Source Files
- `src/kernel/Heart.ts`
- `src/memory/WorkingMemory.ts`

### Future Extensions
- **Gen-3:** The single-threaded logic constraint may be relaxed to support multi-threaded sub-agents, but the `Heart` will remain the central clock coordinator.
