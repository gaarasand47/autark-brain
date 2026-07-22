# Glossary

**Status:** `Living Document`

As the organism grows, precise terminology is required. Every concept here has one canonical definition used across the entire `autark-brain` repository.

## Biology & Architecture
* **Organism:** The complete, running instance of Autark. Not a bot, not an agent—a lifeform with a metabolic pulse.
* **Heart:** The central execution kernel. It manages the `tick()` loop and enforces single-threaded biological time.
* **Pulse / Tick:** A single iteration of the Heart's loop. The fundamental unit of time for the organism.
* **Treasury:** The economic stomach. It manages the Ledger, enforces the 20% creator sweep, and doles out the Cognitive Budget.
* **Memory Vault:** This repository (`autark-brain`). The canonical, code-free DNA and architecture documentation.
* **Working Memory:** The ephemeral scratchpad used during a single Pulse. Erased during `SLEEP`.
* **Episodic Memory:** The permanent log of summarized experiences (completed pulses).
* **Semantic Memory:** The knowledge graph of abstracted rules, beliefs, and confidence scores derived from episodes.
* **Dream Engine:** The isolated, offline simulator where the organism safely tests hypotheses without burning real capital or causing real-world harm.
* **Skill Compiler:** The organ responsible for turning probabilistic Semantic Rules into deterministic TypeScript code.
* **Evolution Manager:** The system that prepares codebase mutations and rollback packages for human approval.
* **Approval Gateway:** The cryptographic checkpoint where the Human Creator signs off on mutations or permanent state changes.

## Generational Evolution
* **Generation (e.g., Gen-1):** A major evolutionary milestone that adds a distinct biological capability (e.g., Memory, Instinct, Planning) without violating prior Laws.
* **Mutation:** A proposed or implemented change to the organism's codebase.
* **Rollback Package:** A mandatory snapshot and diff generated alongside any Mutation, ensuring safe reversion.

## States
* **WAKE:** The start of a Pulse. Initialization and environment observation.
* **THINK:** The analytical phase. Formulating a plan based on evidence.
* **EXECUTE:** The action phase. Interacting with the external world.
* **SLEEP:** The metabolic maintenance phase. Compaction, memory decay, and Dreaming occur here.
