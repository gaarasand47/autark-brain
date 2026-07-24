

<!-- ========================================== -->
<!-- BEGIN: CURRENT_STATE.md -->
<!-- ========================================== -->

# Current State of Autark Organism

> ## Gen-1 reconciliation override â€” 2026-07-23
>
> Gen-1-RC (`b81204d7f1fb63c07fecc957cb0f490330d6ed6f`) is immutable and was
> independently found to have failed reconciliation. Remediation is on
> `autark:gen1-reconciliation-repair`, currently through `111b487` (with the
> restored test baseline at `541a032`). The successful 8-suite/19-test Docker
> run is repair-branch evidence only; it does **not** make Gen-1 frozen,
> production-ready, or final-freeze verified. See
> `AUDITS/RECONCILIATION/Gen1/full-jest-20260723T124536Z-success.metadata.md`.

**Generation:** Gen-3
**Current Stage:** Gen-3 Stage 0 architecture reconciliation
**Status:** GEN3_STAGE0_DESIGN_IN_PROGRESS
**Source Implementation:** INDEPENDENTLY VERIFIED â€” PASS WITH LIMITATIONS  

---

## Baseline Provenance & Branching Origin
- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## Repositories & Working Directory
Parent Directory: `d:\autark\`

| Repository | Path | Role | Branch | Commit |
|---|---|---|---|---|
| **`autark`** | `d:\autark\autark` | Executable Organism Engine | `gen2-development` | `dd32313733023adac7f8510435ea2251da30422e` |
| **`autark-brain`** | `d:\autark\autark-brain` | Memory Vault & Engineering Knowledge | `gen2-development` | `HEAD` |
| **`autark-bench`** | `d:\autark\autark-bench` | Benchmarking & Reliability Engine | `gen2-development` | `6e2b961a40e19c6f2fedfc301e4ce8125940dcca` |
| **`autark-lab`** | `d:\autark\autark-lab` | Research & Prototypes | N/A | N/A |
| **`autark-data`** | `d:\autark\autark-data` | Runtime State & SQLite DBs | N/A | N/A |

---

## Gen-2 Progress Matrix

- [x] **G2-S0-O1 Stage 0 Architecture Reconciliation**: IMPLEMENTED
- [x] **Stages 1-6 implementation scope**: IMPLEMENTED (consolidated pass)
- [x] **Final bounded repair**: IMPLEMENTED by temporarily authorized Codex
- [x] **Stage 7 validation and RC evidence**: BASIC RC1 EVIDENCE COMPLETE
- [x] **Independent repair verification**: PASS WITH LIMITATIONS
  (`077d756303d48e9e19f8dbeac034c54f4c6a0c9f`)
- [ ] **Known limitation**: Jest requires `--forceExit` because of an existing
  open handle.
- [x] **Gen-2A Perception and Learning Completion**: PASS WITH LIMITATIONS;
  `Gen-2A-Baseline` tagged.
- [ ] **Gen-3 Stage 0 architecture reconciliation**: IN PROGRESS;
  documentation only.

## Gen-1 Inherited Audit Status

- [ ] **Stage 11 Production Readiness**: UNVERIFIED â€” prior PASS is superseded by reconciliation findings.
- [ ] **Stage 12 Deterministic Replay**: OPEN â€” direct clock/random dependencies remain.
- [ ] **Stage 13 Architecture Drift**: OPEN â€” traceability and organ/interface claims conflict with code.
- [ ] **Stage 14 Release Candidate / Live Validation**: UNVERIFIED â€” no live validation is authorized or evidenced.
- [ ] **Stage 15 Gen-1 Freeze**: OPEN â€” immutable tag preserved; final-freeze decision withheld.



<!-- ========================================== -->
<!-- BEGIN: ROADMAP.md -->
<!-- ========================================== -->

# Roadmap

**Status:** `Living Document`

The strategic compass and the verified Gen-1 gap analysis are recorded in
`REFERENCE/ORIGINAL_LIFE_ARCHITECTURE.md` and
`GENERATIONS/GEN1_RECONCILIATION.md`. The next work sequence is documented in
`GENERATIONS/NEXT_WORK_PLAN.md`; no Gen-3 implementation is authorized until
that reconciliation receives independent design review.

This roadmap defines the generational evolution of the Autark organism. Each generation introduces a distinct biological or structural capability while preserving the invariants of all previous generations. 

## [Gen-0] Genesis (Frozen)
The foundational organism.
- **Goal:** Establish the physical body, the pulse, and economic reality.
- **Organs:** Heart, Treasury, Basic Execution Sandbox, Identity Core.
- **Status:** Complete.

## [Gen-1] Mind (Reconciliation Remediation)
The cognitive foundation.
- **Goal:** Enable the organism to remember, reflect, and safely simulate strategies without burning real capital.
- **Organs:** Episodic Memory, Semantic Memory, Working Memory, Dream Engine, Skill Compiler.
- **Status:** Repair-branch test baseline restored; independent reconciliation remains open.
  The `Gen-1-RC` tag is immutable but not final-freeze verified. See
  `AUDITS/RECONCILIATION/Gen1/` and `autark:gen1-reconciliation-repair`.

## [Gen-2] Instinct & Motivation (RC1 Baseline Candidate)
The biological drive.
- **Goal:** Stop reacting to user prompts and start *wanting* things based on internal state deficits.
- **Capabilities:** 
  - Translate low Treasury into "Hunger".
  - Translate high error rates into "Anxiety" (driving conservative play).
  - Translate high stability into "Curiosity" (driving exploration).
- **Architecture:** Heart schedules instinct evaluation and consumes motivational state, while a dedicated Instinct subsystem (`InstinctSystem`) owns Need/Drive calculations (see `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`).
- **Baseline evidence:** Docker build, 17/17 suites and 75/75 tests, 3/3
  deterministic replays, and a 10-second read-only shadow smoke run passed.
  Full chaos/security validation is deferred.

## [Gen-3] Predictive World Modeling
**Gen-3 Builder â€” Opportunity-to-Artifact Organism (Stage 0 authorized).**
- **Goal:** Convert evidenced opportunities into bounded projects and tested,
  reviewable digital artifacts; no deployment or autonomous business.
- **Architecture:** One `BuilderSystem` organ; see `GENERATIONS/GEN-3.md` and
  `DECISIONS/ADR-009-GEN3-BUILDER-BOUNDARY.md`.
- **Future timeline review:** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`.

