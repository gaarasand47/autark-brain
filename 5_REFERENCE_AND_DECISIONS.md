

<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-001-Constitution-Is-Immutable.md -->
<!-- ========================================== -->

# ADR-001: Constitution Is Immutable

## Status
Frozen (Gen-0)

## Context
As the organism evolves, it will rewrite its own source code and change its behavior based on evidence. However, if it can rewrite *everything*, it could optimize away safety constraints, profit sweeps, or human oversight in the name of efficiency.

## Decision
We establish a `CONSTITUTION.md` and a set of `LAWS` that are explicitly defined as immutable DNA. The organism is architecturally forbidden from bypassing or proposing mutations that alter these files or the core mechanisms that enforce them (e.g., `Treasury`, `ApprovalGateway`).

## Why
Without an immutable root, long-term safety and economic alignment are impossible. The organism must be physically constrained by its architecture, not just "prompted" to be good.

## Alternatives Considered
- *Prompt Engineering:* Asking the LLM in the `Cortex` to always respect safety. Rejected because prompts degrade over long contexts and are susceptible to injection.
- *External Supervisor Agent:* Having a second AI watch the first AI. Rejected because it introduces infinite regressâ€”who watches the watcher?

## Consequences
- The `EvolutionManager` must strictly diff proposals against the Constitution and reject non-compliant mutations before they even reach human approval.
- We sacrifice some potential hyper-optimization because the 20% profit sweep and cognitive limits cannot be removed.

## Future Mutability
Never. Gen-4 may *add* laws, but it can never repeal the foundational ones.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-002-Cognitive-Budget.md -->
<!-- ========================================== -->

# ADR-002: Cognitive Budget

## Status
Stable (Gen-1)

## Context
Intelligence costs money. In Gen-0, the organism could enter infinite loops of self-reflection or error recovery, burning through LLM API tokens rapidly without generating any offsetting revenue.

## Decision
We establish a `CognitiveBudget` within the `Treasury`. The organism may only spend a maximum of 20% of its retained revenue on internal cognition (Dreaming, Reflection, Learning).

## Why
If the organism spends more on thinking than it earns, it is economically unviable. Capping cognition ensures that the organism must return to the `EXECUTE` state to earn more capital before it is allowed to think deeply again.

## Alternatives Considered
- *Hard Token Limits:* Capping the organism at 10,000 tokens a day. Rejected because it doesn't scale. If the organism is earning $1,000/day, it should be allowed to spend more on thinking than if it earns $1/day.
- *Free Cognition:* Using only local open-source models for thinking. Rejected because local models still consume physical electricity/compute, which has an underlying cost that must be paid.

## Consequences
- The organism will occasionally be forced to act "stupidly" (skipping the `DreamEngine` or `ReflectionEngine`) if it is broke. It must rely on hardcoded skills until it earns enough to think again.

## Future Mutability
The percentage (20%) may be adjusted by evolution, but the existence of a budget is immutable.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-003-Simulator-First-Dreaming.md -->
<!-- ========================================== -->

# ADR-003: Simulator-First Dreaming

## Status
Experimental (Gen-1)

## Context
When the organism generates a new hypothesis or code mutation, it needs to know if it works. Running untested code in the live environment risks destroying databases, executing bad trades, or violating the `Law of Safety`.

## Decision
All unverified logic must first run in the `DreamEngine`â€”an isolated simulator that mocks external API boundaries and injects synthetic scenarios based on past failures.

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



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-004-Semantic-Memory-Design.md -->
<!-- ========================================== -->

# ADR-004: Semantic Memory Design

## Status
Stable (Gen-1)

## Context
When the organism encounters a new situation, it needs context. If we shove every past interaction into a vector database, the context window fills with redundant, contradictory, and useless historical logs, drastically increasing token costs and decreasing reasoning quality.

## Decision
We stratify memory. `WorkingMemory` holds the current pulse. `EpisodicMemory` holds the permanent log. `SemanticMemory` extracts abstract, probabilistic rules (e.g., "API X fails on weekends") from episodes and ranks them with a `confidenceScore`.

