# Heart ↔ Instinct System Interface Specification

**Status:** Proposed (Gen-2 Stage 0 Design Review — Reconciled)  
**Document:** `INTERFACES/HEART_INSTINCT_INTERFACE.md`  
**ADR:** `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`

---

## 1. Overview & Organ Boundary Principles

The interface between `Heart` (kernel orchestrator) and `InstinctSystem` (motivational organ) is strictly asynchronous and bounded. The returned evaluation payloads are immutable, read-only, and strictly advisory. `Heart` uses bounded lifecycle operations (`persistState`, `recoverState`) which only affect `InstinctSystem`-owned persistence.

- `Heart` **schedules** instinct evaluation during the biological pulse by calling `InstinctSystem.evaluate(snapshot)`.
- `Heart` **consumes** the resulting read-only `InstinctEvaluationResult` payload.
- `Heart` **triggers** bounded state persistence during `SLEEP` via `InstinctSystem.persistState()`.
- `Heart` **does NOT access** `NeedMonitor`, `DriveEngine`, `GoalProposalEngine`, or SQLite drive persistence storage directly.

---

## 2. API Contract & Methods

```typescript
export interface IHeartInstinctInterface {
  /**
   * Schedules and executes an instinct evaluation pulse using an immutable state snapshot.
   * Called by Heart during the biological tick sequence.
   */
  evaluate(snapshot: OrganismStateSnapshot): Promise<InstinctEvaluationResult>;

  /**
   * Returns the current, cached motivational context and proposals without triggering a new evaluation.
   */
  getEvaluationResult(): InstinctEvaluationResult;

  /**
   * Pass-through route for Cortex to acknowledge a proposal's lifecycle status.
   * Heart blindly forwards this acknowledgement to InstinctSystem. InstinctSystem owns updating the proposal state.
   */
  acknowledgeProposal(proposalId: string, status: "ACCEPTED" | "REJECTED" | "EXPIRED"): void;

  /**
   * Triggers bounded state persistence to underlying database storage.
   * Called by Heart during the SLEEP lifecycle phase.
   */
  persistState(): Promise<void>;

  /**
   * Resumes and recovers motivational state upon organism boot or recovery.
   */
  recoverState(): Promise<InstinctEvaluationResult>;
}

export interface InstinctEvaluationResult {
  state: MotivationalState;
  proposals: GoalProposal[];
}
```

---

## 3. Failure & Degradation Semantics (No Synthetic "NONE")

- If `evaluate()` fails, throws an unhandled exception, or encounters missing critical inputs:
  - `InstinctSystem` returns a structural failure state:
    ```typescript
    {
      state: {
        snapshotId: snapshot.snapshotId,
        evaluatedAt: clock.now(),
        evaluationStatus: "UNAVAILABLE",
        hunger: { intensity: 0, status: "UNAVAILABLE" },
        anxiety: { intensity: 0, status: "UNAVAILABLE" },
        curiosity: { intensity: 0, status: "UNAVAILABLE" },
        dominantDrive: "NONE",
        confidence: 0.0,
        confidenceReason: "Evaluation failed",
        suggestedObjectiveClass: null,
        actionAuthority: false,
        evaluatorVersion: snapshot.version,
        evidenceHash: null
      },
      proposals: []
    }
    ```
  - `Heart` MUST NOT synthesize or log a healthy-looking `NONE` state. `Heart` logs a telemetry event recording `evaluationStatus: "UNAVAILABLE"` and continues the biological pulse cleanly without goal proposals.

---

## 4. Directionality & Safety Invariants

- **Data Flow:** `Heart` $\rightarrow$ `OrganismStateSnapshot` $\rightarrow$ `InstinctSystem.evaluate()` $\rightarrow$ `InstinctEvaluationResult` $\rightarrow$ `Heart`.
- **Canonical Zero Authority:** `Heart` passes `InstinctEvaluationResult` (containing context and proposals) as read-only context to `Cortex`. Drives possess ZERO authority over execution dispatch, Treasury spending, Vault/signing/broadcast APIs, production mutation/deployment, policy/constitution rewriting, identity governance, or self-approval.
