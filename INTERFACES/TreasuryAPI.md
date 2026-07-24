# Treasury API

**Status:** `Stable` (Gen-1)

The `TreasuryAPI` defines how internal organs request capital and how revenue is logged.

## 1. `logRevenue(amount: number, currency: string, source: string)`
Registers incoming capital.
- **Inputs:** `amount` (float/int), `currency` (e.g., 'USD', 'ETH'), `source` (string description).
- **Outputs:** `Promise<Receipt>`.
- **Side effects:** Appends to the `Ledger`. Automatically calculates and logs the 20% Creator sweep. Increments the `CognitiveBudget`.
- **Failure conditions:** Throws if database is locked.
- **Guarantees:** Ledger appends are atomic. The 20% sweep is mathematically guaranteed before the Treasury balance updates.

## 2. `reserveCognitiveBudget(estimatedCost: number)`
Requested by the `Heart` before invoking `DreamEngine` or `ReflectionEngine`.
- **Inputs:** `estimatedCost` (number).
- **Outputs:** `boolean` (Approved/Denied).
- **Side effects:** If approved, places a temporary lock on that amount to prevent double-spending.
- **Guarantees:** Will strictly return `false` if the `CognitiveBudget` threshold (20% of revenue) is exceeded.

## 3. `commitExpense(amount: number, category: string, referenceId: string)`
Finalizes a budget reservation after an action (like an LLM call) is complete and the true cost is known.
- **Inputs:** `amount`, `category`, `referenceId` (e.g., Episode ID).
- **Outputs:** `Promise<Receipt>`.
- **Side effects:** Deducts from `Treasury` and `CognitiveBudget`. Appends to `Ledger`.
- **Guarantees:** Cannot reduce Treasury below 0. 

## 4. `getBalances()`
Retrieves current economic state.
- **Outputs:** `{ treasuryTotal: number, cognitiveBudgetAvailable: number, sweptTotal: number }`.
- **Guarantees:** O(1) read from cached state.
