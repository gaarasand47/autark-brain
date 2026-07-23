# Instinct Evaluation Flow

**Status:** Proposed (Gen-2 Stage 0 Design Review — Reconciled)  
**Document:** `FLOWS/INSTINCT_EVALUATION_FLOW.md`  
**ADR:** `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`

---

## Sequence Diagram

```mermaid
sequenceDiagram
    autonumber
    participant Heart as Heart Kernel
    participant Snap as State Snapshot Collector
    participant IS as InstinctSystem (Organ Public Interface)
    box rgb(40,40,40) InstinctSystem Organ Internal Boundary
    participant NM as NeedMonitor (Internal)
    participant DE as DriveEngine (Internal)
    participant GPE as GoalProposalEngine (Internal)
    participant DB as Persistence Storage (Internal)
    end
    participant Cortex as Cortex Planner

    Heart->>Snap: Capture OrganismStateSnapshot
    Snap-->>Heart: OrganismStateSnapshot
    Heart->>IS: evaluate(snapshot)
    IS->>NM: evaluateNeeds(snapshot)
    NM->>NM: Validate metrics (MetricStatus)
    NM-->>DE: NeedSignal[] (with confidence scores)
    DE->>DE: Compute Hunger, Anxiety, Curiosity
    DE->>DE: Apply arbitration, hysteresis & decay
    DE-->>GPE: MotivationalState
    GPE->>GPE: generateProposals(MotivationalState)
    GPE-->>IS: GoalProposal[] (actionAuthority: false)
    IS-->>Heart: MotivationalState & GoalProposal[]
    Heart->>IS: persistState() [during SLEEP]
    IS->>DB: Atomic SQLite transaction write
    Heart->>Cortex: Pass MotivationalContext & GoalProposal[] during THINK
```

---

## Detailed Step-by-Step Lifecycle

1. **Pulse Trigger & Snapshot Intake (`Heart`):**
   At each biological tick, `Heart` invokes state collectors across organs (`Treasury`, `Reliability`, `Workload`) to capture a single, versioned `OrganismStateSnapshot`.

2. **Organ Boundary Invocation (`InstinctSystem.evaluate`):**
   `Heart` calls `InstinctSystem.evaluate(snapshot)` via the public organ interface. `Heart` does NOT interact directly with internal components or storage.

3. **Internal Need Evaluation (`NeedMonitor`):**
   Inside the `InstinctSystem` boundary, `NeedMonitor` evaluates raw metrics from the snapshot. Each metric is assigned a `MetricStatus` (`VALID` | `STALE` | `DEGRADED` | `UNKNOWN` | `UNAVAILABLE`). Outputs `NeedSignal[]` with deterministic confidence scores.

4. **Internal Drive Computation & Arbitration (`DriveEngine`):**
   Inside the `InstinctSystem` boundary, `DriveEngine` computes Hunger, Anxiety, Curiosity, applies arbitration rules (e.g. Anxiety suppresses Curiosity), hysteresis thresholds, decay rates, and produces `MotivationalState`.

5. **Internal Proposal Generation (`GoalProposalEngine`):**
   If confidence $\ge 0.50$, `GoalProposalEngine` maps active drives into non-executable `GoalProposal[]` entries with explicit risk classes, evidence references, and expiration timestamps. If confidence $< 0.50$, proposal generation is disabled.

6. **Organ Return & Persistence (`InstinctSystem.persistState`):**
   `InstinctSystem` returns an `InstinctEvaluationResult` containing `MotivationalState` and `GoalProposal[]` to `Heart`. During `SLEEP`, `Heart` triggers `InstinctSystem.persistState()`, which executes an atomic SQLite transaction write inside `InstinctSystem`.

7. **Advisory Context Exposure (`Cortex`):**
   `Heart` passes read-only `MotivationalContext` and `GoalProposal[]` to `Cortex` during `THINK`. `Cortex` uses this advisory context for plan priority scoring while independently enforcing all policy, treasury, and approval constraints.
