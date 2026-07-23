# Autark Gen-2 Canonical Architecture, Deliverables, and Exit Criteria

**Status:** Proposed canonical Gen-2 specification (Reconciled Stage 0)  
**Purpose:** This document is stored in `autark-brain` and used by Antigravity, Codex, and future sessions as the single implementation guide for Gen-2.  
**Important:** No Gen-2 implementation begins until Stage 0 architecture reconciliation receives independent Codex approval.

---

## 0. Baseline Provenance & Branching Origin

- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## 1. Gen-2 Evolutionary Goal

Gen-2 transforms Autark from a primarily reactive organism into a bounded motivational organism.

The core evolutionary change is:
> Autark can detect verified internal deficits and opportunities, calculate motivational pressure, generate bounded goal proposals, and influence planning without receiving direct authority over execution, spending, identity, policy, approval, or self-modification.

Gen-2 is not a business organism, autonomous trader, self-deploying agent, or multi-agent colony.

Its purpose is to add:
- needs;
- drives;
- motivation;
- goal proposals;
- bounded internal initiative;
- explainability;
- persistence and recovery of motivational state.

---

## 2. Mandatory Pre-Implementation Architecture Reconciliation

### 2.1 Existing Conflict & Attribution
- `ROADMAP.md` (line 28) historically described the Need/Drive matrix as being implemented *"in the Heart"*.
- `ADR-006` deferred instincts to Gen-2 and explicitly rejected hardcoded execution scripts, forecasting that Gen-1's idle behavior would be *"entirely superseded by Gen-2"*.
- The proposed Gen-2 design instead treats drive physiology as a separate bounded subsystem (`InstinctSystem`), with `Heart` remaining a lightweight orchestrator.

### 2.2 Reconciliation Decision (ADR-008)
- `ADR-006`'s Gen-1 deferral and rejection of hardcoded execution remain 100% intact. `ADR-008` realizes and clarifies `ADR-006`'s Gen-2 intent, while superseding only its *"entirely superseded"* forecast sentence.
- The attribution of placing the Need/Drive matrix inside `Heart` is recognized as originating solely from `ROADMAP.md`.
- `Heart` will NOT own drive formulas, need normalization, confidence, arbitration, or proposal logic. A dedicated principal organ (`InstinctSystem`) owns all Need/Drive physiology.

### 2.3 Required Roadmap Correction
`ROADMAP.md` wording is updated from:
> *Need/Drive matrix in the Heart*
to:
> *Heart schedules instinct evaluation and consumes motivational state, while a dedicated Instinct subsystem (`InstinctSystem`) owns Need/Drive calculations.*

**No source code implementation starts until Codex reviews and approves Stage 0.**

---

## 3. Final Organ Count & Enclosure Boundary

To avoid organ sprawl, Gen-2 introduces exactly **one principal top-level organ**: **`InstinctSystem`**.

### 3.1 `InstinctSystem` Boundary & Internal Subcomponents
`InstinctSystem` acts as a unified organ enclosing three private internal subcomponents:
- `NeedMonitor`: Reads immutable state snapshots, validates metrics, emits `NeedSignal[]`.
- `DriveEngine`: Computes Hunger, Anxiety, Curiosity, deterministic arbitration, hysteresis, decay.
- `GoalProposalEngine`: Translates motivational state into non-executable `GoalProposal[]`.

These subcomponents are private internal logic modules of `InstinctSystem`. They are not separate top-level organs.

### 3.2 Heart Boundary
`Heart` may ONLY invoke the public `InstinctSystem` interface:
- Schedule evaluation: `InstinctSystem.evaluate(snapshot)`
- Query cached state: `InstinctSystem.getEvaluationResult()`
- Trigger persistence: `InstinctSystem.persistState()`
- Recover state: `InstinctSystem.recoverState()`

`Heart` does NOT call `NeedMonitor`, `DriveEngine`, or `GoalProposalEngine` directly, nor does `Heart` access SQLite persistence storage for drive states.

---

## 4. Canonical Data Flow

```
Verified Organism State
        ↓
Immutable OrganismStateSnapshot
        ↓
InstinctSystem (Public Interface Entry)
  ├─ NeedMonitor (Internal) ──→ NeedSignal[]
  ├─ DriveEngine (Internal)  ──→ DriveState / MotivationalState
  └─ GoalProposalEngine (Internal) ──→ GoalProposal[]
        ↓
MotivationalState & GoalProposal[] (Public Read-Only Return)
        ↓
Heart Kernel (Orchestrator Intake)
        ↓
Cortex Planning Context (Advisory Prioritization)
        ↓
Existing Policy / Treasury / Capability / Approval / Sandbox Boundaries
        ↓
Normal Execution Pipeline
```

