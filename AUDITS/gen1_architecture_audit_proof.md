# Gen-1 Architecture Audit Proof

**Date:** July 22, 2026
**Target Codebase:** `d:\nemoclaw_custom_backup\src`

---

## 1. Physical Database Separation

**Requirement:**
The SQLite databases must be physically created and separated into `treasury.db`, `memory.db`, and `identity.db`.

**Expected implementation:**
```
data/treasury.db
data/memory.db
data/identity.db
```

**Files searched:**
`d:\nemoclaw_custom_backup\data` directory.

**Evidence found:**
None.

**Evidence missing:**
The directory `d:\nemoclaw_custom_backup\data` does not exist on disk.

**Status:**
FAIL

**Exact code snippets or line numbers:**
Directory listing throws `PathNotFound`.

---

## 2. Working Memory Lifecycle

**Requirement:**
Working Memory must be cleared at the end of every biological cycle in the `Heart`.

**Expected implementation:**
A `try/catch/finally` block in `src/kernel/Heart.ts` that invokes the clear method of Working Memory.

**Files searched:**
- `src/kernel/Heart.ts`
- `src/memory/EpisodicMemory.ts`

**Evidence found:**
Working Memory is implemented as an array inside `EpisodicMemory.ts`. It has a clear method.
```typescript
// src/memory/EpisodicMemory.ts line 134:
public clearWorkingMemory(): void {
  this.workingMemory = [];
}
```

**Evidence missing:**
There is no invocation of `clearWorkingMemory()` anywhere in `src/kernel/Heart.ts`.

**Status:**
FAIL

**Exact code snippets or line numbers:**
No matching output for `Select-String -Pattern "clearWorkingMemory"` in `Heart.ts`.

---

## 3. Simulator-First Dreaming Sandbox

**Requirement:**
The DreamEngine must spin up a secure Node.js `vm` or `worker_thread` with a strict 5000ms timeout for untrusted logic.

**Expected implementation:**
`import * as vm from 'vm'` or `import { Worker } from 'worker_threads'` and a timeout parameter in `src/cognitive/DreamEngine.ts`.

**Files searched:**
`src/cognitive/DreamEngine.ts`

**Evidence found:**
The file executes logic, but explicitly mocks the simulation rather than executing code.
```typescript
// src/cognitive/DreamEngine.ts line 48:
// Simulator-First: Instead of a raw LLM prompt, we create an offline Sandbox simulation.
// We mock the Simulator here to represent the transition away from raw LLM dreaming.
const simulatorLog = `[SIMULATOR] Offline environment spun up for: ${item.question}`;
```

**Evidence missing:**
No imports or invocations of `vm`, `worker_thread`, or `setTimeout/timeout` for execution limits.

**Status:**
FAIL

**Exact code snippets or line numbers:**
Lines 48-50 in `src/cognitive/DreamEngine.ts`.

---

## 4. Cryptographic Human Gateway

**Requirement:**
The `ApprovalGateway` must halt execution and require a valid cryptographic signature matching the `AUTARK_CREATOR_ADDRESS`.

**Expected implementation:**
A blocking execution pause awaiting a signature, and a validation step against a real payload hash.

**Files searched:**
`src/evolution/ApprovalGateway.ts`

**Evidence found:**
The class exists and verifies a signature, but hardcodes a mock string bypass.
```typescript
// src/evolution/ApprovalGateway.ts line 42:
// 2. Cryptographic signature check (mocked for Gen-1)
if (signature === `mock_sig_${hash}`) {
  logger.info('APPROVAL_GATEWAY', 'Signature verified. Human approval granted.');
  return true;
}
```

**Evidence missing:**
There is no mechanism halting the `Heart` loop to await external signature input. It executes synchronously using the mocked string.

**Status:**
FAIL

**Exact code snippets or line numbers:**
Line 42 in `src/evolution/ApprovalGateway.ts`.

---

## 5. Revenue Sweep Rule

**Requirement:**
The Treasury must immediately dispatch 20% to the sweep queue before adding to the retained pool upon `logRevenue`.

**Expected implementation:**
A method `logRevenue` or `saveReceipt` in `Treasury.ts` or `Ledger.ts` that calculates `amount * 0.20` and moves it to a separate sweep ledger.

**Files searched:**
`src/economy/Treasury.ts`
`src/economy/Ledger.ts`

**Evidence found:**
`Heart.ts` logs revenue directly into the ledger as a full amount.
```typescript
// src/kernel/Heart.ts line 266:
ctx.env.ledger.saveReceipt({
  type: 'REVENUE',
  amount: profit,
  currency: 'USD',
  // ...
```

**Evidence missing:**
There is no logic in `Treasury.ts` or `Ledger.ts` intercepting `REVENUE` to siphon 20% into a sweep state.

**Status:**
FAIL

**Exact code snippets or line numbers:**
Line 266 in `src/kernel/Heart.ts` (Settle state).

---

## Final Conclusion
While the architectural directories and class shells exist in `nemoclaw_custom_backup`, **0 out of 5** core Gen-1 invariants are mechanically enforced by the codebase. Gen-1 execution testing cannot begin until these 5 failures are corrected in the source code.
