# Current Task

- **Objective ID:** `G2-S1-O1`
- **Stage:** Stage 1 — Primitives & Schemas
- **Title:** Implement `IClock` Deterministic Primitive
- **Scope:**
  - Define the canonical `IClock` TypeScript interface (`now(): number`).
  - Implement `SystemClock` (production implementation returning UTC timestamp in milliseconds).
  - Implement `MockClock` / `TestClock` (deterministic controllable clock for unit testing and deterministic replay).
  - Write unit tests verifying `SystemClock` and `TestClock` behavior.
- **Exclusions:**
  - `IRandomSource` (deferred to `G2-S1-O2`).
  - `IIdGenerator` (deferred to `G2-S1-O3`).
  - Organism state snapshots, needs, drives, proposals, or persistence.