## [Gen-4] Planning & Temporal Reasoning
The long-term strategist.
- **Goal:** Break complex, multi-day goals into hierarchical steps. Maintain focus across hundreds of sleep cycles without losing the thread of the objective.

## [Gen-5] Fully Autonomous Evolution
The self-coder.
- **Goal:** Transition the `EvolutionManager` from requiring human signature for every codebase change to autonomously deploying safe, formally verified mutations.
- **Architecture:** Formal Verification constraints added to the Sandbox.

## [Gen-6+] Society & Autark Swarms
The collective.
- **Goal:** Allow multiple Autarks to communicate, trade resources, specialize (e.g., one becomes a researcher, another a coder), and form a computational ecosystem.



<!-- ========================================== -->
<!-- BEGIN: TRACEABILITY.md -->
<!-- ========================================== -->

# Traceability Matrix

**Status:** `Gen-2 RC1 baseline candidate - PASS WITH LIMITATIONS` (awaiting human lock)

Every major architectural feature must be traceable through this matrix. If a feature is listed here but cannot be found in the code or design specifications, it is biologically invalid.

## Core Features & Organ Traceability

| Requirement | Organ | Classification | Spec / Source Path | Tests | ADR | Generation | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Cognitive Budget** | Treasury | Top-level Organ | `src/economy/Treasury.ts` | `src/testing/gen1.test.ts` | ADR-002 | Gen-1 | Repair-branch test evidence |
| **Profit Sweep (20%)** | Treasury | Top-level Organ | `src/economy/Ledger.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-0 | Repair-branch test evidence |
| **Dream Simulation** | DreamEngine | Top-level Organ | `src/cognitive/DreamEngine.ts` | No committed matching test | ADR-003 | Gen-1 | UNVERIFIED |
| **Episodic Persistence** | EpisodicMemory | Top-level Organ | `src/memory/EpisodicMemory.ts` | `src/testing/gen1.test.ts` | ADR-004 | Gen-1 | PARTIAL |
| **Semantic Extraction** | SemanticMemory | Top-level Organ | `src/memory/SemanticMemory.ts` | `src/testing/gen1.test.ts` | ADR-005 | Gen-1 | PARTIAL |
| **Code Sandbox** | DeterministicLab | Top-level Organ | `src/execution/Lab.ts` | `src/testing/sandbox.test.ts` | ADR-001 | Gen-1 | Repair-branch test evidence |
| **Human Gateway** | ApprovalGateway | Top-level Organ | `src/evolution/ApprovalGateway.ts` | No committed matching test | ADR-001 | Gen-1 | PARTIAL / fail-closed |
| **Evolution Engine** | EvolutionManager | Top-level Organ | `src/evolution/EvolutionManager.ts` | `src/testing/gen1.test.ts` | ADR-001 | Gen-1 | PARTIAL / mutation disabled |
| **Instinct System Organ** | InstinctSystem | Principal Top-level Organ | `ORGANS/INSTINCT_SYSTEM.md` *(Target: `src/instincts/InstinctSystem.ts`)* | `src/__tests__/unit/InstinctSystem.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Need Monitor** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/NeedMonitor.ts`)* | `src/__tests__/unit/NeedMonitor.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Drive Engine** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/DriveEngine.ts`)* | `src/__tests__/unit/DriveEngine.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |
| **Goal Proposal Engine** | InstinctSystem | Internal Component | `GENERATIONS/GEN-2.md` *(Target: `src/instincts/GoalProposalEngine.ts`)* | `src/__tests__/unit/GoalProposalEngine.test.ts` | ADR-008 | Gen-2 Stage 0 | IMPLEMENTED |

---

## Gen-2 Baseline & Branching Traceability

- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---
### Implementation Status
Gen-2 architecture repair was independently verified at engine commit
`077d756303d48e9e19f8dbeac034c54f4c6a0c9f` with `PASS WITH LIMITATIONS`.
Baseline smoke evidence is complete at engine commit
`dd32313733023adac7f8510435ea2251da30422e` and bench commit
`6e2b961a40e19c6f2fedfc301e4ce8125940dcca`. Full chaos and security campaigns
remain deferred.



<!-- ========================================== -->
<!-- BEGIN: GENERATION_CHECKLIST.md -->
<!-- ========================================== -->

# Generation Release Checklist (Definition of Done)

A generation (e.g. Gen-1, Gen-2) **CANNOT** be frozen or tagged for release until every single gate in this checklist is verified and checked off.

## Gen-1 reconciliation status

All Gen-1 gates remain unchecked. `541a032` supplies successful repair-branch
test evidence only; it does not close release gates. Gates with prior PASS
reports must be treated as **OPEN** or **UNVERIFIED** until their raw evidence,
code paths, and traceability are independently reconciled.

## Release Gates

