# Dependency Audit: Heart
**Date:** July 23, 2026

### Constraints
**Allowed:** Treasury, Memory, Cortex, CapabilityRegistry
**Forbidden:** Wallet, RPC, LLM Provider, Database internals

### Forward Dependency Graph
```text
Heart
├── Treasury ✓
├── EpisodicMemory ✓
├── SemanticMemory ✓
├── Cortex ✓
├── CapabilityRegistry ✓
├── DreamEngine ✓
├── Governor ✓
├── Ledger ✓
├── Wallet ❌ (NOT FOUND)
├── RPC ❌ (NOT FOUND)
├── viem/ethers ❌ (NOT FOUND)
└── openai/nim ❌ (NOT FOUND)
```

### Reverse Dependency Graph
*(Who imports Heart?)*
```text
Heart
├── index.ts ✓ (Bootstrapper)
├── WorkerLoop.ts ✓ (Scheduler)
└── test_e2e_pipeline.ts ✓ (Test)
```

### Verdict
**Status:** 🟢 PASS
**Notes:** Heart correctly receives Wallet and LLM via dependency injection (`ctx.env.llm`, `ctx.env.vault`) rather than importing them directly. No unauthorized organ imports Heart.