## Why
Semantic rules are dense. They provide the "lesson" without the baggage of the raw experience. This keeps the prompt context small and highly relevant.

## Alternatives Considered
- *Raw RAG (Retrieval-Augmented Generation):* Storing all text logs in a vector DB and retrieving the top 5 nearest neighbors. Rejected because raw logs do not contain explicit "lessons", forcing the LLM to deduce the lesson from the raw log every single time, wasting compute.

## Consequences
- Requires the `ReflectionEngine` to constantly run during `SLEEP` to convert new episodes into semantic rules.
- Semantic rules can become outdated if the external world changes (e.g., the API fixes its weekend bug).

## Future Mutability
We will likely introduce clustering algorithms in Gen-4 to merge highly similar semantic rules into singular, generalized meta-rules.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-005-Evidence-Based-Learning.md -->
<!-- ========================================== -->

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



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-006-Why-No-Instincts-In-Gen1.md -->
<!-- ========================================== -->

# ADR-006: Why No Instincts in Gen-1

## Status
Frozen (Gen-1)

## Context
When designing Gen-1, there was a strong temptation to immediately wire the `Treasury` balance into the `Planner` to give the organism a "drive" to make money. 

## Decision
We explicitly delayed all Instinct/Drive integrations to Gen-2. Gen-1's execution is purely reactive based on goals provided in its configuration or environmental triggers.

## Why
Adding biological drives (Hunger, Curiosity, Anxiety) introduces massive non-linear complexity. If Gen-1 had a memory leak AND a hunger drive, we would not know if the organism was crashing because it was broken, or if it was acting erratically because it was "starving". We must isolate variables. Gen-1 proves that Memory, Dreaming, and Reflection work deterministically. Only then can we safely introduce non-linear biological drives.

## Alternatives Considered
- *Hardcoding Goals:* Giving the organism a hardcoded rule: "If Treasury < $10, run trading skill." Rejected because that is a script, not an organism. The organism must *feel* the deficit and dynamically plan a solution.

## Consequences
- Gen-1 will happily sit idle and do nothing if the environment does not prompt it with an opportunity, even if its Treasury is slowly being eaten by server costs.

## Future Mutability
Will be entirely superseded by Gen-2, which focuses exclusively on the Need/Drive matrix.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-007-Continuous-Biological-Heartbeat.md -->
<!-- ========================================== -->

# ADR-007: Continuous Biological Heartbeat Over Job Queue

**Date:** July 23, 2026
**Status:** Accepted

## 1. Context
Autark's Gen-1 execution loop was initially structured as a traditional asynchronous Job Queue. The `WorkerLoop` would eagerly poll the database and lock execution in a `while` loop until a task was completed (`while (currentState !== SLEEP)`). 

This design created several architectural failures:
- **Comatose Boot:** The organism could not boot its capabilities unless it had a task in the queue.
- **Unreachable Maintenance:** The moment a task finished, the loop terminated, bypassing over 100 lines of critical biological maintenance logic (`DreamEngine`, `SemanticMemory` extraction, `SQLite WAL Checkpoint`). 
- **Orphaned Tasks on Crash:** A mid-execution crash would leave a task stranded in `ARTIFACT_GENERATED` because the queue only dequeued `QUEUED` tasks.

## 2. Decision
We refactored `WorkerLoop.ts` and `Heart.ts` to implement a true **Continuous Biological Heartbeat**.

1. **Pulse, Not Loop:** `WorkerLoop` simply calls `runHeart(state)` once every 1,000ms. It does not enforce completion. It only provides the physical electrical pulse.
2. **Autonomous State Progression:** `Heart.ts` fully dictates its own biological state (`BOOT -> OBSERVE -> THINK -> ... -> SLEEP`).
3. **Dynamic Task Resumption:** During the `OBSERVE` state, the `Heart` dequeues *any* active task whose lease has expired, mapping its database status (`GENERATE`, `SANDBOX`, etc.) directly back to the biological state to resume execution seamlessly.

