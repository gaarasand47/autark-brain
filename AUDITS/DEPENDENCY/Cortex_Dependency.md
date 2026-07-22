# Dependency Audit: Cortex
**Date:** July 23, 2026

### Constraints
**Allowed:** LLM Provider, Memory
**Forbidden:** Wallet, Ledger, ApprovalGateway

### Forward Dependency Graph
```text
Cortex
├── CortexMemory ✓
├── PlanValidator ✓
├── ConstraintCompiler ✓
├── NervousSystem ✓
├── Wallet ❌ (NOT FOUND)
├── Ledger ❌ (NOT FOUND)
└── ApprovalGateway ❌ (NOT FOUND)
```

### Reverse Dependency Graph
*(Who imports Cortex?)*
```text
Cortex
└── Heart ✓
```

### Verdict
**Status:** 🟢 PASS
**Notes:** Pure cognitive engine. Relies strictly on passed interfaces and its internal models. Does not have access to any external mutation systems like Wallet or Ledger.
