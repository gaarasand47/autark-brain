# Memory API

**Status:** `Stable` (Gen-1)

The Memory API encompasses Working, Episodic, and Semantic memory interfaces.

## 1. Working Memory
### `set(key: string, value: any)`
- **Side effects:** Stores a value in memory for the duration of the current tick.

### `get(key: string)`
- **Outputs:** The value, or `undefined`.

### `clear()`
- **Side effects:** Destroys all current working memory.
- **Invariants:** MUST be called in the `finally` block of `Heart.tick()`.

## 2. Episodic Memory
### `commitEpisode(episode: Partial<MemoryEpisode>)`
- **Inputs:** Summary, execution result, state, and token cost of the tick.
- **Outputs:** `Promise<string>` (The newly generated Episode ID).
- **Side effects:** Appends to the SQLite `episodes` table.
- **Guarantees:** Append-only. No deletion.

### `getRecentEpisodes(limit: number)`
- **Outputs:** `Promise<MemoryEpisode[]>`.

## 3. Semantic Memory
### `injectRule(premise: string, conclusion: string, evidenceId: string)`
- **Outputs:** `Promise<string>` (Rule ID).
- **Side effects:** Adds a new probabilistic rule to the `SemanticMemory` DB with a default confidence score.
- **Invariants:** `evidenceId` must point to a valid Episodic record.

### `queryRelevantRules(context: string)`
- **Outputs:** `Promise<SemanticRule[]>`.
- **Side effects:** Uses fast BM25 or embedding search to find rules relevant to the current `THINK` context. Only returns rules where `confidenceScore` > decay threshold.

### `decayRules()`
- **Side effects:** Lowers the `confidenceScore` of all rules not retrieved in the last 24 hours. Called during `SLEEP`.
