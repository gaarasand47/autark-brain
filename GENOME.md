# GENOME

**Status:** `Stable` (Gen-1)

The Genome is the complete genetic blueprint of the organism. It serves as the ultimate source of truth for the organism's identity, generation, and base state. If the entire operational database and working directory were destroyed, a new instance of Autark could be completely reconstructed using only this `GENOME.md`.

## 1. Immutable Identity
- **Species Version:** `Autark-Core`
- **Current Generation:** `Gen-1`
- **Creator Address:** `[Configured at Boot via Environment / IdentityCore]`
- **Profit Share Address:** `[Configured at Boot via Environment / IdentityCore]`
- **Constitution Hash:** `SHA-256(CONSTITUTION.md + LAWS/*)` *(To be dynamically tracked in Gen-2)*

## 2. Biological Organ List
The following organs are mandated to exist in a Gen-1 organism. If any organ is missing or fails to initialize, the organism is genetically unviable and must halt.
- **`Heart`**: Central pulse and execution kernel.
- **`Treasury`**: Ledger, budget, and profit sweep manager.
- **`WorkingMemory`**: Ephemeral scratchpad (flushed per tick).
- **`EpisodicMemory`**: Permanent storage of completed ticks/summaries.
- **`SemanticMemory`**: Evolving rule database with confidence decay.
- **`DreamEngine`**: Offline simulator for testing hypotheses.
- **`ReflectionEngine`**: Analyzes episodes to extract semantic rules.
- **`SkillCompiler`**: Converts probabilistic rules into deterministic code.
- **`EvolutionManager`**: Codebase mutation and rollback generation.
- **`ApprovalGateway`**: Human cryptographic signature verification.

## 3. Core Thresholds & Budgets
These are genetic constants. They may not be mutated by learning.
- **Heart Tick Interval:** Default 60,000ms (1 minute).
- **Profit Sweep Minimum:** 20% of gross revenue.
- **Cognitive Budget Cap:** 20% of available Treasury.
- **Memory Decay Threshold:** 86,400 seconds (24 hours) of disuse triggers a Semantic confidence drop.

## 4. Evolution History & Mutations
- **Base (Gen-0):** Hardcoded deterministic execution loop.
- **Mutation (Gen-1):** Added `DreamEngine` and `ReflectionEngine`. Shifted from direct execution to `WorkingMemory` buffering. Added strict `CognitiveBudget` constraints to limit API burn during learning.

## 5. Lineage & Compatibility
- **Parent Lineage:** None (Root Genesis Organism).
- **Child Lineage:** None currently spawned.

## 6. Additive Gen-4 Contract

Gen-4 adds the bounded OperatorSystem without mutating this historical Gen-1
genome. Constitution, Identity, Treasury, ApprovalGateway, Sandbox, Memory,
and Heart ownership remain unchanged; no wallet, signing, broadcast,
customer, or autonomous mutation authority is introduced.

The current Gen-4 contract is additive only: schema-versioned OperatorIntent
and LifecycleTransition records bind identity, Constitution, capability
snapshot, policy, approval, lease, resource/egress ceilings, replay key,
provenance, and state hashes. Historical Gen-1 constants remain immutable.
- **Backward Compatibility:** Gen-1 is fully capable of reading Gen-0 ledger and episode structures.

---
### Source Files
- `src/core/IdentityCore.ts`
- `src/kernel/Heart.ts` (Organ Initialization)
