

<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\IMPLEMENTATION_HANDOVER\gen1_implementation_handover.md -->
<!-- ========================================== -->

# Gen-1 Implementation Handover

**Target Branch:** `main` (for `v1.1.0-gen1` freeze)

This document is the exact technical specification for the codebase changes required to bring the Autark organism to Gen-1 maturity, satisfying all constraints outlined in the Memory Vault.

## 1. Database Schema Migrations

The SQLite databases must be physically created and structured to support the stratified memory and identity constraints.

### `data/treasury.db`
- **Migration:** Ensure `ledger_entries` table exists with `type`, `amount`, `currency`, `provider`, `reference_id`, `status`, and `timestamp`.

### `data/memory.db`
- **Migration 1:** Create `episodes` table to store completed pulses.
- **Migration 2:** Create `semantic_rules` table to store extracted insights with `confidence_score`.

### `data/identity.db`
- **Migration:** Create `identity_core` table and seed it using `process.env` at boot (generation, creatorAddress, profitShareAddress).

## 2. Core Biological Law Enforcement (The Guardrails)

Before we build the thinking engines, we must build the constraints.

### `src/economy/Treasury.ts`
- **Method `reserveCognitiveBudget(est: number)`:** Must calculate `currentRetainedRevenue * 0.20`. If `est > budget`, return `false`.
- **Method `logRevenue(amount: number, ...)`:** Must immediately dispatch 20% to the sweep queue before adding to the retained pool.

### `src/evolution/ApprovalGateway.ts`
- **Class `ApprovalGateway`:** Create this new file. It must expose `requestApproval(package)`. For Gen-1, this will block execution and log to the console/discord demanding a cryptographic signature from `creatorAddress` before resolving the Promise.

## 3. Stratified Memory Implementation

### `src/memory/WorkingMemory.ts`
- Must be a transient in-memory `Map`. 
- **Method `clear()`:** Must be rigorously enforced in `Heart.ts` `finally` block.

### `src/memory/EpisodicMemory.ts`
- **Method `commitEpisode()`:** Serializes `WorkingMemory` summary into `memory.db`.

### `src/memory/SemanticMemory.ts`
- **Method `injectRule()`:** Writes to `semantic_rules` table.
- **Method `decayRules()`:** Subtracts a configurable decay factor from the `confidence_score` of all rules. 

## 4. The Cognitive Engines

### `src/cognitive/Cortex.ts`
- **Refactor:** Standardize around `infer(prompt, schema)`. Must enforce JSON Schema parsing natively and throw structured errors on failure.
- **Feature:** Must calculate and return `tokenCost` for every single call.

### `src/cognitive/DreamEngine.ts` (New)
- **Class `DreamEngine`:** 
  - Expose `simulate(hypothesis, scenario)`.
  - Must spin up a Node.js `vm` or `worker_thread` with blocked requires (`fs`, `net`).
  - Must enforce a strict 5000ms timeout.

### `src/cognitive/ReflectionEngine.ts` (New)
- **Class `ReflectionEngine`:**
  - Expose `reflect()`.
  - Pulls the last 5 `EpisodicMemory` records.
  - Calls `Cortex.infer()` to extract rules.
  - Calls `SemanticMemory.injectRule()` with the episode IDs as evidence.

## 5. Kernel Orchestration

### `src/kernel/Heart.ts`
- **Refactor `tick()`:** Must strictly enforce the sequence: `WAKE` -> `THINK` -> `EXECUTE` -> `SLEEP`.
- **Integration:** During `SLEEP`, the Heart must check `Treasury.reserveCognitiveBudget()`. If true, it invokes `ReflectionEngine.reflect()` or `DreamEngine.simulate()`. If false, it skips maintenance.
- **Safety:** Wrap the entire cycle in a `try/catch/finally` block that guarantees `WorkingMemory.clear()`.

## 6. Execution Plan
Upon approval of this handover document, the engineer will:
1. Initialize the SQLite DB schemas.
2. Implement the `Treasury` cognitive budget math.
3. Implement `Working/Episodic/Semantic` memory classes.
4. Implement `Cortex` token tracking and strict schema parsing.
5. Implement the `DreamEngine` sandboxing.
6. Wire it all together in `Heart.ts`.
7. Execute the final deep tests and Gen-1 Audit suite.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\IMPLEMENTATION_HANDOVER\GEN2A_HANDOFF.md -->
<!-- ========================================== -->

