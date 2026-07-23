# ADR-008: Gen-2 Drive Subsystem & Heart Boundary Architecture

**Status:** Proposed (Gen-2 Stage 0 Design Review — Reconciled)  
**Date:** 2026-07-23  
**Deciders:** Antigravity (Architect), Codex (Independent Reviewer), Anas (Project Lead)  
**Reconciles:** `ROADMAP.md` (Gen-2 section) & `DECISIONS/ADR-006-Why-No-Instincts-In-Gen1.md`  

### Baseline Provenance & Branching Origin
- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## 1. Context & Attribution of Historical Conflict

In Gen-1 documentation, the future introduction of instincts and drives for Gen-2 was described as follows:
- `ROADMAP.md` (line 28) historically stated: *"Introduction of the Need/Drive matrix in the Heart."*
- `ADR-006` deferred instincts to Gen-2, rejected hardcoded execution scripts, and forecasted that Gen-1's idle behavior would be *"entirely superseded by Gen-2"*.

**Correction & Attribution:**
- `ADR-006` did NOT specify placing the Need/Drive matrix inside `Heart.ts`; that placement originated solely from `ROADMAP.md`.
- `ADR-006`'s core decision — deferring instincts to Gen-2 and prohibiting hardcoded scripts — remains 100% intact.
- `ADR-008` realizes and clarifies `ADR-006`'s Gen-2 intent, superseding only its *"entirely superseded"* forecast sentence.
- The historical placement of the Need/Drive matrix inside `Heart` from `ROADMAP.md` is superseded by this ADR.

---

## 2. Decision & Architecture Boundaries

1. **Heart Ownership Boundary:**
   - `Heart.ts` **does NOT own** drive formulas, need normalization, confidence calculations, arbitration rules, hysteresis, decay, or goal proposal logic.
   - `Heart.ts` **only invokes** the public `InstinctSystem` interface (`evaluate`, `getEvaluationResult`, `persistState`, `recoverState`).

2. **Principal Organ & Internal Enclosure:**
   - Create exactly **one principal top-level organ**: **`InstinctSystem`**.
   - `InstinctSystem` internally encapsulates three private subcomponents: `NeedMonitor`, `DriveEngine`, and `GoalProposalEngine`.
   - `InstinctSystem` owns motivational-state persistence and recovery.

3. **Canonical Authority Restriction Matrix:**
   - Drives have **ZERO authority** over: 1) execution dispatch, 2) Treasury spending/reservation, 3) Vault/signing/broadcast APIs, 4) production mutation/deployment, 5) policy/constitution rewriting, 6) identity governance, 7) self-approval of goals or evolution.

4. **Monotonic Risk Ceiling Rule (Hunger):**
   - Greater Hunger must NEVER permit greater financial risk. As Treasury scarcity increases, permitted risk ceilings, spending limits, and eligible objective classes MUST tighten monotonically.

5. **Approval Pipeline Semantics:**
   - Snapshot evaluation, drive calculation, and non-executable `GoalProposal` generation require **NO approval** (read-only internal cognition).
   - Approval requirements (`ApprovalGateway`, human signatures, policy rules) attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.

6. **Failure, Recovery & Atomicity Semantics:**
   - Upon evaluation failure, `InstinctSystem` emits a structural failure state (with `state.evaluationStatus: "UNAVAILABLE"`, `state.confidence: 0.0`, `state.dominantDrive: "NONE"`, and `proposals: []`) along with error telemetry. `Heart` MUST NOT synthesize a healthy-looking `NONE` state.
   - All persistence operations use single **atomic SQLite transactions**.
   - Corrupt or missing persisted state triggers quarantine and clean boot recovery fallback (`evaluationStatus: "UNAVAILABLE"`).

---

## 3. Consequences

### Positive
- Strict organ encapsulation of drive physiology inside `InstinctSystem`.
- Clean orchestrator boundary for `Heart.ts`.
- 100% deterministic testability and atomic state recovery.

### Negative / Trade-offs
- Additional public interface contract required between `Heart` and `InstinctSystem`.