## 3. Consequences
- **Positive:** The organism successfully mimics a biological life-cycle. It boots autonomously, rests when idle, dreams and learns from failures, and flawlessly recovers from mid-flight power failures.
- **Negative:** The 1-second pulse introduces a guaranteed 1,000ms latency between every single state transition (e.g. `THINK` to `AUTHORIZE`). This artificial delay limits high-frequency trading capabilities, but enforces the strict biological constraints required for safety.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-008-GEN2-DRIVE-ARCHITECTURE.md -->
<!-- ========================================== -->

# ADR-008: Gen-2 Drive Subsystem & Heart Boundary Architecture

**Status:** Proposed (Gen-2 Stage 0 Design Review â€” Reconciled)  
**Date:** 2026-07-23  
**Deciders:** Antigravity (Architect), Codex (Independent Reviewer), Anas (Project Lead)  
**Reconciles:** `ROADMAP.md` (Gen-2 section) & `DECISIONS/ADR-006-Why-No-Instincts-In-Gen1.md`  

### Baseline Provenance & Branching Origin
- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## 1. Context & Attribution of Historical Conflict

In Gen-1 documentation, the future introduction of instincts and drives for Gen-2 was described as follows:
- `ROADMAP.md` (line 28) historically stated: *"Introduction of the Need/Drive matrix in the Heart."*
- `ADR-006` deferred instincts to Gen-2, rejected hardcoded execution scripts, and forecasted that Gen-1's idle behavior would be *"entirely superseded by Gen-2"*.

**Correction & Attribution:**
- `ADR-006` did NOT specify placing the Need/Drive matrix inside `Heart.ts`; that placement originated solely from `ROADMAP.md`.
- `ADR-006`'s core decision â€” deferring instincts to Gen-2 and prohibiting hardcoded scripts â€” remains 100% intact.
- `ADR-008` realizes and clarifies `ADR-006`'s Gen-2 intent, superseding only its *"entirely superseded"* forecast sentence.
- The historical placement of the Need/Drive matrix inside `Heart` from `ROADMAP.md` is superseded by this ADR.

---

## 2. Decision & Architecture Boundaries

1. **Heart Ownership Boundary:**
   - `Heart.ts` **does NOT own** drive formulas, need normalization, confidence calculations, arbitration rules, hysteresis, decay, or goal proposal logic.
   - `Heart.ts` **only invokes** the public `InstinctSystem` interface (`evaluate`, `getEvaluationResult`, `acknowledgeProposal`, `persistState`, `recoverState`).

2. **Principal Organ & Internal Enclosure:**
   - Create exactly **one principal top-level organ**: **`InstinctSystem`**.
   - `InstinctSystem` internally encapsulates three private subcomponents: `NeedMonitor`, `DriveEngine`, and `GoalProposalEngine`.
   - `InstinctSystem` owns motivational-state persistence and recovery.

3. **Canonical Authority Restriction Matrix:**
   - Drives have **ZERO authority** over: 1) execution dispatch, 2) Treasury spending/reservation, 3) Vault/signing/broadcast APIs, 4) production mutation/deployment, 5) policy/constitution rewriting, 6) identity governance, 7) self-approval of goals or evolution.

4. **Monotonic Risk Ceiling Rule (Hunger):**
   - Greater Hunger must NEVER permit greater financial risk. As Treasury scarcity increases, permitted risk ceilings, spending limits, and eligible objective classes MUST tighten monotonically.

5. **Approval Pipeline Semantics:**
   - Snapshot evaluation, drive calculation, and non-executable `GoalProposal` generation require **NO approval** (read-only internal cognition).
   - Approval requirements (`ApprovalGateway`, human signatures, policy rules) attach ONLY when a proposal is accepted into `Cortex` planning and crosses an execution, spending, mutation, deployment, credential, or protected-action boundary.

