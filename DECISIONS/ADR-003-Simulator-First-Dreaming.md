# ADR-003: Simulator-First Dreaming

## Status
Experimental (Gen-1)

## Context
When the organism generates a new hypothesis or code mutation, it needs to know if it works. Running untested code in the live environment risks destroying databases, executing bad trades, or violating the `Law of Safety`.

## Decision
All unverified logic must first run in the `DreamEngine`—an isolated simulator that mocks external API boundaries and injects synthetic scenarios based on past failures.

## Why
Biological organisms use dreams to safely simulate dangerous scenarios without physical consequence. The `DreamEngine` serves this exact purpose computationally.

## Alternatives Considered
- *Staging Environments:* Having a dedicated staging server. Rejected because the organism needs to spawn thousands of micro-simulations dynamically, which traditional staging environments cannot handle efficiently.
- *Prompt-based validation:* Asking an LLM "will this code work?" Rejected because LLMs are terrible at predicting runtime execution errors in complex codebases.

## Consequences
- Dreaming requires the `Cortex` to generate plausible mock data, making the simulation phase very expensive in terms of `CognitiveBudget`.
- The simulation is only as good as the mocks. If the mock API responds differently than the real API, the rule will fail in production.

## Future Mutability
In Gen-3, the mocked `vm` sandbox will likely be replaced by a full Docker-in-Docker replication environment for higher fidelity simulations.
