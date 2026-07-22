# Unit Audit: Heart.ts

**Organ:** Heart (Biological Kernel)
**Path:** `src/kernel/Heart.ts`
**Date:** July 23, 2026

## 1. Unit Verification Matrix

| Requirement | Expected (File/Method) | Observed Evidence | Status | Risk | Required Action |
|-------------|-------------------------|-------------------|--------|------|-----------------|
| **Biological Execution Loop** | `runHeart(context)` must not stall | `runHeart` successfully handles `OBSERVE`, `THINK`, `AUTHORIZE`, `GENERATE`, `ARTIFACT`, `SANDBOX`, `EXECUTE`, `SETTLE`, and `SLEEP` states sequentially. | **PASS** | LOW | None. |
| **Working Memory Amnesia** | `try/finally` wrapped around execution pulse | `finally { episodicMemory.clearWorkingMemory(); }` at lines 401-403 | **PASS** | LOW | None. |
| **Invariant Checking** | `InvariantChecker.verifyStateTransition` | Block exists at line 65 inside `try/catch`. Correctly enters SLEEP on panic. | **PASS** | LOW | None. |
| **Cognitive Budget Auth** | `treasury.reserveCognitiveBudget` | `SLEEP` state line 352 physically checks budget before Dreaming. | **PASS** | LOW | None. |
| **Profit Accounting** | Track revenue and expenses | Receipts are correctly saved to `ctx.env.ledger.saveReceipt`. Actual `expectedRevenue` from the current goal is now passed to the Ledger, fulfilling the invariant. | **PASS** | LOW | None. |
| **Reflection Engine** | Reflection triggered in `SLEEP` state | Semantic rules are successfully extracted from failure episodes via `semanticMemory.storeRule` during SLEEP. | **PASS** | LOW | None. |
| **Database Checkpoint** | WAL Checkpoint limit | Lines 368-389 correctly manage SQLite WAL rotation if >10MB. | **PASS** | LOW | None. |

## 2. Evolution Compatibility
- **Can Gen-2 extend me?** YES.
- **How?** The `OrganismState` enum can be expanded. The loop naturally continues injecting new states without breaking the `try/finally` memory wipes.
- **Breaking Changes?** If the state machine becomes distributed across multiple nodes, the synchronous `runHeart` pulse would need to become an asynchronous event router.

## 3. Overall Verdict
The Heart effectively orchestrates the biological pulse and enforces all core invariants (Memory Amnesia, Cognitive Budget, State Integrity, and Semantic Reflection).

**Audit Status:** 🟢 PASS