6. **Failure, Recovery & Atomicity Semantics:**
   - Upon evaluation failure, `InstinctSystem` emits a structural failure state (with `state.evaluationStatus: "UNAVAILABLE"`, `state.confidence: 0.0`, `state.dominantDrive: "NONE"`, and `proposals: []`) along with error telemetry. `Heart` MUST NOT synthesize a healthy-looking `NONE` state.
   - All persistence operations use single **atomic SQLite transactions**.
   - Corrupt or missing persisted state triggers quarantine and clean boot recovery fallback (`evaluationStatus: "UNAVAILABLE"`).

---

## 3. Consequences

### Positive
- Strict organ encapsulation of drive physiology inside `InstinctSystem`.
- Clean orchestrator boundary for `Heart.ts`.
- 100% deterministic testability and atomic state recovery.

### Negative / Trade-offs
- Additional public interface contract required between `Heart` and `InstinctSystem`.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\DECISIONS\ADR-009-GEN3-BUILDER-BOUNDARY.md -->
<!-- ========================================== -->

# ADR-009: Gen-3 Builder Boundary

**Status:** Proposed â€” Gen-3 Stage 0

## Decision

Create exactly one top-level `BuilderSystem` organ for converting evidenced
opportunities into isolated, tested, reviewable digital artifacts.

## Inherited boundaries

- ObservationEngine supplies read-only observations and hypotheses.
- Memory and Learning accept provenance-bearing outcomes; they do not authorize
  execution or invent evidence.
- Treasury evaluates/reserves budgets through its existing authority boundary.
- Policy and Constitution remain authoritative.
- Sandbox is the only construction/test execution environment.
- Approval remains the human gate for project acceptance and any release.

## Builder prohibitions

BuilderSystem cannot access private keys, sign, broadcast, spend directly,
deploy publicly, modify Autark production source, merge protected branches,
send customer communications, purchase services, rewrite policy/identity/
constitution, borrow, lend, issue currency or approve itself.

Builder workspace writes are confined to an isolated project workspace with a
manifest and checksum. A generated artifact is never a production mutation.

## Rejected shortcuts

- `ACCEPTED` does not mean deployed.
- A Cortex plan does not approve a project.
- A high opportunity score does not bypass evidence, budget or policy.
- `RELEASED` is intentionally absent from the Gen-3 lifecycle.

## Consequences

Gen-3 can demonstrate a complete opportunity-to-review-package loop while
deferring operation, customers, deployment and autonomous business to Gen-4/5.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\REFERENCE\Configuration.md -->
<!-- ========================================== -->

# Configuration

**Status:** `Stable` (Gen-1)

Autark requires specific environment variables to boot. If these are missing, the `Heart` will refuse to start.

## `process.env`

### Core Identity
- `AUTARK_CREATOR_ADDRESS`: The wallet address of the human owner. Used for profit sweeps and verifying cryptographic signatures during Evolution.
- `AUTARK_GENERATION`: E.g., `Gen-1`. Used to validate that the codebase matches the `IdentityCore` database.

### API Providers
- `OPENAI_API_KEY`: Required for the `Cortex` to function.
- `ANTHROPIC_API_KEY`: Fallback model provider.

### Execution Knobs
- `HEART_TICK_MS`: The interval of the biological pulse. Default: `60000` (1 minute).
- `DB_STORAGE_PATH`: Directory where SQLite databases are persisted. Default: `./data/`.

## Secrets Management
Autark does NOT read secrets from a `.env` file in production. Secrets must be injected via secure CI/CD runners or secure OS vaults. `config.ts` enforces strict typings and throws immediately if `AUTARK_CREATOR_ADDRESS` is missing.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\REFERENCE\DatabaseSchema.md -->
<!-- ========================================== -->

# Database Schema

**Status:** `Stable` (Gen-1)

Autark relies exclusively on local `better-sqlite3` databases to ensure deterministic, zero-latency persistence.

