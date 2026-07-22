# Learning Cycle Flow

**Status:** `Stable` (Gen-1)

This flow occurs during `SLEEP` via the `ReflectionEngine`, extracting abstract semantic rules from recent episodes.

```mermaid
sequenceDiagram
    participant Heart
    participant EpisodicMemory
    participant Cortex
    participant SemanticMemory
    
    Heart->>EpisodicMemory: getRecentEpisodes(limit: 5)
    EpisodicMemory-->>Heart: [Ep1, Ep2, Ep3]
    
    Heart->>Cortex: infer(Episodes, RuleExtractionSchema)
    activate Cortex
    Cortex-->>Heart: ExtractedRules
    deactivate Cortex
    
    loop For each ExtractedRule
        Heart->>SemanticMemory: queryRelevantRules(Rule.Premise)
        alt Conflict Found
            Heart->>SemanticMemory: lowerConfidence(ConflictRule)
            Heart->>SemanticMemory: injectRule(NewRule)
        else No Conflict
            Heart->>SemanticMemory: injectRule(NewRule)
        end
    end
```

### Traceability
- **Implemented In:** `src/cognitive/ReflectionEngine.ts`.
- **Invariants:** Rule extraction must always link the new rule to the `episode_id` that justified it (Evidence).