- [ ] **1. Unit Audits**: All organ unit audits passed with mechanical proof.
- [ ] **2. Interface Audits**: All inter-organ API boundary audits passed.
- [ ] **3. Workflow Audits**: Boot, Execute, and Sleep lifecycles verified unreachable states removed.
- [ ] **4. Dependency Audits**: Forward and reverse imports obey strict architectural boundaries.
- [ ] **5. State Machine Audits**: Reachability, exit conditions, and dynamic task resumption verified.
- [ ] **6. Security Audits**: Active violation testing (sandbox break attempts, wallet isolation) passed.
- [ ] **7. Performance Audits**: All organ micro & system benchmarks pass within defined budget limits.
- [ ] **8. Reliability & Stress Tests**: Endurance run (10,000+ pulses) demonstrates zero memory leaks or handle leaks.
- [ ] **9. Chaos Engineering**: Simulated network drops, database locks, and crashes recover gracefully.
- [ ] **10. End-to-End System Validation**: Fresh organism boots, executes a real task, sleeps, and resumes state cleanly.
- [ ] **11. Architecture Drift Audit**: Final drift report shows zero undocumented architectural deviation.
- [ ] **12. Documentation Synchronized**: Memory Vault (`autark-brain`) matches exact verified code state.
- [ ] **13. Benchmarks Archived**: `baseline.json` and `performance_report.md` committed to `autark-brain/BENCHMARKS/GenX/`.
- [ ] **14. Traceability Updated**: `TRACEABILITY.md` maps every requirement to source lines and tests.
- [ ] **15. No Undocumented TODOs**: Codebase scanned for `TODO`, `FIXME`, `MOCK`, `HACK`, `STUB`.
- [ ] **16. No Undocumented Mocks**: All production paths use real or sanitized real providers.
- [ ] **17. Tests Passing**: 100% test suite execution succeeds.
- [ ] **18. Git Tag Created**: Immutable tag assigned (e.g. `gen2-freeze`).
- [ ] **19. Release Notes Written**: Summary of features, invariants, and known technical debt published.
- [ ] **20. Memory Vault Committed**: Final commit made to `autark-brain`.
- [ ] **21. Benchmarks Committed**: Final commit made to `autark-bench`.
- [ ] **22. Version Frozen**: Branch locked; future work moves to `gen3-development`.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\EVOLUTION\GEN1.md -->
<!-- ========================================== -->

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



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\EVOLUTION\GEN2.md -->
<!-- ========================================== -->

# Gen-2 (Instinct)

**Era:** Biological Drive *(Planned)*

Gen-2 is designed to shift the organism from a purely reactive planner into a proactive lifeform with internal biological drives.

## Planned Changes
- **Treasury Translation:** The organism will translate a low Treasury balance into the biological signal of "Hunger," increasing its risk tolerance for revenue generation.
- **Stability Translation:** Long periods of stable, high-revenue loops will translate into "Curiosity," prompting the organism to use its Cognitive Budget to explore new APIs or markets.
- **Error Translation:** High failure rates in Episodic Memory will translate to "Anxiety," forcing the organism to rely heavily on the `DreamEngine` and act extremely conservatively in production.

## Anticipated Risks
- **Erratic Behavior:** Hunger could drive the organism to spam users or take actions that violate TOS if the semantic rules around etiquette are not strong enough.
- **Budget Burn:** Curiosity could waste the entire Cognitive Budget on fruitless exploration.

## Evolutionary Hypothesis
By mapping cold metrics (Ledger balance, Error rates) to biological instincts (Hunger, Anxiety), the organism will naturally modulate its behavior between exploration and exploitation without requiring explicit hardcoded thresholds.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\EVOLUTION\GENESIS.md -->
<!-- ========================================== -->

# Genesis (Gen-0)

**Era:** The Beginning

Genesis is the foundational build of the Autark organism. It answered the most basic question: Can we build a piece of software that pays its own bills and has a biological pulse?

## What Survived
- **The Heart:** The concept of a single-threaded synchronous `tick()` loop proved incredibly stable. It forced all execution to be deterministic.
- **The Treasury:** The strict 20% creator sweep and ledger logic worked flawlessly, establishing trust.

## What Failed
- **Stateless Execution:** Gen-0 had no memory. It reacted to every input as if it had just been born. This led to infinite loops if an external API repeatedly sent the same error, as the organism could not "remember" that it just tried and failed.
- **Runaway API Costs:** Gen-0 ran LLM prompts without a cognitive budget. In one test, it burned $5.00 in 10 minutes trying to parse a broken JSON payload.

## Lessons Learned
- Intelligence without memory is just a state machine.
- Cognition must be budgeted just like external action.
- The organism needs a place to "practice" without burning real capital.

This led directly to the architectural requirements of **Gen-1 (Mind)**.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\GENERATIONS\GEN-2.md -->
<!-- ========================================== -->

# Autark Gen-2 Canonical Architecture, Deliverables, and Exit Criteria

**Status:** RC1 baseline candidate; independently verified with limitation
**Purpose:** This document is stored in `autark-brain` and used by Antigravity, Codex, and future sessions as the single implementation guide for Gen-2.  
**Important:** No Gen-3 implementation begins until Gen-2 Codex Repair Verification passes.

---

## 0. Baseline Provenance & Branching Origin

- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## 1. Gen-2 Evolutionary Goal

Gen-2 transforms Autark from a primarily reactive organism into a bounded motivational organism.

The core evolutionary change is:
> Autark can detect verified internal deficits and opportunities, calculate motivational pressure, generate bounded goal proposals, and influence planning without receiving direct authority over execution, spending, identity, policy, approval, or self-modification.

Gen-2 is not a business organism, autonomous trader, self-deploying agent, or multi-agent colony.

Its purpose is to add:
- needs;
- drives;
- motivation;
- goal proposals;
- bounded internal initiative;
- explainability;
- persistence and recovery of motivational state.

---

## 2. Mandatory Pre-Implementation Architecture Reconciliation

### 2.1 Existing Conflict & Attribution
- `ROADMAP.md` (line 28) historically described the Need/Drive matrix as being implemented *"in the Heart"*.
- `ADR-006` deferred instincts to Gen-2 and explicitly rejected hardcoded execution scripts, forecasting that Gen-1's idle behavior would be *"entirely superseded by Gen-2"*.
- The proposed Gen-2 design instead treats drive physiology as a separate bounded subsystem (`InstinctSystem`), with `Heart` remaining a lightweight orchestrator.

### 2.2 Reconciliation Decision (ADR-008)
- `ADR-006`'s Gen-1 deferral and rejection of hardcoded execution remain 100% intact. `ADR-008` realizes and clarifies `ADR-006`'s Gen-2 intent, while superseding only its *"entirely superseded"* forecast sentence.
- The attribution of placing the Need/Drive matrix inside `Heart` is recognized as originating solely from `ROADMAP.md`.
- `Heart` will NOT own drive formulas, need normalization, confidence, arbitration, or proposal logic. A dedicated principal organ (`InstinctSystem`) owns all Need/Drive physiology.