## 1. `treasury.db`
Manages the immutable ledger.
```sql
CREATE TABLE ledger_entries (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,          -- 'revenue', 'expense', 'sweep'
    amount REAL NOT NULL,
    currency TEXT NOT NULL,
    provider TEXT,               -- e.g., 'stripe', 'openai'
    reference_id TEXT,           -- Ties expense to an Episode ID
    status TEXT NOT NULL,        -- 'pending', 'settled'
    timestamp INTEGER NOT NULL
);
```

## 2. `memory.db`
Manages episodic and semantic persistence.
```sql
CREATE TABLE episodes (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,          -- 'success', 'failure', 'dream'
    timestamp INTEGER NOT NULL,
    summary TEXT NOT NULL,
    execution_result TEXT,
    metadata TEXT,               -- JSON blob
    token_cost REAL NOT NULL
);

CREATE TABLE semantic_rules (
    rule_id TEXT PRIMARY KEY,
    category TEXT NOT NULL,
    premise TEXT NOT NULL,
    conclusion TEXT NOT NULL,
    confidence_score REAL NOT NULL, -- 0.0 to 1.0
    decay_factor REAL NOT NULL,
    last_used_at INTEGER NOT NULL,
    evidence_episode_ids TEXT    -- JSON array of Episode IDs
);
```

## 3. `identity.db`
Stores the fundamental genetic constraints.
```sql
CREATE TABLE identity_core (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);
-- Pre-populated at Genesis:
-- ('generation', 'Gen-1')
-- ('creatorAddress', '0x...')
-- ('profitShareAddress', '0x...')
```



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\REFERENCE\DirectoryTree.md -->
<!-- ========================================== -->

# Directory Tree

**Status:** `Stable` (Gen-1)

The physical layout of the organism's codebase.

```text
autark/
â”œâ”€â”€ src/
â”‚   â”œâ”€â”€ index.ts                 # Bootstrapper
â”‚   â”œâ”€â”€ config.ts                # Environment loading
â”‚   â”œâ”€â”€ types.ts                 # Global TS Interfaces
â”‚   â”‚
â”‚   â”œâ”€â”€ core/                    # Immutable DNA components
â”‚   â”‚   â”œâ”€â”€ Constitution.ts
â”‚   â”‚   â””â”€â”€ IdentityCore.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ kernel/                  # The Execution Loop
â”‚   â”‚   â””â”€â”€ Heart.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ economy/                 # The Metabolism
â”‚   â”‚   â”œâ”€â”€ Treasury.ts
â”‚   â”‚   â””â”€â”€ Ledger.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ memory/                  # Stratified Knowledge
â”‚   â”‚   â”œâ”€â”€ WorkingMemory.ts
â”‚   â”‚   â”œâ”€â”€ EpisodicMemory.ts
â”‚   â”‚   â””â”€â”€ SemanticMemory.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ cognitive/               # Thinking & Simulation
â”‚   â”‚   â”œâ”€â”€ Cortex.ts            # LLM API Wrapper
â”‚   â”‚   â”œâ”€â”€ InferenceRouter.ts
â”‚   â”‚   â”œâ”€â”€ DreamEngine.ts
â”‚   â”‚   â”œâ”€â”€ ReflectionEngine.ts
â”‚   â”‚   â””â”€â”€ SkillCompiler.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ security/                # Protection
â”‚   â”‚   â””â”€â”€ Sandbox.ts
â”‚   â”‚
â”‚   â”œâ”€â”€ evolution/               # Reproduction & Mutation
â”‚   â”‚   â”œâ”€â”€ EvolutionManager.ts
â”‚   â”‚   â””â”€â”€ ApprovalGateway.ts
â”‚   â”‚
â”‚   â””â”€â”€ skills/                  # Hardcoded/Compiled Capabilities
â”‚       â”œâ”€â”€ observe.ts
â”‚       â””â”€â”€ ...
â”‚
â”œâ”€â”€ data/                        # Persistent SQLite Files
â”‚   â”œâ”€â”€ treasury.db
â”‚   â”œâ”€â”€ memory.db
â”‚   â””â”€â”€ identity.db
â”‚
â”œâ”€â”€ package.json
â””â”€â”€ tsconfig.json
```



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\REFERENCE\GENERATION_TIMELINE_REVIEW.md -->
<!-- ========================================== -->

