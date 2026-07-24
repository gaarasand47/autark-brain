# Gen-2 Architecture Walkthrough

This document outlines the Gen-2 Instinct System implementation created for Autark. The system has been fully implemented and verified via TypeScript compilation (`npm run build`).

## 1. Core Primitives and Schemas (`src/core`)

The foundation of the Gen-2 architecture rests upon strongly typed deterministic primitives and canonical schemas:

- **`clock.ts`**: Provides the `IClock` primitive and virtual `TestClock`.
- **`random.ts`**: Provides the `IRandomSource` primitive and deterministic 32-bit `TestRandomSource` with configurable sequences.
- **`id.ts`**: Provides the `IIdGenerator` primitive and `UlidGenerator` for sortable, unique entity IDs.
- **`instinctTypes.ts`**: Centralizes all canonical Gen-2 types: `MetricStatus`, `NeedKind`, `DriveKind`, `ObjectiveClass`, `NeedSignal`, `DriveState`, `MotivationalState`, `GoalProposal`, and `InstinctEvaluationResult`.

## 2. Instinct System Components (`src/instincts`)

The `InstinctSystem` acts as the single unified organ, bounding three private subcomponents and integrating persistence:

### 2.1 `NeedMonitor` (`needMonitor.ts`)
- Translates `OrganismStateSnapshot` metrics into physiological `NeedSignal` outputs.
- Validates the freshness of metrics (VALID vs. STALE vs. DEGRADED).
- **Hunger**: Mapped from `treasuryBalanceUSD`.
- **Anxiety**: Mapped from `errorRatePercent` and `workloadQueueLength`.
- **Curiosity**: Mapped from `unmappedDomainCount`.
- **Missing Data**: Emits a strongly-typed `DATA_DEFICIENCY` signal when critical metrics are missing.

### 2.2 `DriveArbitrator` (`driveArbitrator.ts`)
- Consumes `NeedSignal` arrays to calculate raw and effective intensities for HUNGER, ANXIETY, and CURIOSITY.
- Establishes overall confidence based on the minimum confidence of any contributing need signal.
- Determines the `dominantDrive` using strict sequence priority: `HUNGER` > `ANXIETY` > `CURIOSITY`.
- Determines the `suggestedObjectiveClass` based on confidence tiers (`VALID` -> Any, `DEGRADED` -> `INTERNAL_READ_ONLY`, `UNAVAILABLE` -> Null).

### 2.3 `GoalProposalGenerator` (`goalProposalGenerator.ts`)
- Maps the dominant drive and active state to non-executable `GoalProposal` structures.
- Enforces the **Monotonic Risk Ceiling Rule**: If Hunger is critically high ($\ge 0.8$), it exclusively proposes safe financial transactions (e.g., Emergency Resource Conservation).
- Applies safety fallbacks if Anxiety is high (System Diagnostics over Mutation).
- Never generates proposals if the evaluation status is `UNAVAILABLE` or the suggested objective class is null.

### 2.4 `InstinctStore` (`instinctStore.ts`)
- Provides atomic SQLite persistence using `better-sqlite3`.
- Writes the `MotivationalState` singleton and active `GoalProposal` array in a single transaction.
- Includes version checking (`CURRENT_EVALUATOR_VERSION`) upon recovery to prevent corruption from schema changes.

### 2.5 `InstinctEngine` (`instinctEngine.ts`)
- The primary orchestrator of the instinct subsystems.
- Exposes `evaluate(snapshot)` to calculate instinct state, emitting a resilient structural failure state (`evaluationStatus: 'UNAVAILABLE'`) on exceptions instead of fake empty data.

## 3. Heart Integration (`src/core/heart.ts`)

The `Heart` orchestrator acts as the pipeline between the Instinct System and the Cortex, enforcing the execution boundary:

- **Boot Sequence**: Invokes `InstinctStore.recoverState()` to safely load the previous motivational state and active proposals.
- **Tick Loop**: Invokes `InstinctEngine.evaluate(snapshot)`, logs provenance telemetry, and blindly passes the result to `Cortex.think()`.
- **Proposal Acknowledgement**: Processes simple pass-through notifications when Cortex acknowledges a proposal.
- **Sleep Sequence**: Coordinates state persistence by writing the final `MotivationalState` and active proposals back to the database.

## 4. Verification

The codebase has been verified via the standard build process:
```bash
npm run build
```
All components successfully compiled with `tsc`, confirming tight alignment with TypeScript interfaces and the Gen-2 specification. Codex can now proceed with evaluating the implementation for the RC1 release.