The data flow must NOT become:
$$\text{Drive} \longrightarrow \text{Direct task execution} \longrightarrow \text{Direct Treasury reservation} \longrightarrow \text{Direct wallet/signing/broadcast}$$

---

## 5. Canonical Authority Restrictions & Safety Invariants

Drives operate under a single, unified **Canonical Authority Restriction Matrix**. Drives have **ZERO authority** over:

1. **Execution Dispatch Authority:** Drives cannot dispatch tasks, invoke capabilities, or execute code directly.
2. **Treasury Spending & Reservation Authority:** Drives cannot reserve, allocate, or spend Treasury funds.
3. **Vault, Signer & Broadcast Authority:** Drives cannot access cryptographic keys, signing tools, or external broadcast APIs.
4. **Production Mutation & Deployment Authority:** Drives cannot alter codebase files, deploy mutations, or modify infrastructure.
5. **Policy & Constitution Authority:** Drives cannot modify Constitution rules, security policies, or permission settings.
6. **Identity & Governance Authority:** Drives cannot alter organism identity, credential profiles, or authority configurations.
7. **Self-Approval Authority:** Drives cannot approve their own generated proposals, plan acceptance, or evolutionary mutations.

### 5.1 Monotonic Risk Ceiling Rule (Hunger Invariant)
- **Non-Escalation:** Greater Hunger must NEVER permit greater financial risk or expand spending ceilings.
- **Monotonic Tightening:** As Treasury scarcity increases (higher Hunger), permitted risk ceilings, spending limits, and eligible objective classes MUST tighten monotonically (monotonically non-increasing risk ceiling).
- **Survival Constraint:** Under survival-critical Hunger ($\text{Hunger} \ge 0.80$), goal proposals are strictly restricted to resource conservation, cost reduction, and explicitly allowlisted low-risk activity.

### 5.2 Anxiety & Curiosity Invariants
- **Anxiety:** High Anxiety ($\ge 0.80$) emits high-anxiety motivational context. `Cortex` applies its own independently enforced planning rules to restrict plan candidates to safe maintenance and validation classes.
- **Curiosity:** Curiosity may propose read-only research or sandbox work, but cannot activate production capabilities automatically or consume protected reserves.
- **Approval Attachment:** Evaluation, calculation, and non-executable proposal generation require NO approval. Inherited approval requirements (`ApprovalGateway`, human signatures, policy rules) attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.

---

## 6. Core Schemas & Types

### 6.1 `OrganismStateSnapshot`
```typescript
interface OrganismStateSnapshot {
  snapshotId: string;
  capturedAt: number;
  version: string;

  treasury: TreasuryState;
  reliability: ReliabilityState;
  workload: WorkloadState;
  cognition: CognitiveState;
  knowledge: KnowledgeState;
  capabilities: CapabilityState;

  evidenceHash: string;
}
```

### 6.2 Metric & Evaluation Status
```typescript
type MetricStatus =
  | "VALID"
  | "STALE"
  | "DEGRADED"
  | "UNKNOWN"
  | "UNAVAILABLE";

type EvaluationStatus =
  | "VALID"
  | "DEGRADED"
  | "UNAVAILABLE";
```

### 6.3 `MotivationalState`
```typescript
interface MotivationalState {
  snapshotId: string;
  evaluatedAt: number;
  evaluationStatus: EvaluationStatus;

  hunger: DriveState;
  anxiety: DriveState;
  curiosity: DriveState;

  dominantDrive: "HUNGER" | "ANXIETY" | "CURIOSITY" | "NONE";
  confidence: number;
  confidenceReason: string;

  suggestedObjectiveClass: ObjectiveClass | null;
  actionAuthority: false;

  evaluatorVersion: string;
  evidenceHash: string;
}
```

### 6.4 `GoalProposal`
```typescript
interface GoalProposal {
  goalId: string;
  objectiveClass: ObjectiveClass;
  sourceDrive: DriveKind;

  urgency: number;
  expectedValue: number;
  riskClass: RiskClass;

  evidence: EvidenceRef[];
  createdAt: number;
  expiresAt: number;

  actionAuthority: false;
  proposalVersion: string;
}
```

### 6.5 `InstinctEvaluationResult`
```typescript
interface InstinctEvaluationResult {
  state: MotivationalState;
  proposals: GoalProposal[];
}
```

---

## 7. Failure, Recovery, Atomicity & Metric Semantics