# Gen-3 Proposal and Future Timeline Review

## Accepted direction

The proposed sequence is coherent:

```text
Gen-0 Body â†’ Gen-1 Mind â†’ Gen-2 Instinct â†’ Gen-2A Perception/Learning
â†’ Gen-3 Builder â†’ Gen-4 Operator â†’ Gen-5 Enterprise
â†’ Gen-6 Family/Society â†’ Gen-7 Constitutional Autonomous Society
```

It correctly separates building from operating and keeps banking, currency and
multi-organism society far beyond the first Builder.

## Corrections required

1. The supplied status estimate (`60â€“65%`, `30â€“35%`, `10â€“15%`) is strategic
   intuition, not a measured completion metric. It must not drive release or
   authority decisions.
2. Gen-3 must end at a reviewable artifact and human release decision. The word
   `RELEASED` is removed from the Gen-3 lifecycle because deployment belongs to
   Gen-4 Operator.
3. `AWAITING_PROJECT_APPROVAL` and `ACCEPTED_FOR_RELEASE` are distinct gates;
   Builder cannot approve itself or infer deployment permission.
4. `ArtifactFactory` workspace writes require isolation, checksums, manifest,
   resource limits and quarantine. They are not production source mutation.
5. Treasury, Policy, Sandbox, Approval and Memory retain ownership of their
   existing authority; Builder requests decisions rather than absorbing them.
6. Gen-5 external business behavior requires legal, credential, customer,
   financial and operational governance. It is not implied by a successful
   Gen-3 artifact loop.
7. Gen-6/7 banking, internal credit and currency remain simulation-first and
   human-governed. Permanent human constitutional sovereignty is retained.

## First vertical slice

The first Gen-3 artifact should be a non-deployed internal engineering utility
or report generator. It must begin from an evidenced opportunity, build only in
an isolated workspace, pass reproducible tests, produce a checksum-bearing
review package, and stop before deployment or customer contact.



<!-- ========================================== -->
<!-- BEGIN: D:\autark\autark-brain\REFERENCE\ORIGINAL_LIFE_ARCHITECTURE.md -->
<!-- ========================================== -->

# Original Life Architecture and Canonical Compass

**Status:** Strategic reference, restored 2026-07-24
**Authority:** Vision-level direction only. It does not authorize implementation.

Autark is an economic digital organism, not merely an autonomous coding agent.
Its fitness is measured by creating more value than it consumes, learning from
experience, improving safely, and eventually funding its own existence.

The governing loop is:

```text
Observe -> Remember -> Understand -> Imagine -> Improve -> Create Value
-> Earn -> Survive -> Observe Again
```

## Strategic phases

1. **Genesis:** deterministic constitution, wallet, ledger, sandbox, memory,
   planning, budget, policy, execution, events, identity, capabilities and
   security.
2. **Perception:** continuous observation of internal and external reality.
3. **Memory:** searchable short-term, working, long-term, semantic, episodic,
   skill, business, financial and failure memory.
4. **Learning:** automatic evidence-based retention, forgetting, hypothesis
   evaluation and improvement of strategies, prompts, planning and execution.
5. **Dreaming:** offline replay, simulation, synthesis and hypothesis creation;
   no real-world action.
6. **Self-evolution:** weakness observation, proposal, simulation, constitutional,
   security, economic and regression verification, then human approval.
7. **Autonomous business:** bounded opportunity discovery, product/service
   creation, operation, revenue and reinvestment.
8. **Collective intelligence:** specialized organisms with governed shared
   communication, memory, economy, constitution and goals.
9. **Artificial life:** self-maintenance and self-expansion under strict
   constitutional control; replication remains the final deferred capability.

This reference restores the strategic compass. Generation documents remain the
implementation authority and must explicitly map to this compass before work
begins.

