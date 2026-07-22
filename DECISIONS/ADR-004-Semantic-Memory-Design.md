# ADR-004: Semantic Memory Design

## Status
Stable (Gen-1)

## Context
When the organism encounters a new situation, it needs context. If we shove every past interaction into a vector database, the context window fills with redundant, contradictory, and useless historical logs, drastically increasing token costs and decreasing reasoning quality.

## Decision
We stratify memory. `WorkingMemory` holds the current pulse. `EpisodicMemory` holds the permanent log. `SemanticMemory` extracts abstract, probabilistic rules (e.g., "API X fails on weekends") from episodes and ranks them with a `confidenceScore`.

## Why
Semantic rules are dense. They provide the "lesson" without the baggage of the raw experience. This keeps the prompt context small and highly relevant.

## Alternatives Considered
- *Raw RAG (Retrieval-Augmented Generation):* Storing all text logs in a vector DB and retrieving the top 5 nearest neighbors. Rejected because raw logs do not contain explicit "lessons", forcing the LLM to deduce the lesson from the raw log every single time, wasting compute.

## Consequences
- Requires the `ReflectionEngine` to constantly run during `SLEEP` to convert new episodes into semantic rules.
- Semantic rules can become outdated if the external world changes (e.g., the API fixes its weekend bug).

## Future Mutability
We will likely introduce clustering algorithms in Gen-4 to merge highly similar semantic rules into singular, generalized meta-rules.
