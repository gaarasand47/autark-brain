# Dependency Audit: Treasury
**Date:** July 23, 2026

### Constraints
**Allowed:** Ledger
**Forbidden:** Heart, DreamEngine, Cortex, LLM Provider

### Forward Dependency Graph
```text
Treasury
├── Ledger ✓
├── clock ✓
├── better-sqlite3 ✓
├── Heart ❌ (NOT FOUND)
├── DreamEngine ❌ (NOT FOUND)
├── Cortex ❌ (NOT FOUND)
└── openai/nim ❌ (NOT FOUND)
```

### Reverse Dependency Graph
*(Who imports Treasury?)*
```text
Treasury
├── Heart ✓
├── RecoveryManager ✓
└── tests ✓
```

### Verdict
**Status:** 🟢 PASS
**Notes:** Clean separation. No logic circuits import Treasury backwards, and Treasury only imports ledger-level files.
