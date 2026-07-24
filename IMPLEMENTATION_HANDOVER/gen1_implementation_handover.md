# Gen-1 Implementation Handover

**Target Branch:** `main` (for `v1.1.0-gen1` freeze)

This document is the exact technical specification for the codebase changes required to bring the Autark organism to Gen-1 maturity, satisfying all constraints outlined in the Memory Vault.

## 1. Database Schema Migrations

The SQLite databases must be physically created and structured to support the stratified memory and identity constraints.

### `data/treasury.db`
- **Migration:** Ensure `ledger_entries` table exists with `type`, `amount`, `currency`, `provider`, `reference_id`, `status`, and `timestamp`.

### `data/memory.db`
- **Migration 1:** Create `episodes` table to store completed pulses.
- **Migration 2:** Create `semantic_rules` table to store extracted insights with `confidence_score`.

### `data/identity.db`
- **Migration:** Create `identity_core` table and seed it using `process.env` at boot (generation, creatorAddress, profitShareAddress).

## 2. Core Biological Law Enforcement (The Guardrails)

Before we build the thinking engines, we must build the constraints.

### `src/economy/Treasury.ts`
- **Method `reserveCognitiveBudget(est: number)`:** Must calculate `currentRetainedRevenue * 0.20`. If `est > budget`, return `false`.
- **Method `logRevenue(amount: number, ...)`:** Must immediately dispatch 20% to the sweep queue before adding to the retained pool.

### `src/evolution/ApprovalGateway.ts`
- **Class `ApprovalGateway`:** Create this new file. It must expose `requestApproval(package)`. For Gen-1, this will block execution and log to the console/discord demanding a cryptographic signature from `creatorAddress` before resolving the Promise.

## 3. Stratified Memory Implementation

### `src/memory/WorkingMemory.ts`
- Must be a transient in-memory `Map`. 
- **Method `clear()`:** Must be rigorously enforced in `Heart.ts` `finally` block.

### `src/memory/EpisodicMemory.ts`
- **Method `commitEpisode()`:** Serializes `WorkingMemory` summary into `memory.db`.

### `src/memory/SemanticMemory.ts`
- **Method `injectRule()`:** Writes to `semantic_rules` table.
- **Method `decayRules()`:** Subtracts a configurable decay factor from the `confidence_score` of all rules. 

## 4. The Cognitive Engines

### `src/cognitive/Cortex.ts`
- **Refactor:** Standardize around `infer(prompt, schema)`. Must enforce JSON Schema parsing natively and throw structured errors on failure.
- **Feature:** Must calculate and return `tokenCost` for every single call.

### `src/cognitive/DreamEngine.ts` (New)
- **Class `DreamEngine`:** 
  - Expose `simulate(hypothesis, scenario)`.
  - Must spin up a Node.js `vm` or `worker_thread` with blocked requires (`fs`, `net`).
  - Must enforce a strict 5000ms timeout.

### `src/cognitive/ReflectionEngine.ts` (New)
- **Class `ReflectionEngine`:**
  - Expose `reflect()`.
  - Pulls the last 5 `EpisodicMemory` records.
  - Calls `Cortex.infer()` to extract rules.
  - Calls `SemanticMemory.injectRule()` with the episode IDs as evidence.

## 5. Kernel Orchestration

### `src/kernel/Heart.ts`
- **Refactor `tick()`:** Must strictly enforce the sequence: `WAKE` -> `THINK` -> `EXECUTE` -> `SLEEP`.
- **Integration:** During `SLEEP`, the Heart must check `Treasury.reserveCognitiveBudget()`. If true, it invokes `ReflectionEngine.reflect()` or `DreamEngine.simulate()`. If false, it skips maintenance.
- **Safety:** Wrap the entire cycle in a `try/catch/finally` block that guarantees `WorkingMemory.clear()`.

## 6. Execution Plan
Upon approval of this handover document, the engineer will:
1. Initialize the SQLite DB schemas.
2. Implement the `Treasury` cognitive budget math.
3. Implement `Working/Episodic/Semantic` memory classes.
4. Implement `Cortex` token tracking and strict schema parsing.
5. Implement the `DreamEngine` sandboxing.
6. Wire it all together in `Heart.ts`.
7. Execute the final deep tests and Gen-1 Audit suite.
