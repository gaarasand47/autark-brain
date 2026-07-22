# Memory Engine

## 1. Why this exists & Biological Role
The `MemoryEngine` is not a simple database. It is a biological stratification system that mirrors how lifeforms process experiences. Raw sensor data is fleeting (`WorkingMemory`), completed actions become experiences (`EpisodicMemory`), and repeated experiences harden into beliefs (`SemanticMemory`). This prevents the organism from drowning in a bloated context window, allowing it to focus on abstract rules rather than parsing raw histories.

## 2. Responsibilities & Inputs/Outputs
- **Responsibilities:**
  - Hold the current pulse's state (`WorkingMemory`).
  - Flush the state into a permanent log at the end of the pulse (`EpisodicMemory`).
  - Store, retrieve, and decay abstract rules based on evidence (`SemanticMemory`).
- **Inputs:** Environmental observations, execution results, LLM rule extractions (via `ReflectionEngine`).
- **Outputs:** Relevant past episodes and semantic rules injected into the `PLAN` context.

## 3. Internal Data Structures & State Transitions
- **Working Memory:** In-memory map (key/value). 
  - *Transition:* Flushed completely on `Heart.SLEEP`.
- **Episodic Memory:** `MemoryEpisode` `{ id, type, timestamp, status, summary, execution_result, metadata, token_cost }`.
  - *Transition:* Appended on `Heart.SLEEP`. Never deleted.
- **Semantic Memory:** `SemanticRule` `{ ruleId, category, premise, conclusion, confidenceScore, decayFactor, lastUsedAt, evidenceEpisodeIds }`.
  - *Transition:* Inserted by Reflection. `confidenceScore` decays based on disuse, or drops sharply on contradiction (Plasticity).

## 4. Dependency Map
- **Depends On:** 
  - `Database` (SQLite for persistence).
- **Used By:** 
  - `Heart` (Flushes Working Memory).
  - `Planner` (Fetches context).
  - `ReflectionEngine` (Reads episodes, writes rules).

## 5. Invariants
- **Working Memory is Ephemeral:** It MUST be cleared at the end of every tick. Persistence of thought across ticks without writing to Episodic Memory is considered a memory leak and a biological bug.
- **Evidence-Based Knowledge:** A Semantic Rule must point to at least one Episodic ID. Knowledge without evidence is rejected.
- **Plasticity:** Semantic confidence must decay if not reinforced. 

## 6. Performance Budget
- **Time:** WorkingMemory is O(1) RAM access. Episodic retrieval is indexed by timestamp (<50ms). Semantic retrieval is indexed by category (<50ms).
- **Memory:** `WorkingMemory` < 10MB. SQLite DB < 1GB (before compaction/archiving strategies are needed).

## 7. Observability
- **Metrics Produced:** `working_memory_keys_count`, `total_episodes`, `total_semantic_rules`, `average_rule_confidence`.
- **Logs Produced:** `MEMORY_EPISODE_SAVED`, `SEMANTIC_RULE_ADDED`, `SEMANTIC_CONFLICT_DETECTED`, `MEMORY_WIPED`.

## 8. Lifecycle
- **Birth/Init:** Connects to the SQLite databases and runs table schemas.
- **Normal Operation:** WorkingMemory scales up and down during a pulse.
- **Failure:** If DB write fails for Episodic, the tick fails and reverts.
- **Recovery:** Semantic rules naturally drop in confidence if bad rules are inserted, eventually being ignored.
- **Shutdown:** Closes DB handles.
- **Persistence:** Episodic and Semantic are strictly synced to disk (WAL mode).
- **Restart:** WorkingMemory starts perfectly blank.

## 9. Security Boundaries & Economic Cost
- **Security:** Memory holds potentially sensitive data. It should not blindly log private keys or API tokens into Episodic Memory.
- **Economic Cost:** Storage costs (local disk) are negligible. Context-window costs (sending memory to LLMs) are high, which is why Semantic Memory abstracts episodes into dense rules.

## 10. Technical Debt & Known Limitations
- The `ReflectionEngine` currently extracts rules via an LLM, which can hallucinate evidence. 
- There is currently no "Forgetting" mechanism for Episodic Memory; it grows infinitely.

---
### Implementation Maturity
Stable (Gen-1)

### Source Files
- `src/memory/WorkingMemory.ts`
- `src/memory/EpisodicMemory.ts`
- `src/memory/SemanticMemory.ts`

### Future Extensions
- **Gen-2:** Compression algorithms to turn old episodes into dense embeddings, reducing disk size.