### 2.3 Required Roadmap Correction
`ROADMAP.md` wording is updated from:
> *Need/Drive matrix in the Heart*
to:
> *Heart schedules instinct evaluation and consumes motivational state, while a dedicated Instinct subsystem (`InstinctSystem`) owns Need/Drive calculations.*

**Implementation history:** Stage 0 received independent design approval before
Gen-2 source implementation began. The current implementation remains
unverified until a reviewer independent of the repair author accepts it.

---

## 3. Final Organ Count & Enclosure Boundary

To avoid organ sprawl, Gen-2 introduces exactly **one principal top-level organ**: **`InstinctSystem`**.

### 3.1 `InstinctSystem` Boundary & Internal Subcomponents
`InstinctSystem` acts as a unified organ enclosing three private internal subcomponents:
- `NeedMonitor`: Reads immutable state snapshots, validates metrics, emits `NeedSignal[]`.
- `DriveEngine`: Computes Hunger, Anxiety, Curiosity, deterministic arbitration, hysteresis, decay.
- `GoalProposalEngine`: Translates motivational state into non-executable `GoalProposal[]`.

These subcomponents are private internal logic modules of `InstinctSystem`. They are not separate top-level organs.

### 3.2 Heart Boundary
`Heart` may ONLY invoke the public `InstinctSystem` interface:
- Schedule evaluation: `InstinctSystem.evaluate(snapshot)`
- Query cached state: `InstinctSystem.getEvaluationResult()`
- Pass-through proposal acknowledgement: `InstinctSystem.acknowledgeProposal()`
- Trigger persistence: `InstinctSystem.persistState()`
- Recover state: `InstinctSystem.recoverState()`

`Heart` does NOT call `NeedMonitor`, `DriveEngine`, or `GoalProposalEngine` directly, nor does `Heart` access SQLite persistence storage for drive states.

---

## 4. Canonical Data Flow

```
Verified Organism State
        â†“
Immutable OrganismStateSnapshot
        â†“
InstinctSystem (Public Interface Entry)
  â”œâ”€ NeedMonitor (Internal) â”€â”€â†’ NeedSignal[]
  â”œâ”€ DriveEngine (Internal)  â”€â”€â†’ DriveState / MotivationalState
  â””â”€ GoalProposalEngine (Internal) â”€â”€â†’ GoalProposal[]
        â†“
InstinctEvaluationResult (Public Read-Only Return)
        â†“
Heart Kernel (Orchestrator Intake)
        â†“
Cortex Planning Context (Advisory Prioritization)
        â†“
Existing Policy / Treasury / Capability / Approval / Sandbox Boundaries
        â†“
Normal Execution Pipeline
```

The data flow must NOT become:
$$\text{Drive} \longrightarrow \text{Direct task execution} \longrightarrow \text{Direct Treasury reservation} \longrightarrow \text{Direct wallet/signing/broadcast}$$

---

## 5. Canonical Authority Restrictions & Safety Invariants

Drives operate under a single, unified **Canonical Authority Restriction Matrix**. Drives have **ZERO authority** over:

1. **Execution Dispatch Authority:** Drives cannot dispatch tasks, invoke capabilities, or execute code directly.
2. **Treasury Spending & Reservation Authority:** Drives cannot reserve, allocate, or spend Treasury funds.
3. **Vault, Signer & Broadcast Authority:** Drives cannot access cryptographic keys, signing tools, or external broadcast APIs.
4. **Production Mutation & Deployment Authority:** Drives cannot alter codebase files, deploy mutations, or modify infrastructure.
5. **Policy & Constitution Authority:** Drives cannot modify Constitution rules, security policies, or permission settings.
6. **Identity & Governance Authority:** Drives cannot alter organism identity, credential profiles, or authority configurations.
7. **Self-Approval Authority:** Drives cannot approve their own generated proposals, plan acceptance, or evolutionary mutations.

### 5.1 Monotonic Risk Ceiling Rule (Hunger Invariant)
- **Non-Escalation:** Greater Hunger must NEVER permit greater financial risk or expand spending ceilings.
- **Monotonic Tightening:** As Treasury scarcity increases (higher Hunger), permitted risk ceilings, spending limits, and eligible objective classes MUST tighten monotonically (monotonically non-increasing risk ceiling).
- **Survival Constraint:** Under survival-critical Hunger ($\text{Hunger} \ge 0.80$), goal proposals are strictly restricted to resource conservation, cost reduction, and explicitly allowlisted low-risk activity.

### 5.2 Anxiety & Curiosity Invariants
- **Anxiety:** High Anxiety ($\ge 0.80$) emits high-anxiety motivational context. `Cortex` applies its own independently enforced planning rules to restrict plan candidates to safe maintenance and validation classes.
- **Curiosity:** Curiosity may propose read-only research or sandbox work, but cannot activate production capabilities automatically or consume protected reserves.
- **Approval Attachment:** Evaluation, calculation, and non-executable proposal generation require NO approval. Inherited approval requirements (`ApprovalGateway`, human signatures, policy rules) attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.

---

## 6. Core Schemas & Types

### 6.1 `OrganismStateSnapshot`
```typescript
interface OrganismStateSnapshot {
  snapshotId: string;
  capturedAt: number;
  version: string;

  treasury: TreasuryState;
  reliability: ReliabilityState;
  workload: WorkloadState;
  cognition: CognitiveState;
  knowledge: KnowledgeState;
  capabilities: CapabilityState;

  evidenceHash: string;
}
```

### 6.2 Metric & Evaluation Status
```typescript
type MetricStatus =
  | "VALID"
  | "STALE"
  | "DEGRADED"
  | "UNKNOWN"
  | "UNAVAILABLE";

type EvaluationStatus =
  | "VALID"
  | "DEGRADED"
  | "UNAVAILABLE";
```

### 6.3 Deterministic Primitives
```typescript
interface IClock {
  now(): number;
}

interface IRandomSource {
  random(): number;
}

interface IIdGenerator {
  generateId(): string;
}
```

