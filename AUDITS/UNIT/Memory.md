# Unit Audit: Memory (Episodic & Semantic)

**Organ:** Memory
**Path:** `src/memory/MemoryEngine.ts`, `src/memory/EpisodicMemory.ts`, `src/memory/SemanticMemory.ts`
**Date:** July 23, 2026

## 1. Unit Verification Matrix

| Requirement | Expected (File/Method) | Observed Evidence | Status | Risk | Required Action |
|-------------|-------------------------|-------------------|--------|------|-----------------|
| **Database Isolation** | Isolated SQLite File | `EpisodicMemory` and `SemanticMemory` correctly write to `data/memory.db`. | **PASS** | LOW | None. |
| **Working Memory** | Ultra-fast RAM cache | `EpisodicMemory.workingMemory` is an array that is completely volatile and wiped via `clearWorkingMemory`. | **PASS** | LOW | None. |
| **Memory Compaction** | Rotate and prune episodes | `EpisodicMemory.compact` successfully migrates `fresh` -> `recent` -> `archived` -> `forgotten` based on exact UNIX timestamp math. | **PASS** | LOW | None. |
| **Semantic Decay** | Confidence decays over time | `SemanticMemory.applyDecay` correctly reduces `confidence_score` by `decay_factor` if unused for 24h. | **PASS** | LOW | None. |
| **Context Assembly** | `MemoryEngine.retrieveContext` | Lines 10-51 format strings. Vectorization is mocked (`// would vectorize later`). Loads all rules linearly. | **PARTIAL** | MED | Needs actual Vector/RAG implementation to scale beyond a few hundred rules. |
| **Replay Priority** | Sort failures / high profit | `EpisodicMemory.getReplayQueue` correctly orders by `success ASC`, `(revenue-cost) DESC`. | **PASS** | LOW | None. |

## 2. Evolution Compatibility
- **Can Gen-2 extend me?** YES.
- **How?** The architecture cleanly separates `EpisodicMemory` (what happened) from `SemanticMemory` (what we learned). A Vector DB (like Qdrant or Pinecone) could easily replace the current string-based `SemanticMemory` for Gen-2.
- **Breaking Changes?** Moving away from SQLite for episodes would require rewriting `better-sqlite3` synchronous getters to async logic across `Heart` and `DreamEngine`.

## 3. Overall Verdict
The Memory organs strictly enforce database isolation, logical compaction, and priority replay algorithms. The core biological mechanics function correctly. However, `MemoryEngine`'s contextual retrieval is entirely linear (string concatenation) and lacks the required mathematical vectorization needed for true scale.

**Audit Status:** 🟡 PARTIAL (GATE 1 WARNING)
