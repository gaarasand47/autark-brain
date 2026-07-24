# Evolution Pipeline Flow

**Status:** `Experimental` (Gen-1)

This flow is triggered when the organism identifies a structural bottleneck and proposes a codebase mutation.

```mermaid
sequenceDiagram
    participant EvolutionManager
    participant Cortex
    participant DreamEngine
    participant ApprovalGateway
    participant HumanCreator
    
    EvolutionManager->>Cortex: Generate Code(Goal)
    Cortex-->>EvolutionManager: MutatedCode
    
    EvolutionManager->>DreamEngine: simulate(MutatedCode, TestSuite)
    DreamEngine-->>EvolutionManager: Success
    
    EvolutionManager->>EvolutionManager: generateRollbackPackage(MutatedCode)
    
    EvolutionManager->>ApprovalGateway: requestApproval(RollbackPackage)
    ApprovalGateway-->>HumanCreator: Notify (Email/Discord)
    
    Note over HumanCreator,ApprovalGateway: Human reviews Diff & Reason
    
    HumanCreator->>ApprovalGateway: Cryptographic Signature
    
    ApprovalGateway->>EvolutionManager: applyMutation(Signature)
    EvolutionManager->>EvolutionManager: writeToDisk()
    EvolutionManager->>EvolutionManager: restart()
```

### Traceability
- **Implemented In:** `src/evolution/EvolutionManager.ts` and `src/evolution/ApprovalGateway.ts`.
- **Invariants:** Execution permanently blocks at `requestApproval` until the cryptographic signature is received. A `RollbackPackage` must exist before the request is sent.