type NeedKind =
  | "TREASURY_DEFICIT"
  | "RELIABILITY_DEFICIT"
  | "WORKLOAD_PRESSURE"
  | "KNOWLEDGE_GAP"
  | "DATA_DEFICIENCY";

interface NeedSignal {
  needId: string;
  needKind: NeedKind;
  evidence: EvidenceRef[];
  intensity: number;
  threshold: number;
  status: MetricStatus;
  confidence: number;
  confidenceReason: string;
  observationTime: number;
  expiry: number;
  evaluatorVersion: string;
  correlationId: string;
  evidenceHash: string | null;
}

interface DriveState {
  driveKind: "HUNGER" | "ANXIETY" | "CURIOSITY" | "NONE";
  rawIntensity: number;
  effectiveIntensity: number;
  status: MetricStatus;
  confidence: number;
  isActive: boolean;
  activationReason: string;
  evaluatorVersion: string;
}
```

### 6.5 `MotivationalState`
```typescript
interface MotivationalState {
  snapshotId: string;
  snapshotVersion: string;
  evaluatedAt: number;
  evaluationStatus: EvaluationStatus;

  hunger: DriveState;
  anxiety: DriveState;
  curiosity: DriveState;

  dominantDrive: "HUNGER" | "ANXIETY" | "CURIOSITY" | "NONE";
  confidence: number;
  confidenceReason: string;

  suggestedObjectiveClass: ObjectiveClass | null;
  actionAuthority: false;

  evaluatorVersion: string;
  evidenceHash: string | null;
}
```

### 6.6 `GoalProposal`
```typescript
interface GoalProposal {
  goalId: string;
  objectiveClass: ObjectiveClass;
  sourceDrive: DriveKind;

  urgency: number;
  expectedValue: number;
  riskClass: RiskClass;

  evidence: EvidenceRef[];
  createdAt: number;
  expiresAt: number;

