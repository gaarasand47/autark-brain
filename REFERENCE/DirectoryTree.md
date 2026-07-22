# Directory Tree

**Status:** `Stable` (Gen-1)

The physical layout of the organism's codebase.

```text
autark/
├── src/
│   ├── index.ts                 # Bootstrapper
│   ├── config.ts                # Environment loading
│   ├── types.ts                 # Global TS Interfaces
│   │
│   ├── core/                    # Immutable DNA components
│   │   ├── Constitution.ts
│   │   └── IdentityCore.ts
│   │
│   ├── kernel/                  # The Execution Loop
│   │   └── Heart.ts
│   │
│   ├── economy/                 # The Metabolism
│   │   ├── Treasury.ts
│   │   └── Ledger.ts
│   │
│   ├── memory/                  # Stratified Knowledge
│   │   ├── WorkingMemory.ts
│   │   ├── EpisodicMemory.ts
│   │   └── SemanticMemory.ts
│   │
│   ├── cognitive/               # Thinking & Simulation
│   │   ├── Cortex.ts            # LLM API Wrapper
│   │   ├── InferenceRouter.ts
│   │   ├── DreamEngine.ts
│   │   ├── ReflectionEngine.ts
│   │   └── SkillCompiler.ts
│   │
│   ├── security/                # Protection
│   │   └── Sandbox.ts
│   │
│   ├── evolution/               # Reproduction & Mutation
│   │   ├── EvolutionManager.ts
│   │   └── ApprovalGateway.ts
│   │
│   └── skills/                  # Hardcoded/Compiled Capabilities
│       ├── observe.ts
│       └── ...
│
├── data/                        # Persistent SQLite Files
│   ├── treasury.db
│   ├── memory.db
│   └── identity.db
│
├── package.json
└── tsconfig.json
```
