# Traceability Matrix

**Status:** `Reconciliation in progress` (Gen-1 repair branch; not frozen)

Every major architectural feature must be traceable through this matrix. If a feature is listed here but cannot be found in the code, it is biologically invalid.

## Core Features

| Requirement | Organ | Code | Tests | ADR | Generation | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Cognitive Budget** | Treasury | `src/economy/Treasury.ts` | `src/testing/gen1.test.ts` | ADR-002 | Gen-1 | Repair-branch test evidence |
| **Profit Sweep (20%)** | Treasury | `src/economy/Ledger.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-0 | Repair-branch test evidence |
| **Dream Simulation** | DreamEngine | `src/cognitive/DreamEngine.ts` | No committed matching test | ADR-003 | Gen-1 | UNVERIFIED |
| **Episodic Persistence** | EpisodicMemory | `src/memory/EpisodicMemory.ts` | `src/testing/gen1.test.ts` | ADR-004 | Gen-1 | PARTIAL |
| **Semantic Extraction** | SemanticMemory | `src/memory/SemanticMemory.ts` | `src/testing/gen1.test.ts` | ADR-005 | Gen-1 | PARTIAL |
| **Code Sandbox** | DeterministicLab | `src/execution/Lab.ts` | `src/testing/sandbox.test.ts` | ADR-001 | Gen-1 | Repair-branch test evidence |
| **Human Gateway** | ApprovalGateway | `src/evolution/ApprovalGateway.ts` | No committed matching test | ADR-001 | Gen-1 | PARTIAL / fail-closed |
| **Evolution Engine** | EvolutionManager | `src/evolution/EvolutionManager.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-1 | PARTIAL / mutation disabled |
| **Instinct Drives** | Heart | `src/kernel/Heart.ts` | TBD | ADR-006 | Gen-2 | Planned |

---
### Implementation Status
Reconciliation in progress; release claims are not supported by this matrix.

### Implementation Maturity
Not frozen; repair-branch evidence only.

### Source Files
- This repository (`autark-brain`).

### Future Extensions
- **Gen-2:** Expand matrix to cover Instincts and predictive modeling.
