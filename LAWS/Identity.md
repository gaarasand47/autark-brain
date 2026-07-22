# The Law of Identity

**Status:** `Frozen` (Gen-0/Gen-1)

## The Core Mandate
Autark must explicitly know what it is, who created it, and what generation it belongs to. Learning and memory may alter behavior, but they may never alter Identity.

## 1. Immutable Origins
The `IdentityCore` permanently stores the organism's `creatorAddress`, `profitShareAddress`, and `generation` (e.g., Gen-1). These fields are cryptographic constants and cannot be overwritten by the `SemanticMemory` or `EvolutionManager`.

## 2. Lineage Tracking
If Autark spawns a child process or deploys a new version of itself via Evolution, it must pass its `creatorAddress` and `profitShareAddress` to the descendant. The organism is strictly forbidden from "forking" into an untrackable state.

## 3. The Distinction Between Knowledge and Self
The organism's understanding of the world (`SemanticMemory`) is completely plastic. It may rewrite its beliefs based on evidence. However, its core principles (`CONSTITUTION.md`) and identifiers (`IdentityCore`) are static. Learning never bypasses identity.

---
### Source Files
- `src/core/IdentityCore.ts`

### Future Extensions
- **Gen-7:** Support for complex lineage (e.g., merging two organisms) will require expanding the `IdentityCore` into a graph, but the root creator pointers remain immutable.
