# Treasury

## 1. Why this exists & Biological Role
The `Treasury` acts as the organism's digestive and metabolic system. In traditional software, logic executes as long as a server is running. In Autark, execution is constrained by capital (Calories). The Treasury manages the Ledger, enforces the Constitution's economic laws, and ensures the organism does not starve itself through unchecked cognitive consumption.

## 2. Responsibilities & Inputs/Outputs
- **Responsibilities:**
  - Track total revenue, expenses, and current balance.
  - Automatically enforce the immutable 20% Profit Sweep to the Creator.
  - Compute and manage the `CognitiveBudget` (max 20% of revenue).
  - Act as the gatekeeper for any external action that costs money.
- **Inputs:** External revenue events (e.g., successful API usage by clients). Internal requests for Cognitive Budget allocation.
- **Outputs:** Approval or Denial of budget requests. Receipts appended to the Ledger.

## 3. Internal Data Structures & State Transitions
- **Data Structures:** 
  - `LedgerEntry`: `{ id, type, amount, currency, provider, status, timestamp, context }`
- **State Transitions:** 
  - **Revenue Received:** Calculates 20% -> Fires Sweep Event -> Credits 80% to Treasury -> Updates Cognitive Budget.

## 4. Dependency Map
- **Depends On:** 
  - `Ledger` (Database for immutable storage).
  - External blockchain/fiat wallet integrations (Planned for Gen-5).
- **Used By:** 
  - `Heart` (To verify Cognitive Budget before Dreaming).
  - `Execution Sandbox` (To bill external API usage).

## 5. Invariants
- **Never Bypasses Constitution:** The 20% Creator sweep and 20% Cognitive cap are hardcoded mathematical invariants.
- **Never Deletes Ledger:** The `Ledger` is append-only. History cannot be erased by the organism.
- **Always Deterministic:** Budget arithmetic uses strict floating-point handling (or eventually BigNumber) to prevent fractional leaks.

## 6. Performance Budget
- **Time:** Budget queries (`getAvailableCognitiveBudget()`) must be O(1) by utilizing cached dashboard vitals.
- **Memory:** Negligible. 

## 7. Observability
- **Metrics Produced:** `total_revenue`, `total_profit_swept`, `current_cognitive_budget`, `budget_burn_rate`.
- **Logs Produced:** `TREASURY_REVENUE`, `TREASURY_SWEEP`, `TREASURY_BUDGET_RESERVED`, `TREASURY_BUDGET_DENIED`.

## 8. Lifecycle
- **Birth/Init:** Connects to the SQLite Ledger and computes current totals from disk.
- **Normal Operation:** Sits idle until requested for budget or notified of revenue.
- **Failure:** If the database locks or fails, budget requests default to DENY to prevent unbacked spending.
- **Recovery:** Recomputes totals from the immutable Ledger.
- **Shutdown:** Closes database connections cleanly.
- **Persistence:** All state is derived from the SQLite `ledger_entries` table.
- **Restart:** Entire state is perfectly reconstructable from disk.

## 9. Security Boundaries & Economic Cost
- **Security:** The Treasury handles the organism's lifeline. It does NOT hold private keys directly (that is the `Wallet` organ's job). It only manages logical accounting.
- **Economic Cost:** Zero internal cost to run. It tracks the costs of others.

## 10. Technical Debt & Known Limitations
- Floating point math is currently used for accounting. This must be migrated to integer/BigNumber before interacting with real Ethereum wei or Satoshi values.

---
### Implementation Maturity
Stable

### Source Files
- `src/economy/Treasury.ts`
- `src/economy/Ledger.ts`

### Future Extensions
- **Gen-2:** Instinct integration (e.g., if budget is 0 for 5 days, trigger a high-risk exploration Dream).
- **Gen-4:** Capital allocation (using Treasury funds to pay human freelancers or other agents).