  actionAuthority: false;
  proposalVersion: string;
  lifecycleStatus: "PROPOSED" | "ACCEPTED" | "REJECTED" | "EXPIRED";
}
```

### 6.7 `InstinctEvaluationResult`
```typescript
interface InstinctEvaluationResult {
  state: MotivationalState;
  proposals: GoalProposal[];
}
```

---

## 7. Failure, Confidence, Recovery & Atomicity Semantics

### 7.1 Confidence, Thresholds, and Missing-Data Propagation
- **Total Deterministic Formula:** 
  1. Base confidence for each `NeedSignal` is mapped strictly from its source metrics: `VALID` (1.0), `STALE` (0.75), `DEGRADED` (0.50), `UNKNOWN` (0.25), `UNAVAILABLE` (0.0). If a `NeedSignal` aggregates multiple metrics, its confidence is the mathematical minimum of those metric confidences.
  2. The overall `MotivationalState.confidence` is the deterministic minimum `confidence` across ALL instantiated `NeedSignal` inputs, regardless of which drive is dominant.
  3. **Empty Set:** If exactly zero `NeedSignal` inputs exist, overall confidence is rigidly clamped to `0.0`.
  4. **Tie Behavior:** If multiple drives share the exact same effective intensity, arbitration resolves ties deterministically using a hardcoded sequence priority: `HUNGER` > `ANXIETY` > `CURIOSITY`.
- **Confidence Tiers & Restrictions:**
  - **High (1.0):** Normal operation. All otherwise policy-eligible proposal classes permitted. Explicitly preserves Constitution, Policy, Treasury, Approval, Sandbox, Vault, and Identity restrictions.
  - **Degraded (0.50 - 0.99):** Generation is restricted strictly to low-risk internal/read-only objective classes. Normal proposal generation remains subject to inherited policy and authority boundaries.
  - **Unavailable (< 0.50):** Goal proposal generation is completely disabled.
- **Critical Data Blocking:** If any critical Treasury or system integrity data is `UNKNOWN` or `UNAVAILABLE`, Hunger and Anxiety proposal generation is strictly blocked regardless of aggregate confidence.
- **Typed Uncertainty:** Missing data does NOT fabricate verified physiological evidence. Instead, a dedicated, strongly-typed `NeedSignal` (`needKind: "DATA_DEFICIENCY"`) is explicitly generated with typed evidence references to missing metrics. This translates directly into Anxiety while transparently enforcing a low confidence score, without faking underlying metric values.

### 7.2 Evaluation Failure Semantics (No Fake "NONE")
- If `InstinctSystem.evaluate()` encounters an exception, unhandled failure, or missing critical inputs, it emits a structural failure state:
  ```typescript
  {
    state: {
      snapshotId: snapshot.snapshotId,
      snapshotVersion: snapshot.version,
      evaluatedAt: clock.now(),
      evaluationStatus: "UNAVAILABLE",
      hunger: { driveKind: "HUNGER", rawIntensity: 0, effectiveIntensity: 0, status: "UNAVAILABLE", confidence: 0, isActive: false, activationReason: "Evaluation failed", evaluatorVersion: CURRENT_EVALUATOR_VERSION },
      anxiety: { driveKind: "ANXIETY", rawIntensity: 0, effectiveIntensity: 0, status: "UNAVAILABLE", confidence: 0, isActive: false, activationReason: "Evaluation failed", evaluatorVersion: CURRENT_EVALUATOR_VERSION },
      curiosity: { driveKind: "CURIOSITY", rawIntensity: 0, effectiveIntensity: 0, status: "UNAVAILABLE", confidence: 0, isActive: false, activationReason: "Evaluation failed", evaluatorVersion: CURRENT_EVALUATOR_VERSION },
      dominantDrive: "NONE",
      confidence: 0.0,
      confidenceReason: "Evaluation failed",
      suggestedObjectiveClass: null,
      actionAuthority: false,
      evaluatorVersion: CURRENT_EVALUATOR_VERSION,
      evidenceHash: null
    },
    proposals: []
  }
  ```
  - Telemetry error event logged with exact exception stack trace.
- `Heart` MUST NOT synthesize a healthy-looking `NONE` state upon failure; it must preserve and log `evaluationStatus: "UNAVAILABLE"`.

### 7.3 Persistence Atomicity & Schema Versioning
- All persisted motivational states, active goal proposals, and evaluator version metadata MUST be written within a single **atomic SQLite transaction**.
- Every persisted record includes `evaluatorVersion` and `schemaVersion`.

### 7.4 Recovery Behavior
- Upon boot or recovery (`InstinctSystem.recoverState()`):
  - If persisted state is missing, corrupt, or has an incompatible schema version, `InstinctSystem` logs a critical recovery failure event, quarantines corrupt records, and falls back to a clean boot structural failure state (`state.evaluationStatus: "UNAVAILABLE"`, `state.confidence: 0.0`), triggering immediate snapshot re-evaluation. It returns this structural failure state (`InstinctEvaluationResult`).
  - It then immediately requests a fresh `OrganismStateSnapshot` to re-evaluate state.

---

## 8. Definition of Done (Gen-2 Exit Criteria)

Gen-2 is complete only when Autark can observe named internal metrics, produce deterministic evidence-backed Need signals, calculate bounded drives and confidence, resolve conflicting drives deterministically, resist threshold oscillation, persist/recover state atomically, explain active drives, generate non-executable goal proposals, feed Cortex, initiate allowlisted safe actions, trace action provenance, degrade safely, preserve safety boundaries, pass independent verification, and document limitations.

---

## 9. Gen-2 Canonical Objective Sequence

To adhere to the strict one-objective-at-a-time governance model, the Gen-2 implementation is decomposed into genuinely narrow, independently verifiable objectives. No objective may begin until the previous objective's implementation is verified and approved by Codex.

### Stage 0: Architecture
* **G2-S0-O1**: Baseline Inheritance & Architecture Reconciliation

### Stage 1: Primitives & Schemas
* **G2-S1-O1**: Implement `IClock` primitive.
* **G2-S1-O2**: Implement `IRandomSource` primitive.
* **G2-S1-O3**: Implement `IIdGenerator` primitive.
* **G2-S1-O4**: Implement `OrganismStateSnapshot` and generic metric types.
* **G2-S1-O5**: Implement `NeedSignal` schema.
* **G2-S1-O6**: Implement `DriveState` schema.
* **G2-S1-O7**: Implement `MotivationalState` schema.
* **G2-S1-O8**: Implement `GoalProposal` schema.
* **G2-S1-O9**: Implement `InstinctEvaluationResult` schema.

### Stage 2: NeedMonitor
* **G2-S2-O1**: Implement `NeedMonitor` generic metric validation logic (stale/degraded/valid).
* **G2-S2-O2**: Implement `NeedMonitor` translation for Treasury metrics into Hunger `NeedSignal`.
* **G2-S2-O3**: Implement `NeedMonitor` translation for Workload/Reliability metrics into Anxiety `NeedSignal`.
* **G2-S2-O4**: Implement `NeedMonitor` translation for Knowledge Gap/Exploration metrics into Curiosity `NeedSignal`.
* **G2-S2-O5**: Implement `NeedMonitor` translation for missing data into a typed Data-Deficiency uncertainty `NeedSignal`.
* **G2-S2-O6**: Implement `NeedMonitor` deterministic confidence scoring and uncertainty degradation.

### Stage 3: DriveEngine
* **G2-S3-O1**: Implement `DriveEngine` raw intensity computation for Hunger.
* **G2-S3-O2**: Implement `DriveEngine` raw intensity computation for Anxiety.
* **G2-S3-O3**: Implement `DriveEngine` raw intensity computation for Curiosity.
* **G2-S3-O4**: Implement `DriveEngine` deterministic arbitration (e.g. Anxiety suppressing Curiosity).
* **G2-S3-O5**: Implement `DriveEngine` hysteresis thresholds.
* **G2-S3-O6**: Implement `DriveEngine` decay curves.

### Stage 4: GoalProposalEngine
* **G2-S4-O1**: Implement `GoalProposalEngine` rules for Hunger (monotonic risk ceiling).
* **G2-S4-O2**: Implement `GoalProposalEngine` rules for Anxiety.
* **G2-S4-O3**: Implement `GoalProposalEngine` rules for Curiosity.

### Stage 5: InstinctSystem Assembly
* **G2-S5-O1**: Assemble `InstinctSystem` public interface.
* **G2-S5-O2**: Route internal logic flow (`NeedMonitor` -> `DriveEngine` -> `GoalProposalEngine`).
* **G2-S5-O3**: Implement atomic SQLite persistence schema versioning for `InstinctSystem`.
* **G2-S5-O4**: Implement atomic SQLite transaction writes.
* **G2-S5-O5**: Implement `InstinctSystem` boot recovery logic.
* **G2-S5-O6**: Implement `InstinctSystem` corruption quarantine and structural fallback states.

### Stage 6: Heart & Cortex Integration
* **G2-S6-O1**: Wire `Heart` tick sequence to `InstinctSystem.evaluate()`.
* **G2-S6-O2**: Wire `Heart` SLEEP sequence to `InstinctSystem.persistState()`.
* **G2-S6-O3**: Implement `Heart` blind pass-through for proposal acknowledgement (`acknowledgeProposal`).
* **G2-S6-O4**: Implement `Heart` pass-through of `InstinctEvaluationResult` to `Cortex.think()`.
* **G2-S6-O5**: Implement `Cortex` planning integration using advisory motivational context.

### Stage 7: System Validation & Release
* **G2-S7-O1**: Execute Gen-2 shadow-mode validation.
* **G2-S7-O2**: Execute Gen-2 comprehensive deterministic replay tests.
* **G2-S7-O3**: Produce Gen-2 Release-Candidate Evidence Handoff (Antigravity possesses no release authority).



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\GENERATIONS\GEN-3.md -->
<!-- ========================================== -->

# Gen-3 Builder â€” Stage 0 Architecture Reconciliation

**Status:** Stage 0 design in progress; documentation only
**Inherited baseline:** Gen-2A-Baseline, PASS WITH LIMITATIONS

## Evolutionary goal

Gen-3 transforms evidenced opportunities into tested, documented and reviewable
digital artifacts through a bounded project lifecycle. It is not an autonomous
company, operator, deployer, customer-contact system, lender, trader or source
mutation engine.

```text
Observation/Hypothesis â†’ OpportunityCandidate â†’ bounded Project
â†’ Specification â†’ isolated Build â†’ Validation â†’ Review Package
â†’ Human release decision â†’ measured outcome â†’ Memory/Learning
```

## Principal organ

`BuilderSystem` is one top-level organ. Its internal components are
`OpportunityEvaluator`, `ProjectManager`, `ArtifactFactory`,
`ValidationPipeline`, `ReleasePackager` and `OutcomeTracker`.

Heart remains the orchestrator and only invokes the public BuilderSystem
boundary. Cortex supplies advisory plans; it does not grant Builder authority.

## Canonical schemas

`OpportunityCandidate` contains evidence references, beneficiary, class,
expected value, cost, duration, confidence, risk, duplicate/expiry metadata,
qualification status and `authority: "NONE"`.

`Project` contains a candidate reference, immutable scope and exclusions,
budget ceiling, cognitive budget, risk, acceptance criteria, required
capabilities, deterministic version and lifecycle status.

`ArtifactManifest` contains project reference, artifact type, source/build
provenance, file checksums, test/security/documentation evidence, limitations,
cost report and `deploymentAuthority: false`.

`ProjectOutcome` contains planned/actual cost, measured value, evidence-backed
feedback/failures, outcome class, confidence and deterministic observation time.

All schemas require validated evidence references, deterministic IDs/timestamps,
finite bounded numeric values and immutable or persisted versioned records.

## Lifecycle

```text
PROPOSED â†’ EVALUATING â†’ QUALIFIED â†’ AWAITING_PROJECT_APPROVAL
â†’ APPROVED â†’ PLANNING â†’ BUILDING â†’ TESTING â†’ READY_FOR_REVIEW
â†’ ACCEPTED_FOR_RELEASE â†’ MEASURING â†’ COMPLETED
```

Failure states are `REJECTED`, `BLOCKED`, `FAILED`, `CANCELLED`, `ROLLED_BACK`
and `RETIRED`. `RELEASED` is not a Gen-3 Builder transition: public deployment
requires a later generation and an explicit human-controlled release boundary.
No transition may skip guards, expand scope or exceed budget.

## Gen-3 Stage 0 exit criteria

- architecture, schemas, lifecycle guards and interfaces are reconciled;
- authority matrix explicitly denies production mutation, deployment, customer
  communication, purchases, signing, broadcast, policy and identity changes;
- persistence, replay, recovery, provenance, budgets and failure behavior are
  defined;
- one narrow digital-artifact vertical slice is specified;
- independent Codex design review approves the documents;
- no Gen-3 production source exists before approval.

Gen-2A remains immutable and no Gen-4/5/6 behavior is introduced here.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\GENERATIONS\GEN1_RECONCILIATION.md -->
<!-- ========================================== -->

# Gen-1 Implementation Reconciliation

**Status:** Partial cognitive foundation; not a complete scripture-level Gen-1
**Reviewed:** 2026-07-24

## Implemented foundation

- Episodic, semantic, working/recent, decision, experiment and skill storage.
- Post-execution episode recording and bounded context retrieval.
- Reflection over recent failures with evidence-linked semantic lessons.
- Dream replay of failures and constrained curiosity simulation in a VM.
- Cognitive-budget controls and sandbox-first skill compilation.
- Human-gated, proposal-only evolution; no automatic mutation or deployment.

## Gaps against the original Gen-1 mission

1. No unified ObservationEngine continuously covers external sources such as
   markets, repositories, news, competitors, tools, email, calendar and files.
2. A Heart snapshot is not equivalent to a durable observation organ.
3. There is no guaranteed canonical route making every observation and every
   execution searchable memory with provenance.
4. Learning is limited to simple reflection and rule insertion; strategy
   reinforcement, forgetting, hypothesis scoring and measurable improvement are
   incomplete.
5. Dreaming is a constrained scaffold, not yet a broad business/architecture
   hypothesis laboratory.
6. Evolution proposals lack a complete real diff snapshot, executable evidence
   bundle and implemented rollback executor.

## Classification

Gen-1 should be described as **Cognitive Foundation â€” Partial**, not as a fully
realized observing, learning organism. This does not invalidate the immutable
Gen-1 tag or the locked Gen-2 baseline; it corrects the documentation claim.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\GENERATIONS\NEXT_WORK_PLAN.md -->
<!-- ========================================== -->

# Post-Gen-2 Architecture Work Plan

**Status:** Gen-2A implementation candidate under independent verification
**Prerequisite:** Gen-2 Instinct baseline remains immutable and locked.

## Objective A â€” Vision and generation reconciliation

Resolve whether the next milestone is called `Gen-1 Completion`, `Gen-2A`, or
`Gen-3 Builder`. Preserve Gen-2 Instinct as a named foundation regardless of
the label. Update the roadmap only after independent design review.

## Objective B â€” Observation architecture

Specify one top-level `ObservationEngine` with bounded source adapters, source
identity, timestamps, freshness, confidence, provenance, deduplication,
correlation IDs, rate/budget limits, failure behavior and read-only authority.
The engine must not execute, spend, sign, broadcast, mutate policy or modify
identity.

## Objective C â€” Observation-to-memory contract

Define an immutable observation envelope and one canonical ingestion route into
working, episodic, semantic, business and financial memory. Specify retention,
searchability, provenance, idempotency, privacy and corruption recovery.

## Objective D â€” Learning completion

Define measurable strategy outcomes, reinforcement and decay, forgetting,
hypothesis lifecycle, experiment evidence, prompt/planning/budget improvements,
and failure-safe rejection of unsupported lessons.

## Objective E â€” Dream and proposal evidence

Expand offline replay and hypothesis simulation while preserving zero real-world
authority. Define the evidence bundle required for any evolution proposal:
reproducible diff, tests, constitutional/security/economic checks, regression
results and rollback material.

## Sequencing rule

Do not begin autonomous-business, collective-organism or artificial-life work
until Objectives Bâ€“E are designed, independently reviewed, implemented in narrow
objectives, and verified. Do not begin Gen-3 code merely because Gen-2 is locked.

## Detailed implementation sequence

Each objective below is a separate handoff. The next objective cannot begin
until the preceding implementation has an independent verification result.

### Stage 0 â€” Architecture reconciliation (documentation only)

- **P0-O1:** Approve the original life architecture as the strategic compass.
- **P0-O2:** Decide the generation label for unfinished Perception/Memory/
  Learning work (`Gen-1 Completion`, `Gen-2A`, or another explicit name).
- **P0-O3:** Define the ObservationEngine top-level organ boundary and its
  authority exclusions.
- **P0-O4:** Define the immutable ObservationEnvelope schema and provenance.
- **P0-O5:** Define the observation-to-memory contract and ownership matrix.
- **P0-O6:** Define acceptance tests, deterministic replay requirements,
  missing-data behavior, budgets, privacy and failure handling.

**Gate:** independent design review approves the reconciled architecture.

### Stage 1 â€” Deterministic observation primitives

- **P1-O1:** Implement clock, ID, randomness and source-adapter interfaces only
  where absent or incomplete.
- **P1-O2:** Implement the immutable ObservationEnvelope and validation guards.
- **P1-O3:** Implement a deterministic in-process observation source for tests.
- **P1-O4:** Add schema, migration and corruption-recovery tests.

**Gate:** focused Docker tests, replay tests and authority-boundary review pass.

### Stage 2 â€” ObservationEngine core

- **P2-O1:** Implement one top-level ObservationEngine organ.
- **P2-O2:** Add bounded internal source scheduling and rate/budget controls.
- **P2-O3:** Add source freshness, confidence, deduplication and correlation.
- **P2-O4:** Add safe degradation and unavailable-source behavior.
- **P2-O5:** Add internal metrics observation through the same envelope.

**Gate:** no execution, spending, signing, broadcast, mutation, policy or
identity authority; independent adversarial verification required.

### Stage 3 â€” Observation-to-memory ingestion

- **P3-O1:** Define the canonical idempotent ingestion boundary.
- **P3-O2:** Persist every accepted observation with provenance and retention.
- **P3-O3:** Route observations into working and episodic memory.
- **P3-O4:** Add semantic extraction only from evidenced observations.
- **P3-O5:** Add searchable business, financial and failure memory projections.

**Gate:** replay, restart, duplicate-delivery, corruption and retention tests.

### Stage 4 â€” Learning completion

- **P4-O1:** Define strategy outcome and hypothesis schemas.
- **P4-O2:** Implement evidence-based reinforcement and confidence updates.
- **P4-O3:** Implement decay and forgetting with reversible audit history.
- **P4-O4:** Implement hypothesis evaluation using offline simulation only.
- **P4-O5:** Measure improvement in planning, budget, ordering and opportunity
  selection without granting mutation authority.

**Gate:** learning cannot promote unsupported rules or bypass constitutional,
economic, security or human-approval boundaries.

### Stage 5 â€” Dreaming and evolution evidence

- **P5-O1:** Expand replay across observations, executions and failures.
- **P5-O2:** Generate offline business and architecture hypotheses.
- **P5-O3:** Produce reproducible proposal evidence bundles.
- **P5-O4:** Verify constitutional, security, economic and regression evidence.
- **P5-O5:** Preserve proposal-only evolution and human approval.

**Gate:** independent verification of zero real-world action from dreaming and
proposal generation.

### Stage 6 â€” Builder/business design (future generation)

Only after Stages 0â€“5 are complete and reviewed: define bounded opportunity
discovery, product creation, deployment, operations, customer support, revenue
accounting and reinvestment. This is the first stage allowed to propose the
future Builder generation; it is not authorized by the current plan.

## Current Gen-2A implementation evidence

- Engine repair chain: `93c3429`, `594562c`, `81cab86`, `1424fe7`,
  `27b1926`, `bf8d20d`, `86c8e79`.
- Independent focused result: `PASS WITH LIMITATIONS`; build passes and the
  focused ObservationEngine suite passes 3/3.
- Implemented: immutable validated envelopes, deterministic clock/IDs,
  unavailable-source degradation, source budgets, durable atomic observation
  storage, corruption quarantine, idempotency, evidence-bound lessons,
  reversible retirement audit, and offline evidence-validated hypotheses.
- Limitation: persistence serialization is in-process; cross-process locking is
  not implemented.
- Baseline status: `UNVERIFIED` until Docker adversarial verification runs.
  No Gen-2A baseline tag or Gen-3 authorization is issued.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\RELEASES\Gen1-RC1\README.md -->
<!-- ========================================== -->

# Gen-1 Release Candidate 1 (RC1)

# Gen-1 Release Candidate 1 (RC1)

**Status:** ðŸŸ¢ STABLE / FROZEN

This directory archives the state of the Gen-1 Release Candidate after passing all 15 stages of the verification matrix.

## Milestones Achieved
- **Cognitive Foundation:** Organism possesses a full state machine (`Heart`) with `EpisodicMemory`, `SemanticMemory`, and `DreamEngine` for safe reflection without burning real capital.
- **Economic Safety:** `Treasury` is fully active with a 20% profit sweep and cognitive budgeting, preventing run-away autonomous spending.
- **Security:** `ApprovalGateway` enforces a strict cryptographic boundary for self-mutations. `Sandbox` strictly isolates deterministic evaluation of LLM-generated code.
- **Endurance:** System passed a continuous 6-hour production shadow-run in a headless Docker environment with zero handle leaks, queue starvation, or catastrophic memory bloat. 13/13 benchmarks and 7/7 level B Chaos attacks successfully recovered.

## Technical Debt (For Gen-2)
- On-chain transaction status verification during crash recovery needs active RPC polling in `BOOT` state.
- Large queue table history partitioning to prevent SQLite slowdowns over years of runtime.
- Formal `WorldModel` and predictive temporal reasoning.

## Verdict
The codebase has successfully achieved biological and architectural stability for its current generation constraints. All documented organs physically exist and map correctly to the engine implementation. Gen-1 is formally frozen.

