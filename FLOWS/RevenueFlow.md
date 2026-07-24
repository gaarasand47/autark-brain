# Revenue Flow

**Status:** `Stable` (Gen-1)

This flow illustrates the organism's metabolic intake and the strict enforcement of the 20% Creator sweep.

```mermaid
sequenceDiagram
    participant ExternalAPI (Stripe/Crypto)
    participant ExecutionSandbox
    participant Treasury
    participant Ledger
    participant CreatorWallet
    
    ExternalAPI->>ExecutionSandbox: Webhook (Payment Received: $10.00)
    ExecutionSandbox->>Treasury: logRevenue(10.00, 'USD', 'ServiceFee')
    
    activate Treasury
    Treasury->>Treasury: Calculate Sweep (20% of 10.00 = 2.00)
    Treasury->>Treasury: Calculate Retained (80% of 10.00 = 8.00)
    
    Treasury->>CreatorWallet: Transfer(2.00)
    
    Treasury->>Ledger: Append { type: 'revenue', amount: 8.00 }
    Treasury->>Ledger: Append { type: 'sweep', amount: 2.00 }
    
    Treasury->>Treasury: Update CognitiveBudget (+1.60)
    Treasury-->>ExecutionSandbox: Receipt
    deactivate Treasury
```

### Traceability
- **Implemented In:** `src/economy/Treasury.ts`.
- **Invariants:** The 20% sweep is non-negotiable. The `CognitiveBudget` is updated based on the *retained* revenue (20% of the retained 80%, meaning 16% of gross).
