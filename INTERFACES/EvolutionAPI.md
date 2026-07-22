# Evolution API

**Status:** `Experimental` (Gen-1)

The `EvolutionAPI` defines how the organism mutates its own source code and architecture.

## 1. `proposeMutation(goal: string)`
- **Inputs:** `goal` (e.g., "Optimize WorkingMemory layout").
- **Outputs:** `Promise<string>` (Mutation ID).
- **Side effects:** Spawns a series of `Cortex` calls to generate code, followed by `DreamEngine` calls to test the code. If successful, creates a `RollbackPackage`.
- **Failure conditions:** Fails if the `DreamEngine` simulation fails. Fails if `CognitiveBudget` is depleted.

## 2. `generateRollbackPackage(mutationId: string)`
- **Inputs:** Valid Mutation ID.
- **Outputs:** `Promise<RollbackPackage>` (Contains git diff, current snapshot, and metadata).
- **Invariants:** Must be generated before `requestApproval` is called.

## 3. `requestApproval(package: RollbackPackage)`
- **Outputs:** `Promise<boolean>`.
- **Side effects:** Halts the Evolution pipeline. Sends a message via `ApprovalGateway` to the Human Creator.
- **Guarantees:** The process blocks until a cryptographic signature is received.

## 4. `applyMutation(package: RollbackPackage, signature: string)`
- **Outputs:** `Promise<void>`.
- **Side effects:** Writes the new code to disk. Updates `GENOME.md` if applicable. Triggers a hot-reload or restart of the `Heart`.
- **Failure conditions:** Throws `InvalidSignatureError` if the signature does not match the `creatorAddress` in the `IdentityCore`.
