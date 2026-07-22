# ADR-005: Evidence-Based Learning

## Status
Stable (Gen-1)

## Context
As the organism uses LLMs to reflect and generate semantic rules, the LLM has a tendency to hallucinate "good ideas" that sound true but have never been tested in reality.

## Decision
Every `SemanticRule` injected into the database MUST have an `evidenceEpisodeIds` array pointing to the exact `EpisodicMemory` records that justify the rule. If an LLM proposes a rule without an associated episodic ID, the rule is discarded.

## Why
Knowledge without evidence is dogma. If the organism acts on hallucinated dogma, it will inevitably make catastrophic mistakes in production. Tying knowledge strictly to experience grounds the LLM in the organism's actual reality.

## Alternatives Considered
- *Pre-loading Knowledge:* Giving the organism a massive library of Wikipedia data or coding best practices. Rejected because external knowledge isn't tailored to the organism's specific execution environment and bypasses the `DreamEngine` validation.

## Consequences
- The organism starts out very "dumb" because its Semantic Memory is completely blank at Genesis. It must make mistakes in `EpisodicMemory` before it can learn anything.

## Future Mutability
Unlikely to change. Evidence-based learning is a core tenet of the organism's reliability.
