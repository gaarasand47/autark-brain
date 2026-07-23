# Traceability Matrix

**Status:** `Implementation Complete - Awaiting Codex Verification` (Not frozen)

Every major architectural feature must be traceable through this matrix. If a feature is listed here but cannot be found in the code or design specifications, it is biologically invalid.

## Core Features & Organ Traceability

| Requirement | Organ | Classification | Spec / Source Path | Tests | ADR | Generation | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Cognitive Budget** | Treasury | Top-level Organ | `src/economy/Treasury.ts` | `src/testing/gen1.test.ts` | ADR-002 | Gen-1 | Repair-branch test evidence |
| **Profit Sweep (20%)** | Treasury | Top-level Organ | `src/economy/Ledger.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-0 | Repair-branch test evidence |
| **Dream Simulation** | DreamEngine | Top-level Organ | `src/cognitive/DreamEngine.ts` | No committed matching test | ADR-003 | Gen-1 | UNVERIFIED |
| **Episodic Persistence** | EpisodicMemory | Top-level Organ | `src/memory/EpisodicMemory.ts` | `src/testing/gen1.test.ts` | ADR-004 | Gen-1 | PARTIAL |
| **Semantic Extraction** | SemanticMemory | Top-level Organ | `src/memory/SemanticMemory.ts` | `src/testing/gen1.test.ts` | ADR-005 | Gen-1 | PARTIAL |
| **Code Sandbox** | DeterministicLab | Top-level Organ | `src/execution/Lab.ts` | `src/testing/sandbox.test.ts` | ADR-001 | Gen-1 | Repair-branch test evidence |
| **Human Gateway** | ApprovalGateway | Top-level Organ | `src/evolution/ApprovalGateway.ts` | No committed matching test | ADR-001 | Gen-1 | PARTIAL / fail-closed |
| **Evolution Engine** | EvolutionManager | Top-level Organ | `src/evolution/EvolutionManager.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-1 | PARTIAL / mutation disabled |
| **Instinct System Organ** | InstinctSystem | Principal Top-level Organ | `ORGANS/INSTINCT_SYSTEM.md` *(Target: `src/instincts/InstinctSystem.ts`)* | `src/__tests__/unit/InstinctSystem.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Need Monitor** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/NeedMonitor.ts`)* | `src/__tests__/unit/NeedMonitor.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Drive Engine** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/DriveEngine.ts`)* | `src/__tests__/unit/DriveEngine.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Goal Proposal Engine** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/GoalProposalEngine.ts`)* | `src/__tests__/unit/GoalProposalEngine.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |

---

## Gen-2 Baseline & Branching Traceability

- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---
### Implementation Status
Stage 0 Architecture Reconciliation source code implementation completed. Awaiting Codex Repair Verification.
