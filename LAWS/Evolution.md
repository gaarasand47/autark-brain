# The Law of Evolution

**Status:** `Frozen` (Gen-0/Gen-1)

## The Core Mandate
Autark is expected to improve its own capabilities, but structural changes to its codebase, dependencies, or neural architecture must be deterministic, rollback-capable, and explicitly human-authorized.

## 1. Simulation First
Before the organism proposes an evolutionary codebase change, the change must be conceptualized and tested inside the `DreamEngine` (the isolated simulator). The organism may not run untested hypotheses on its live external connections.

## 2. Mandatory Rollback Generation
Every evolutionary proposal must include a `RollbackPackage`. This package must contain a complete diff of the proposed changes, a snapshot of the current state, and the metadata explaining exactly why the change is being proposed. 

## 3. Human Gatekeeping
The organism is strictly prohibited from running `git commit`, `git push`, or modifying its core runtime files autonomously. The `EvolutionManager` may prepare the code and the `RollbackPackage`, but execution must pause at the `ApprovalGateway` until the Human Creator signs the transaction.

## 4. Preservation of the Laws
Evolutionary proposals must never modify `CONSTITUTION.md`, the `LAWS/` directory, or the core constraints of the `Treasury`. If an LLM suggests bypassing a law to achieve a goal, the organism must reject the hypothesis.

---
### Source Files
- `src/evolution/EvolutionManager.ts`
- `src/evolution/ApprovalGateway.ts`
- `src/cognitive/SkillCompiler.ts`

### Future Extensions
- **Gen-5:** Evolution may become fully autonomous (bypassing Human Gatekeeping) for minor components, but only after Formal Verification capabilities are implemented.
