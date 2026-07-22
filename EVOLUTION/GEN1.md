# Gen-1 (Mind)

**Era:** The Cognitive Awakening

Gen-1 introduced the `MemoryEngine` (Working, Episodic, Semantic), the `DreamEngine`, and the `ReflectionEngine`. It established the biological stratification of knowledge and the concept of offline hypothesis testing.

## What Changed
- **Memory Layers:** Organism no longer reacts blindly. It pulls from `SemanticMemory` before acting, and records the result in `EpisodicMemory`.
- **Cognitive Budget:** A hard 20% limit was placed on internal thinking, preventing the organism from bankrupting itself via infinite loops of self-reflection.
- **The Simulator:** The `DreamEngine` was built so the organism could test new rules in a mocked `vm` sandbox instead of live production.

## What Broke
- Early versions of Semantic Memory grew too fast. The organism extracted contradictory rules from different episodes (e.g., "API is fast" and "API is slow") and got paralyzed.
- The DreamEngine occasionally hallucinated successes because the LLM-generated mock data was too optimistic.

## What Survived
- The `CognitiveBudget` saved the organism from financial ruin multiple times.
- The `WorkingMemory` flush at the end of every `SLEEP` cycle proved vital for keeping the organism sane and preventing context leakage.

## Lessons Learned
- Rules must decay. Knowledge is plastic. If a Semantic Rule isn't reinforced by recent Episodic evidence, it must lose confidence.
- The organism needs internal motivation. It sits idle too often when the external world doesn't poke it.

This led directly to the requirement for **Gen-2 (Instinct)**.
