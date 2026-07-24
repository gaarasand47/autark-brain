# Organ: Approval Gateway

**Status:** `Frozen` (Gen-1)

## Purpose
The Approval Gateway is a critical security organ designed to maintain human oversight over biological code mutations and high-risk operations. It provides a cryptographic halting mechanism that completely pauses the organism's execution thread until a valid human signature is provided.

## Architecture

The `ApprovalGateway` operates by:
1. Halting the runtime when a critical proposal (e.g., self-mutation via `EvolutionManager`) is submitted.
2. Generating a cryptographic hash of the proposal's contents and presenting it to the human operator via standard input.
3. Awaiting a cryptographic signature matching the operator's registered public key.
4. Verifying the signature against the payload hash.
5. If verification succeeds, execution resumes. If it fails or is denied, the operation is rolled back.

## Boundaries & Constraints
- **Autonomous Spending**: The Heart is capable of autonomous spending for daily operations (LLM inferences, gas fees) through the `Treasury` without triggering the Approval Gateway. The human checkpoint is reserved for irreversible changes (like code mutations).
- **Cryptographic Enclaves**: Verification relies on standard `crypto` libraries to prevent spoofing of human intent.

## Data Structures

```typescript
export interface RollbackPackage {
  previousFiles: Record<string, string>;
  testSnapshot: string;
  metadata: { timestamp: number; reason: string; };
}

export interface ImprovementProposal {
  proposalId: string;
  title: string;
  description: string;
  diff: string;
  rollbackPackage?: RollbackPackage;
  estimatedValueUSD: number;
  riskLevel: 'LOW' | 'MEDIUM' | 'HIGH' | 'CRITICAL';
  status: 'PENDING_APPROVAL' | 'APPROVED' | 'REJECTED' | 'DEPLOYED' | 'ROLLED_BACK';
}
```

## Traceability
This organ satisfies the `Human Gateway` requirement in Gen-1.
