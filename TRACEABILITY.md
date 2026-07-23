# Traceability Matrix

**Status:** `Frozen` (Gen-1)

Every major architectural feature must be traceable through this matrix. If a feature is listed here but cannot be found in the code, it is biologically invalid.

## Core Features

| Requirement | Organ | Code | Tests | ADR | Generation | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Cognitive Budget** | Treasury | `src/economy/Treasury.ts` | `src/testing/gen1.test.ts` | ADR-002 | Gen-1 | Implemented |
| **Profit Sweep (20%)** | Treasury | `src/economy/Treasury.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-0 | Implemented |
| **Dream Simulation** | DreamEngine | `src/cognitive/DreamEngine.ts` | `src/testing/dream.test.ts` | ADR-003 | Gen-1 | Implemented |
| **Episodic Persistence** | MemoryEngine | `src/memory/EpisodicMemory.ts` | `src/testing/memory.test.ts` | ADR-004 | Gen-1 | Implemented |
| **Semantic Extraction** | ReflectionEngine | `src/cognitive/ReflectionEngine.ts` | `src/testing/reflection.test.ts` | ADR-005 | Gen-1 | Implemented |
| **Code Sandbox** | Sandbox | `src/security/Sandbox.ts` | `src/testing/sandbox.test.ts` | ADR-001 | Gen-1 | Implemented |
| **Human Gateway** | ApprovalGateway | `src/evolution/ApprovalGateway.ts` | `src/testing/evolution.test.ts` | ADR-001 | Gen-1 | Implemented |
| **Evolution Engine** | EvolutionManager | `src/evolution/EvolutionManager.ts` | `src/testing/evolution.test.ts` | ADR-001 | Gen-1 | Implemented |
| **Instinct Drives** | Heart | `src/kernel/Heart.ts` | TBD | ADR-006 | Gen-2 | Planned |

---
### Implementation Status
Implemented

### Implementation Maturity
Frozen

### Source Files
- This repository (`autark-brain`).

### Future Extensions
- **Gen-2:** Expand matrix to cover Instincts and predictive modeling.
