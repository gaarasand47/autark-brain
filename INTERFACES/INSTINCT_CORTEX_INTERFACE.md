# Instinct System ↔ Cortex Interface Specification

**Status:** Proposed (Gen-2 Stage 0 Design Review — Reconciled)  
**Document:** `INTERFACES/INSTINCT_CORTEX_INTERFACE.md`  
**ADR:** `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`

---

## 1. Overview & Advisory Context Principles

The interface between `InstinctSystem` and `Cortex` (cognitive planning organ) enables motivational drives to provide advisory context and non-executable goal proposals to influence planning priorities without granting drives execution, policy, or financial authority.

- `Cortex` **receives** motivation context (`MotivationalContext`) and non-executable goal proposals (`GoalProposal[]`) from `Heart` as injected parameters during the `THINK` phase. `Cortex` does NOT directly query the `InstinctSystem`.
- `Cortex` **weights** candidate planning tasks using drive urgencies and risk classes as advisory inputs.
- `Cortex` **must independently enforce** all existing `Policy`, `Treasury`, `Capability`, `ApprovalGateway`, and `Sandbox` boundaries before any plan is dispatched.

---

## 2. Context Payload & Methods

```typescript
export interface ICortexMotivationalInput {
  /**
   * Read-only motivational context for cognitive planning.
   */
  context: MotivationalContext;

  /**
   * Active, non-executable goal proposals.
   */
  proposals: GoalProposal[];

  /**
   * Callback provided by Heart to acknowledge acceptance or rejection of a goal proposal.
   */
  acknowledgeProposal(proposalId: string, status: "ACCEPTED" | "REJECTED" | "EXPIRED"): void;
}

export interface MotivationalContext {
  dominantDrive: "HUNGER" | "ANXIETY" | "CURIOSITY" | "NONE";
  hungerIntensity: number;
  anxietyIntensity: number;
  curiosityIntensity: number;
  confidence: number;
  evaluationStatus: "VALID" | "DEGRADED" | "UNAVAILABLE";
  suggestedObjectiveClass: ObjectiveClass | null;
  evaluatorVersion: string;
  evidenceHash: string;
}
```

---

## 3. Directionality & Advisory Invariants

- **Read-Only Advisory Context:** Motivation context is purely advisory for priority scoring. Drives possess ZERO authority over execution dispatch, Treasury spending, Vault/signing/broadcast APIs, production mutation/deployment, policy/constitution rewriting, identity governance, or self-approval.
- **Non-Executable Proposals:** All `GoalProposal` structures feature `actionAuthority: false`.
- **Anxiety Context Enforcement:** High Anxiety ($\ge 0.80$) emits high-anxiety motivational context (`anxietyIntensity: number`). `Cortex` applies its own independently enforced planning rules to restrict plan candidates to safe maintenance and validation classes. Drive outputs remain strictly read-only and advisory.
- **Approval Boundary Attachment:** Evaluation, calculation, and non-executable proposal generation require NO approval. Inherited approval requirements (`ApprovalGateway`, human signatures, policy rules) attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.
