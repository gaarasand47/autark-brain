# Dependency Audit: DreamEngine
**Date:** July 23, 2026

### Constraints
**Allowed:** Memory, Simulator, Cognitive Budget
**Forbidden:** Wallet, RPC, Network, OS shell, filesystem writes

### Forward Dependency Graph
```text
DreamEngine
├── EpisodicMemory ✓
├── SemanticMemory ✓
├── CuriosityQueue ✓
├── vm (Node.js isolated sandbox) ✓
├── Wallet ❌ (NOT FOUND)
├── RPC ❌ (NOT FOUND)
├── child_process ❌ (NOT FOUND)
└── fs ❌ (NOT FOUND)
```

### Reverse Dependency Graph
*(Who imports DreamEngine?)*
```text
DreamEngine
└── Heart ✓
```

### Verdict
**Status:** 🟢 PASS
**Notes:** DreamEngine operates in total isolation, manipulating memories through standard interfaces and executing hypotheses inside a `vm` sandbox without network or fs access.
