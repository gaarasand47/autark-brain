# Current Task

- **Objective ID:** `G2-S1-O2`
- **Stage:** Stage 1 — Primitives & Schemas
- **Title:** Implement `IRandomSource` Deterministic Primitive
- **Scope:**
  - Define canonical `IRandomSource` TypeScript interface (`random(): number` returning [0, 1)).
  - Implement `MathRandomSource` (production implementation delegating to `Math.random()`).
  - Implement `TestRandomSource` (deterministic seedable PRNG primitive with seed initialization, sequence generation, state inspection, and fixed-sequence feeds for unit testing and deterministic replay).
  - Write unit tests in `src/__tests__/unit/random.test.ts` verifying `MathRandomSource` and `TestRandomSource`.
- **Exclusions:**
  - `IIdGenerator` (deferred to `G2-S1-O3`).
  - `OrganismStateSnapshot`, `NeedSignal`, `DriveState`, `MotivationalState`, or `GoalProposal` schemas.
  - Organism state snapshots, needs, drives, proposals, or persistence.
