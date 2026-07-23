# InstinctSystem Organ Specification

**Status:** Implemented; awaiting independent repair verification  
**Document:** `ORGANS/INSTINCT_SYSTEM.md`  
**ADR:** `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`

---

## 1. Biological Role & Organ Boundary

`InstinctSystem` is the single principal motivational organ of Autark Gen-2. It converts internal organism deficits (Treasury depletion, failure rates, stability) into bounded biological drives (Hunger, Anxiety, Curiosity), producing evidence-backed motivational states and non-executable goal proposals.

`InstinctSystem` encapsulates all Need/Drive physiology behind a unified public interface. `Heart` interacts ONLY with the public `InstinctSystem` interface and does not access internal subcomponents or underlying persistence directly.

---

## 2. Enclosed Internal Subcomponents

1. **`NeedMonitor` (Internal Logic Component):**
   - Validates metrics from an immutable `OrganismStateSnapshot`.
   - Computes `NeedSignal[]` with `MetricStatus` (`VALID` | `STALE` | `DEGRADED` | `UNKNOWN` | `UNAVAILABLE`) and deterministic confidence scores.

2. **`DriveEngine` (Internal Logic Component):**
   - Computes raw and effective intensities for Hunger, Anxiety, and Curiosity.
   - Applies deterministic arbitration rules, hysteresis thresholds, decay rates, and produces `MotivationalState`.

3. **`GoalProposalEngine` (Internal Logic Component):**
   - Translates active drives into non-executable `GoalProposal[]` entries with explicit risk classes, evidence references, deduplication, and expiration.

---

## 3. Public Interface & Ownership

```typescript
export interface IInstinctSystemOrgan {
  evaluate(snapshot: OrganismStateSnapshot): Promise<InstinctEvaluationResult>;
  getEvaluationResult(): InstinctEvaluationResult;
  acknowledgeProposal(proposalId: string, status: "ACCEPTED" | "REJECTED" | "EXPIRED"): void;
  persistState(): Promise<void>;
  recoverState(): Promise<InstinctEvaluationResult>;
}

export interface InstinctEvaluationResult {
  state: MotivationalState;
  proposals: GoalProposal[];
}
```

- **Persistence Ownership:** `InstinctSystem` owns SQLite persistence storage for motivational states and goal proposals. All persistence reads/writes use atomic single-transaction execution.

---

## 4. Canonical Authority Restrictions & Invariants

- **Canonical Zero Authority Matrix:** `InstinctSystem` has ZERO authority over execution dispatch, Treasury spending/reservation, Vault/signing/broadcast APIs, production mutation/deployment, policy/constitution rewriting, identity governance, or self-approval of goals/evolution.
- **Monotonic Risk Ceiling Rule:** Greater Hunger must NEVER permit greater financial risk. As Treasury scarcity increases, permitted risk ceilings and spending limits MUST tighten monotonically.
- **Critical-Hunger Class:** At Hunger intensity `>= 0.80`, the only financial
  proposal class is `FINANCIAL_CONSERVATION` with `LOW` risk. A general
  suggested class may tighten this result but must never replace it with
  `FINANCIAL_TRANSACTION`.
- **Approval Attachment:** Evaluation, calculation, and non-executable proposal generation require NO approval. Approval requirements attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.

---

## 5. Failure, Recovery & Metric Semantics

- **Evaluation Failure:** If `evaluate()` fails or encounters missing critical inputs, `InstinctSystem` emits a structural failure state (with `state.evaluationStatus: "UNAVAILABLE"`, `state.confidence: 0.0`, `state.dominantDrive: "NONE"`, and `proposals: []`) and error telemetry. `Heart` MUST NOT synthesize a healthy-looking `NONE` state.
- **Recovery Fallback:** If persisted state is corrupt, missing, or schema-incompatible, `InstinctSystem` logs a critical recovery event, quarantines corrupt records, and falls back to a clean boot structural failure state (`state.evaluationStatus: "UNAVAILABLE"`, `state.confidence: 0.0`), triggering immediate snapshot re-evaluation.