### 7.1 Evaluation Failure Semantics (No Fake "NONE")
- If `InstinctSystem.evaluate()` encounters an exception, unhandled failure, or missing critical inputs, it emits a structural failure state:
  ```typescript
  {
    state: {
      snapshotId: snapshot.snapshotId,
      evaluatedAt: Date.now(),
      evaluationStatus: "UNAVAILABLE",
      hunger: { intensity: 0, status: "UNAVAILABLE" },
      anxiety: { intensity: 0, status: "UNAVAILABLE" },
      curiosity: { intensity: 0, status: "UNAVAILABLE" },
      dominantDrive: "NONE",
      confidence: 0.0,
      confidenceReason: "Evaluation failed",
      suggestedObjectiveClass: null,
      actionAuthority: false,
      evaluatorVersion: "fallback",
      evidenceHash: "none"
    },
    proposals: []
  }
  ```
  - Telemetry error event logged with exact exception stack trace.
- `Heart` MUST NOT synthesize a healthy-looking `NONE` state upon failure; it must preserve and log `evaluationStatus: "UNAVAILABLE"`.

### 7.2 Persistence Atomicity & Schema Versioning
- All persisted motivational states, active goal proposals, and evaluator version metadata MUST be written within a single **atomic SQLite transaction**.
- Every persisted record includes `evaluatorVersion` and `schemaVersion`.

### 7.3 Recovery Behavior
- Upon boot or recovery (`InstinctSystem.recoverState()`):
  - If persisted state is missing, corrupt, or has an incompatible schema version, `InstinctSystem` logs a critical recovery failure event, quarantines corrupt records, and falls back to a clean boot state (`evaluationStatus: "UNAVAILABLE"`, `confidence: 0.0`).
  - It then immediately requests a fresh `OrganismStateSnapshot` to re-evaluate state.

---

## 8. Definition of Done (Gen-2 Exit Criteria)

Gen-2 is complete only when Autark can observe named internal metrics, produce deterministic evidence-backed Need signals, calculate bounded drives and confidence, resolve conflicting drives deterministically, resist threshold oscillation, persist/recover state atomically, explain active drives, generate non-executable goal proposals, feed Cortex, initiate allowlisted safe actions, trace action provenance, degrade safely, preserve safety boundaries, pass independent verification, and document limitations.

---

## 9. Gen-2 Canonical Objective Sequence

To adhere to the strict one-objective-at-a-time governance model, the Gen-2 implementation is decomposed into genuinely narrow, independently verifiable objectives. No objective may begin until the previous objective's implementation is verified and approved by Codex.

### Stage 0: Architecture (Current)
* **G2-S0-O1**: Baseline Inheritance & Architecture Reconciliation

### Stage 1: Primitives & Schemas
* **G2-S1-O1**: Implement `OrganismStateSnapshot` types and static collectors.
* **G2-S1-O2**: Implement `MetricStatus`, `MotivationalState`, and `InstinctEvaluationResult` types.

### Stage 2: NeedMonitor
* **G2-S2-O1**: Implement `NeedMonitor` metric validation logic (stale/degraded/valid).
* **G2-S2-O2**: Implement `NeedMonitor` NeedSignal translation and confidence scoring.

### Stage 3: DriveEngine
* **G2-S3-O1**: Implement `DriveEngine` raw intensity calculations for Hunger, Anxiety, Curiosity.
* **G2-S3-O2**: Implement `DriveEngine` deterministic arbitration and hysteresis decay.

### Stage 4: GoalProposalEngine
* **G2-S4-O1**: Implement `GoalProposalEngine` generation rules for Hunger (monotonic risk ceiling).
* **G2-S4-O2**: Implement `GoalProposalEngine` generation rules for Anxiety and Curiosity.

### Stage 5: InstinctSystem Assembly
* **G2-S5-O1**: Assemble `InstinctSystem` public interface over internal logic components.
* **G2-S5-O2**: Implement atomic SQLite persistence and schema versioning for `InstinctSystem`.
* **G2-S5-O3**: Implement `InstinctSystem` recovery, quarantine, and failure fallback semantics.

### Stage 6: Heart & Cortex Integration
* **G2-S6-O1**: Wire `Heart` tick sequence to `InstinctSystem.evaluate()` and `persistState()`.
* **G2-S6-O2**: Implement `Heart` pass-through of `InstinctEvaluationResult` to `Cortex.think()`.
* **G2-S6-O3**: Implement `Cortex` planning integration using advisory motivational context.

### Stage 7: System Validation & Release
* **G2-S7-O1**: Complete Gen-2 system testing and shadow-mode validation.
* **G2-S7-O2**: Gen-2 Integration and Final Release (Requires separate independent authorization).