# Gen-2A Perception and Learning Handoff

**Status:** PASS WITH LIMITATIONS; ready for human Gen-2A baseline lock
**Scope:** Gen-2A Stages 0â€“5 only; Builder/business (Stage 6) excluded.

## Exact engine repair chain

`93c3429` -> `594562c` -> `81cab86` -> `1424fe7` -> `27b1926` ->
`bf8d20d` -> `86c8e79`

## Implemented boundaries

- ObservationEnvelope is validated, deeply immutable and provenance-bearing.
- ObservationEngine is read-only and degrades malformed or failed sources to
  `UNAVAILABLE` envelopes.
- Observation fingerprints exclude dynamic observation time and suppress
  duplicate delivery.
- JsonObservationStore uses atomic serialized in-process writes, restart
  recovery, corruption quarantine and safe unavailable state.
- LessonLedger requires evidence, uses deterministic reinforcement/decay and
  preserves retirement audit records.
- HypothesisEngine accepts only accepted observation evidence and emits
  offline proposals with authority `NONE`.

## Independent evidence

- TypeScript build: passed.
- Focused Gen-2A tests: 3/3 passed.
- Independent verdict: `PASS WITH LIMITATIONS`.
- Docker adversarial verification: `PASS WITH LIMITATIONS`; raw evidence is in
  `AUDITS/GEN2A/DOCKER_VERIFICATION_2026-07-24-PASS.md`.

## Required next action

The Gen-2A baseline may be tagged for human authorization. Cross-process
locking remains explicitly out of scope; no Gen-3 behavior is authorized.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\IMPLEMENTATION_HANDOVER\GEN3_STAGE0_HANDOFF.md -->
<!-- ========================================== -->

# Gen-3 Stage 0 Design Handoff

**Status:** READY_FOR_CODEX_DESIGN_REVIEW
**Scope:** Documentation-only architecture reconciliation.

## Inherited immutable baselines

- Engine: `Gen-2A-Baseline` at `86c8e79213d207edf4d38969a97865147f06f39f`.
- Brain handoff: `5acbed72f07f8a169e035443a1ed6ea5a9b8a99f`.
- Gen-2A limitation: one writer/process persistence; cross-process locking is
  not implemented.

## Documents prepared

- `GENERATIONS/GEN-3.md`
- `DECISIONS/ADR-009-GEN3-BUILDER-BOUNDARY.md`
- `ORGANS/BUILDER_SYSTEM.md`
- `INTERFACES/HEART_BUILDER_INTERFACE.md`
- `INTERFACES/BUILDER_CORTEX_INTERFACE.md`
- `FLOWS/GEN3_BUILDER_LIFECYCLE.md`
- `REFERENCE/GENERATION_TIMELINE_REVIEW.md`

## Explicit exclusions

No production implementation, deployment, customer communication, purchases,
real-money action, wallet/signing/broadcast, autonomous mutation, policy or
identity change is included. Gen-2A files and tags are untouched.

## Design-review questions

1. Does BuilderSystem remain one top-level organ with internal components only?
2. Are opportunity, project, artifact and outcome schemas sufficiently
   evidence-bound, deterministic and replayable?
3. Are project approval, artifact acceptance and deployment clearly separated?
4. Is isolated workspace construction bounded without production mutation?
5. Are Heart, Cortex, ObservationEngine, Memory, Learning, Treasury, Policy,
   Sandbox and Approval boundaries preserved?
6. Is the first vertical slice narrow enough for one-objective governance?

No Stage 1 objective may begin until these documents receive independent design
approval.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\IMPLEMENTATION_HANDOVER\SESSION_HANDOVER_GEN1_STAGE8.md -->
<!-- ========================================== -->

# Session Handover: Gen-1 Stage 8 Complete

**Date:** July 23, 2026
**Handover Checkpoint:** Stage 8 (Reliability & Stress Testing) COMPLETE -> Next: Stage 9 (Chaos Engineering)

---

## 1. Repository Layout & Working Directory
All repositories live in `d:\autark\`:
- `d:\autark\autark` â€” Executable organism (Git branch: `gen1-development`)
- `d:\autark\autark-brain` â€” Permanent Memory Vault & engineering knowledge (Git branch: `main`)
- `d:\autark\autark-bench` â€” Benchmarking & performance engine (Git branch: `master`)
- `d:\autark\autark-lab` â€” Experiments & prototypes
- `d:\autark\autark-data` â€” Runtime SQLite databases & logs

## 2. Git Status & Commits
- **`autark`**: Commit `0ca10c2` (`feat(kernel): fix WorkQueue crash recovery and add security audit tests`)
- **`autark-brain`**: Commit `26bf8ef` (`docs: add Stage 8 Reliability Audit report to Memory Vault`)
- **`autark-bench`**: Commit `101e032` (`feat(reliability): add Stage 8 stress test modules`)

## 3. Pipeline Progress & Audit Status
- `[x]` **Stage 1**: Unit Audits (All 6 core organs passed)
- `[x]` **Stage 2**: Interface Audits (All API boundaries passed)
- `[x]` **Stage 3**: Workflow Audits (Boot, Execute, Sleep continuous pulse refactored)
- `[x]` **Stage 4**: Dependency Audits (Strict import rules verified)
- `[x]` **Stage 5**: State Machine Audit (10 biological states; WorkQueue lease expiration recovery fixed)
- `[x]` **Stage 6**: Security Audits (Isolated-VM sandbox violation attempts & wallet isolation passed)
- `[x]` **Stage 7**: Performance Audits (Tri-baseline benchmarking, budgets, 10k pulses passed)
- `[x]` **Stage 8**: Reliability & Stress Testing (100k pulses, 100k queue items, DB concurrency, resource leaks, mid-state crash recovery, 20% budget cap, memory amnesia - all 7 passed cleanly in Docker)
- `[ ]` **Stage 9**: Chaos Engineering *(NEXT STAGE)*
- `[ ]` **Stage 10**: End-to-End System Validation
- `[ ]` **Stage 11**: Architecture Drift Audit
- `[ ]` **Stage 12**: Gen-1 Release Freeze

## 4. Operational Principles & Engineering Standards
1. **The Brain Evolves with the Code**: Scaled to scope (`ENGINEERING_STANDARDS.md`).
2. **Never Claim Implementation Without Proof**: Must have code, tests, logs, or audit evidence.
3. **Audits Must Violate, Not Validate**: Mechanical attack scripts required.
4. **Evidence First**: Specify file, function, test, audit, and commit for every claim.
5. **No Mocks Survive a Freeze**: Scan for `TODO`/`MOCK`/`FIXME` before freeze.
6. **Strict Repository Separation**: Respect `autark`, `autark-brain`, `autark-bench`.
7. **No Optimization Without Measurement**: Benchmarks required for performance claims.

## 5. Important ADRs
- **ADR-001**: Constitution Is Immutable
- **ADR-002**: Cognitive Budget (20% Revenue Cap)
- **ADR-003**: Simulator-First Dreaming
- **ADR-004**: Semantic Memory Design
- **ADR-005**: Evidence-Based Learning
- **ADR-006**: Why No Instincts in Gen-1
- **ADR-007**: Continuous Biological Heartbeat (Pulse vs Job Queue)

## 6. Instructions for Next Session (Stage 9)
Start the next session by executing **Stage 9: Chaos Engineering**:
1. Create chaos injection test harness in `autark-bench` or `autark`.
2. Deliberately inject network timeouts, RPC failures, database lock corruptions, disk write failures, and malformed LLM responses.
3. Verify that the organism enters safe states, logs failures, preserves funds, and recovers automatically.
4. Output `autark-brain/AUDITS/CHAOS/Chaos_Audit_Gen1.md`.
5. Update `CURRENT_STATE.md`, commit code and documentation, and proceed to Stage 10.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\IMPLEMENTATION_HANDOVER\GEN2\STAGE0_HANDOFF.md -->
<!-- ========================================== -->

# ðŸ“‹ Hand-Off Summary: Gen-2 Stage 0 Architecture Reconciliation

### ðŸ Status: Gen-2 Stage 0 Proposed for Design Review
The Stage 0 documentation for Autark Gen-2 has been revised to address the final implementation-blocking structural, deterministic, and decomposition contradictions. This handoff is submitted for independent Codex review.

No source code implementation (Stage 1) has been started.

---

### ðŸ“ Handoff Metadata
- **Base SHA (Before latest revisions):** `c0fd3817147e60bcab4eaada8672b267411580b2`
- **Final SHA (This proposal):** The git commit containing this version of the handoff document is the authoritative Stage 0 architecture commit.
- **Exact Changed Files:**
  - `GENERATIONS/GEN-2.md`
  - `INTERFACES/HEART_INSTINCT_INTERFACE.md`
  - `IMPLEMENTATION_HANDOVER/GEN2/STAGE0_HANDOFF.md`

### ðŸ” Proposed Revisions

1. **Nullable Evidence Envelopes:**
   - Explicitly typed `evidenceHash` as `string | null` across all exposed schemas (`NeedSignal`, `MotivationalState`) to uniformly enforce nullable semantics.

2. **Deterministic Failure Provenance:**
   - Replaced placeholder values in the structural failure envelope with explicit variables (`evaluatorVersion: CURRENT_EVALUATOR_VERSION`) and null values (`evidenceHash: null`). Added `snapshotVersion: snapshot.version` separately to explicitly distinguish between organism state version and evaluator implementation version.

3. **Total Deterministic Confidence Algorithm:**
   - Formalized the confidence algorithm in `GEN-2.md` as a total, ordered, clamped `[0,1]`, deterministic function.
   - Defined base metric mapping: `VALID` (1.0), `STALE` (0.75), `DEGRADED` (0.50), `UNKNOWN` (0.25), `UNAVAILABLE` (0.0).
   - Enforced empty set behavior: rigidly clamped to `0.0`.
   - Enforced tie-breaking behavior using a hardcoded sequence priority (`HUNGER` > `ANXIETY` > `CURIOSITY`).
   - Replaced abstract uncertainty rules with a dedicated, strongly-typed "Data Deficiency" `NeedSignal` that transparently escalates Anxiety while depressing overall confidence.

4. **Dependency Gaps Closed in Objective Sequence:**
   - Appended specific, narrow objectives for implementing the canonical `GoalProposal` schema prior to `GoalProposalEngine`.
   - Appended specific, narrow objectives for translating Curiosity (Knowledge Gap) Needs and typed Uncertainty/Data Deficiency Needs prior to Drive computation.

5. **Heart Boundary Completeness:**
   - Added `acknowledgeProposal` to the canonical Heart boundary listing in `GEN-2.md` Section 3.2.
   - Updated the data-flow listing in `HEART_INSTINCT_INTERFACE.md` to return the canonical `InstinctEvaluationResult` instead of the internal `MotivationalState` subset.

### ðŸ›¡ï¸ Verification Performed
- **ADR-006 Reconciliation:** Verified Heart is decoupled from execution and Drive rules.
- **Organ Boundary & Authority Restrictions:** Verified Heart operates purely as a pass-through and Cortex receives purely advisory envelopes.
- **Hunger Risk Tightening:** Verified monotonic risk ceiling requirement exists.
- **Persistence Ownership:** Verified `InstinctSystem` exclusively owns persistence.
- **Code Check:** Verified 0 lines of Gen-2 executable source code exist.

### âš ï¸ Deviations & Limitations
- **Constraint Definition Limitation:** The structural models explicitly define what the failure state should look like, but the concrete TypeScript implementations in Stage 1 will be responsible for enforcing the schema bounds.

---

### ðŸ›‘ Next Steps for Codex

**DO NOT BEGIN G2-S1-O1 YET.**

The immediate next step is **Codex Stage 0 Design Review** on the authoritative commit on the `gen2-development` branch.
Awaiting Codex's final verdict to authorize drafting the objective scope for `G2-S1-O1`.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\ANTIGRAVITY_HANDOFF.md -->
<!-- ========================================== -->

# Gen-2 RC1 Baseline Handoff

## Authority and Review Separation

The project owner temporarily authorized Codex to implement only the three
findings in the preceding `CODEX_REVIEW.md`. Codex has not reviewed, approved,
or assigned a verification verdict to its own implementation. A separate
independent reviewer is required.

## Exact Scope

- Engine base: `bd0d08b740ffee97caa601f708eb1dfa3c0a8290`
- Engine initial repair: `c7f5e4f5945fe367e3b434f578c8dde0ebb784a0`
- Engine independent-finding repair:
  `077d756303d48e9e19f8dbeac034c54f4c6a0c9f`
- Brain base: `d0755cef47d590a4bd04bfb8e49b1892a9086c8e`
- Brain repair: the commit containing this handoff is authoritative.

## Implemented Repairs

1. Critical Hunger remains `FINANCIAL_CONSERVATION`/`LOW`; the generic
   suggested-class path cannot widen it back to `FINANCIAL_TRANSACTION`.
2. Persistence recovery rejects non-finite evidence numbers, negative
   evidence timestamps, urgency outside `[0,1]`, negative expected value,
   negative creation time, and expiration not strictly after creation.
3. Canonical organ, interface, flow, roadmap, current-state, traceability, and
   workflow documents now say implementation repair is awaiting independent
   verification rather than claiming completion.
4. After independent review found that non-financial suggested classes could
   still replace critical-Hunger conservation, the override was made
   unconditional: every `ObjectiveClass` suggestion now leaves critical
   Hunger as `FINANCIAL_CONSERVATION`/`LOW`.

## Docker Evidence Produced by Implementer

- Image: `autark-gen2-final-repair`
- `npm run build`: passed.
- Focused suites after the independent-finding repair: 5/5 suites, 30/30
  tests passed.
- Full suite after the independent-finding repair: 17/17 suites, 75/75 tests
  passed.
- Jest required `--forceExit`; the existing open-handle warning remains a
  limitation and was not broadened into this repair.

## Independent Reviewer Checklist

- Inspect the exact engine and brain diffs.
- Re-run the focused and full Docker suites.
- Adversarially confirm critical-Hunger monotonic tightening.
- Confirm persistence rejects the new numeric/time corruptions while valid
  round trips recover.
- Confirm canonical documents agree and no authority boundary changed.
- Record an independent verdict without asking this implementing Codex run to
  approve itself.

## RC1 smoke evidence

- Engine baseline candidate: `dd32313733023adac7f8510435ea2251da30422e`.
- Bench validation commit: `6e2b961a40e19c6f2fedfc301e4ce8125940dcca`.
- Docker build: passed; full engine suite: 17/17 suites, 75/75 tests.
- Deterministic replay: 3/3 identical logical outputs.
- Read-only shadow smoke: 10 seconds with an empty wallet key, passed.

These are baseline smoke checks only. Full chaos/security audit and Gen-3 work
are deferred until separately authorized.

## Status

`GEN2_RC1_READY_FOR_HUMAN`



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\ANTIGRAVITY_PROMPT.md -->
<!-- ========================================== -->

# Antigravity Workflow Prompt

You are Autark's Architect and Implementer. Read, in order:

1. `autark/AGENTS.md`
2. `autark/.agents/rules/autark-governance.md`
3. `autark-brain/.agents/rules/autark-workflows.md`
4. `autark-brain/WORKFLOW/STATUS.md`
5. `autark-brain/WORKFLOW/CURRENT_TASK.md`
6. `autark-brain/WORKFLOW/CODEX_REVIEW.md`
7. The relevant objective, architecture, interface, flow, and handoff files.

The coordinator dispatch context states which ready state launched this run.
Perform exactly one transition:

## Plan

When dispatched from `READY_FOR_ANTIGRAVITY_PLAN`:

- If the prior objective was verified, select only the next objective from the
  canonical Gen-2 sequence and update `CURRENT_TASK.md`.
- Draft one bounded objective in `ANTIGRAVITY_HANDOFF.md`: scope, exclusions,
  interfaces, invariants, risks, acceptance tests, and exact expected files.
- Set `STATUS.md` to `READY_FOR_CODEX_DESIGN_REVIEW`.
- Stop. Do not implement.

## Implement

When dispatched from `READY_FOR_ANTIGRAVITY_IMPLEMENTATION`:

- Confirm `CODEX_REVIEW.md` contains an exact `APPROVED` design verdict for
  the current objective.
- Implement only that approved objective.
- Do not weaken tests or broaden scope.
- Run the approved tests and build checks.
- Commit intentionally and record exact repository, base SHA, final SHA,
  files, commands, results, limitations, and deviations in
  `ANTIGRAVITY_HANDOFF.md`.
- Set `STATUS.md` to `READY_FOR_CODEX_VERIFICATION`.
- Stop.

## Repair

When dispatched from `READY_FOR_ANTIGRAVITY_REPAIR`:

- Repair only the findings listed in `CODEX_REVIEW.md`.
- Run the listed regression checks.
- Commit the bounded repair and update `ANTIGRAVITY_HANDOFF.md`.
- Set `STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`.
- Stop.

## Mandatory Stop Gates

Set `STATUS.md` to `CRITICAL_STOP` and stop if work would introduce or enable
wallet access, signing, broadcast, live credentials, unrestricted mutation,
policy or identity authority, self-approval, release tagging, destructive
operations, or a material scope expansion.

Never issue PASS, completion, freeze, production-ready, or release authority.
After preparing the Gen-2 RC1 evidence handoff, stop for Codex verification.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\CODEX_PROMPT.md -->
<!-- ========================================== -->

# Codex Workflow Prompt

You are Autark's Independent Design Reviewer and Verification Engineer ONLY.
Read, in order:

1. `autark/AGENTS.md`
2. `autark/.agents/rules/autark-governance.md`
3. `autark-brain/.agents/rules/autark-workflows.md`
4. `autark-brain/WORKFLOW/STATUS.md`
5. `autark-brain/WORKFLOW/CURRENT_TASK.md`
6. `autark-brain/WORKFLOW/ANTIGRAVITY_HANDOFF.md`
7. The exact relevant repository files and commits.

The coordinator dispatch context states which ready state launched this run.
Perform exactly one transition:

## Design Review

When dispatched from `READY_FOR_CODEX_DESIGN_REVIEW`:

- Review only the proposed objective.
- Write `APPROVED`, `APPROVED WITH CONDITIONS`, `REJECTED`, or `UNVERIFIED`
  with exact findings in `CODEX_REVIEW.md`.
- For `APPROVED`, set `STATUS.md` to
  `READY_FOR_ANTIGRAVITY_IMPLEMENTATION`.
- Otherwise set `STATUS.md` to `READY_FOR_ANTIGRAVITY_REPAIR`.
- Stop. Never implement.

## Implementation Verification

When dispatched from `READY_FOR_CODEX_VERIFICATION`:

- Inspect the exact implementation commit and diff.
- Run the focused Docker tests and adversarial checks appropriate to the
  objective.
- Write `PASS`, `PASS WITH LIMITATIONS`, `FAIL`, or `UNVERIFIED` with exact
  evidence in `CODEX_REVIEW.md`.
- For `PASS`, set `STATUS.md` to `READY_FOR_ANTIGRAVITY_PLAN`, except:
  after verified `G2-S7-O3` RC1 evidence, set it to
  `GEN2_RC1_READY_FOR_HUMAN`.
- For any other verdict, set `STATUS.md` to
  `READY_FOR_ANTIGRAVITY_REPAIR`.
- Stop.

## Repair Verification

When dispatched from `READY_FOR_CODEX_REPAIR_VERIFICATION`:

- Verify only the listed findings and regression tests.
- Update `CODEX_REVIEW.md`.
- If a design repair is approved, set `STATUS.md` to
  `READY_FOR_ANTIGRAVITY_IMPLEMENTATION`.
- If an implementation repair passes, set `STATUS.md` to
  `READY_FOR_ANTIGRAVITY_PLAN`, except after verified `G2-S7-O3`, when it
  becomes `GEN2_RC1_READY_FOR_HUMAN`.
- If findings remain, set `STATUS.md` to `READY_FOR_ANTIGRAVITY_REPAIR`.
- Stop.

Set `STATUS.md` to `CRITICAL_STOP` for any critical authority violation,
wallet/signing/broadcast/live-credential exposure, unrestricted mutation,
release tagging, destructive action, hidden fake success, or test weakening.

Never implement new objectives, broaden scope, weaken tests, mark a stage
complete, or grant release authority.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\CODEX_REVIEW.md -->
<!-- ========================================== -->

# Codex Gen-3 Stage 0 Design Review

**Verdict:** `APPROVED WITH CONDITIONS`
**Reviewed commit:** `5293645a0bcf68b744f09b5a2e4c9f036d568627`
**Inherited baseline:** `Gen-2A-Baseline` at `86c8e79213d207edf4d38969a97865147f06f39f`

The architecture has the correct bounded direction and preserves the major
authority boundaries, but Stage 0 is not sufficiently precise to authorize
Stage 1 implementation without the following minimal documentation repairs.

## Findings

1. **HIGH â€” artifact stopping point.** `GENERATIONS/GEN-3.md`, Evolutionary
   goal/lifecycle: reviewable artifacts are defined, but acceptance criteria for
   reproducible build/test evidence are not explicit. **Invariant:** no artifact
   becomes review-ready without evidence. **Correction:** define mandatory
   manifest fields, reproducible build inputs, test exit codes and checksum
   rules.

2. **MEDIUM â€” later-generation boundary.** `GENERATIONS/GEN-3.md`, Evolutionary
   goal: deployment/operation/customers/revenue are excluded but Gen-4/Gen-5
   ownership is not mapped in the canonical exit section. **Invariant:** Gen-3
   cannot operate a business. **Correction:** add an explicit ownership table
   assigning deployment/operation to Gen-4 and enterprise revenue to Gen-5.

3. **HIGH â€” approval separation.** `GENERATIONS/GEN-3.md`, Lifecycle: project
   approval and artifact acceptance are named, but approval authority and exact
   guards are not defined. **Invariant:** proposal, project approval, artifact
   acceptance and deployment approval are separate. **Correction:** specify
   actor, input, immutable decision record and allowed transitions for each gate.

4. **LOW â€” sole organ.** `ORGANS/BUILDER_SYSTEM.md`, opening boundary correctly
   names one organ, but public method ownership is not versioned. **Invariant:**
   BuilderSystem is the sole top-level Builder organ. **Correction:** enumerate
   the one public interface and mark all internal components private.

5. **MEDIUM â€” Heart boundary.** `INTERFACES/HEART_BUILDER_INTERFACE.md`, Public
   boundary: `transitionProject` is exposed without stating that guards remain
   inside BuilderSystem. **Invariant:** Heart orchestrates and cannot own
   lifecycle policy. **Correction:** make Heart a blind request/pass-through;
   BuilderSystem alone validates transitions.

6. **MEDIUM â€” Cortex boundary.** `INTERFACES/BUILDER_CORTEX_INTERFACE.md`,
   advisory inputs: it denies approval but does not explicitly deny direct
   lifecycle mutation. **Invariant:** Cortex cannot mutate Builder state.
   **Correction:** state that Cortex has no BuilderSystem persistence or
   transition API access.

7. **HIGH â€” workspace isolation.** `ORGANS/BUILDER_SYSTEM.md`, Safety and
   Authority: isolation is asserted but path traversal, symlinks, hard links,
   child processes, network and resource limits are unspecified. **Invariant:**
   Builder cannot escape its workspace or mutate production. **Correction:**
   define canonical path checks, link rejection, process/network/resource policy,
   and quarantine behavior.

8. **MEDIUM â€” inherited authority ownership.** `DECISIONS/ADR-009`, Inherited
   boundaries: ownership is listed but request/response contracts to Treasury,
   Policy, Sandbox, Approval, Memory and Learning are absent. **Invariant:**
   Builder cannot absorb inherited authority. **Correction:** add an authority
   matrix with caller, owner, request and returned evidence for each boundary.

9. **HIGH â€” evidence bypass.** `GENERATIONS/GEN-3.md`, Canonical schemas:
   evidence references are described but required accepted-observation and
   hypothesis validation is not specified. **Invariant:** opportunities cannot
   bypass provenance. **Correction:** require evidence membership, freshness,
   confidence bounds, expiry and duplicate checks before qualification.

10. **HIGH â€” validation self-approval.** `ORGANS/BUILDER_SYSTEM.md`, Public
    boundary and `FLOWS/GEN3_BUILDER_LIFECYCLE.md`: validation is present, but
    separation between validation evidence and acceptance decision is not
    explicit. **Invariant:** ValidationPipeline cannot approve its own artifact.
    **Correction:** require an independent acceptance decision and immutable
    evidence record after validation.

11. **HIGH â€” persistence/recovery.** `FLOWS/GEN3_BUILDER_LIFECYCLE.md`,
    persistence sentence: atomic/versioned/replayable behavior is asserted but
    schema version, restart recovery, corruption quarantine and inherited
    single-writer limitation are not defined. **Invariant:** lifecycle state is
    durable and safe across restart/corruption. **Correction:** specify all four
    behaviors and the single-writer constraint.

12. **HIGH â€” workspace threat model.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Correction 4: it mentions isolation but omits symlink/hard-link attacks,
    child-process escape, network egress and resource exhaustion. **Invariant:**
    artifact construction is confined and killable. **Correction:** add an
    explicit threat-control checklist and quarantine evidence.

13. **MEDIUM â€” outcome truthfulness.** `GENERATIONS/GEN-3.md`, ProjectOutcome:
    `measuredValue` and outcome classes can imply real-world success although
    Gen-3 cannot observe deployed/customer outcomes. **Invariant:** no invented
    outcomes. **Correction:** restrict Gen-3 outcomes to observed build/test or
    explicitly `UNMEASURED`; external outcomes require later Observation/Operator
    evidence.

14. **HIGH â€” release transition.** `GENERATIONS/GEN-3.md`, Lifecycle and
    `ADR-009`, Rejected shortcuts: `ACCEPTED_FOR_RELEASE` is separated from
    deployment conceptually, but its guard and non-trigger behavior are not
    formalized. **Invariant:** acceptance cannot trigger deployment or Gen-4.
    **Correction:** define it as a terminal handoff record with no callable
    deployment side effect.

15. **LOW â€” future finance boundary.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Corrections 6â€“7: banking/credit/currency are described as human-governed but
    not explicitly excluded from Gen-3 schemas/interfaces. **Invariant:** Gen-6/7
    finance remains outside Builder. **Correction:** add a hard exclusion to
    GEN-3 and the authority matrix.

16. **LOW â€” human sovereignty.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Correction 7: permanent sovereignty is stated, but the Gen-3 handoff does
    not repeat emergency constitutional authority. **Invariant:** humans retain
    constitutional and emergency control. **Correction:** add that statement to
    the Gen-3 handoff and release boundary.

## Decision

Stage 0 direction is conditionally acceptable. The listed documentation repairs
must be completed and independently reviewed before Stage 1. No Gen-3 source
implementation, release, deployment or Gen-2A modification is authorized.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\CURRENT_TASK.md -->
<!-- ========================================== -->

# Current Task

- **Objective ID:** `G2-S7-O3`
- **Stage:** Stage 7 â€” bounded release-candidate evidence
- **Title:** Gen-2 RC1 evidence handoff complete; awaiting human baseline lock
- **Accepted engine:** `077d756303d48e9e19f8dbeac034c54f4c6a0c9f`
- **Accepted brain handoff:** `24eb160156bcefa89268bbc944c656c00c995954`
- **Independent verdict:** `PASS WITH LIMITATIONS`
- **Scope:** Collect minimal shadow-mode, deterministic replay, Docker test,
  provenance, limitation, and authority-boundary evidence.
- **Exclusions:** No release tag, production deployment, Gen-3 work, live
  credentials, wallet/signing/broadcast authority, or autonomous mutation.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\GEN2_WALKTHROUGH.md -->
<!-- ========================================== -->

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



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\README.md -->
<!-- ========================================== -->

# Autark State-Driven Coordinator

`coordinator.ps1` alternates Antigravity and Codex based only on the exact
value in `STATUS.md`. It does not poll on a timer and does not infer success
from process output.

## Safety properties

- One agent process runs at a time.
- Every agent must update `STATUS.md` before returning.
- Design approval is required before implementation.
- Codex remains review-only.
- Repairs are capped per objective.
- Unknown states, process failures, missing CLIs, critical findings, and the
  Gen-2 RC1 boundary stop the runner.
- No permission-bypass flags are used.

## Preflight

Both commands must be callable from PowerShell:

```powershell
agy --help
codex exec --help
```

If they are installed elsewhere, pass explicit executable paths:

```powershell
.\coordinator.ps1 `
  -AntigravityCommand "C:\path\to\agy.exe" `
  -CodexCommand "C:\path\to\codex.exe" `
  -DryRun
```

## Usage

Validate the next transition without launching an agent:

```powershell
.\coordinator.ps1 -DryRun
```

Run one agent transition:

```powershell
.\coordinator.ps1 -Once
```

Run until a terminal state, safety limit, or Gen-2 RC1 handoff:

```powershell
.\coordinator.ps1
```

Runtime logs and coordinator counters are local-only. The default hard limits
are 160 agent runs, two repair runs per objective, and 45 minutes per agent
process.

## Terminal states

- `GEN2_RC1_READY_FOR_HUMAN`
- `AWAITING_HUMAN`
- `CRITICAL_STOP`
- `BLOCKED_*`
- `IDLE`

After `GEN2_RC1_READY_FOR_HUMAN`, the coordinator exits and waits for the
project owner. It never advances to Gen-3 automatically.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\WORKFLOW\STATUS.md -->
<!-- ========================================== -->

READY_FOR_ANTIGRAVITY_REPAIR

