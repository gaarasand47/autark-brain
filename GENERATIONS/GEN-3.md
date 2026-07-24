# Gen-3 Builder — Stage 0 Architecture Reconciliation

**Status:** Stage 1 narrow vertical slice in progress under independent review
**Inherited baseline:** Gen-2A-Baseline, PASS WITH LIMITATIONS

## Evolutionary goal

Gen-3 transforms evidenced opportunities into tested, documented and reviewable
digital artifacts through a bounded project lifecycle. It is not an autonomous
company, operator, deployer, customer-contact system, lender, trader or source
mutation engine.

```text
Observation/Hypothesis → OpportunityCandidate → bounded Project
→ Specification → isolated Build → Validation → Review Package
→ Human release decision → measured outcome → Memory/Learning
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
PROPOSED → EVALUATING → QUALIFIED → AWAITING_PROJECT_APPROVAL
→ APPROVED → PLANNING → BUILDING → TESTING → READY_FOR_REVIEW
→ ACCEPTED_FOR_RELEASE → MEASURING → COMPLETED
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

## G3-S1-O2 — Project lifecycle (design only)

Define a versioned `Project` record referencing one qualified
`OpportunityCandidate`, immutable scope/exclusions, budget and cognitive
ceilings, acceptance criteria, required capabilities, provenance and lifecycle
status. Define guarded transitions through the documented active states and
terminal failure states. Each transition records actor, decision, evidence
references, previous/new version, timestamp and correlation ID.

Persistence must be atomic and versioned with one-writer/process semantics.
Recovery selects the last valid version, quarantines corruption and returns an
explicit unavailable result. Replay is deterministic. Scope excludes artifact
construction, deployment, operation, customers, purchases, Treasury,
wallet/signing/broadcast, production mutation, policy, identity and approval
authority. Focused adversarial tests must cover schema bounds, every guard,
restart recovery, quarantine, idempotency and authority exclusion.

## Stage 0 repair invariants (normative)

The following conditions are mandatory for every implementation objective:

- evidence references must resolve to immutable observations, match identity
  and fingerprint, remain within freshness/expiry bounds, and preserve source
  provenance; missing or malformed evidence rejects the candidate;
- `BuilderSystem` is the only Builder organ. Heart may invoke its public
  methods, while Cortex supplies advisory input and cannot transition state;
- project approval, artifact acceptance and any later deployment decision are
  distinct records and authorities. `ACCEPTED_FOR_RELEASE` is a non-deploying
  handoff state;
- artifacts are built only in a canonical isolated workspace. Traversal,
  symlink/hard-link escape, child-process/network access, resource exhaustion,
  or quarantine failure fails closed; production paths are immutable;
- persistence uses atomic, versioned records with restart recovery and
  corruption quarantine, inheriting the single-writer limitation;
- ValidationPipeline emits evidence only and cannot approve its own output;
- OutcomeTracker records only outcomes supported by observable evidence and
  may not invent customer, revenue or deployment results;
- Treasury, Policy, Sandbox, Approval, Memory and Learning retain their
  existing ownership. Builder has no execution, spending, signing,
  broadcast, mutation, policy, identity or approval authority;
- human constitutional sovereignty is permanent. Gen-6/7 banking, credit and
  currency remain simulation-first and human-governed, outside Gen-3.

### O2 normative schema and guards

`Project` fields: `id`, `candidateId`, `scope`, `exclusions`,
`budgetCeiling`, `cognitiveBudget`, `risk`, `acceptanceCriteria`,
`requiredCapabilities`, `status`, `version`, `createdAt`, `updatedAt`,
`provenanceHash`, and `authority:'NONE'`. IDs/strings are non-empty;
budgets are finite `[0,1e9]`, risk is finite `[0,1]`, version is a positive
integer, timestamps are UTC, and arrays are bounded. Candidate membership
requires a qualified candidate, matching provenance hash, unexpired evidence,
and freshness at creation.

Allowed transitions are exactly
`PROPOSED→EVALUATING→QUALIFIED→AWAITING_PROJECT_APPROVAL→APPROVED→PLANNING→BUILDING→TESTING→READY_FOR_REVIEW→ACCEPTED_FOR_RELEASE`.
Any non-terminal state may fail to `REJECTED|BLOCKED|FAILED|CANCELLED|ROLLED_BACK|RETIRED`; terminal states have no outgoing edges. Builder evaluates guards;
Approval authorizes project approval; human release authority authorizes
acceptance. Heart is pass-through and Cortex cannot transition. Idempotency
keys make exact replays no-ops; changed payloads conflict; stale versions
reject.

Persistence has an explicit schema version, atomic record/version-marker
commit, highest contiguous valid-version recovery, and quarantine names
`project-quarantine.<clock>.<id>` carrying source hash/reason. Recovery returns
`{status:'UNAVAILABLE', reason, snapshotVersion:null}` on corruption. Replay
input is the ordered transition log plus deterministic clock/ID seeds.

Tests must assert every edge, skipped/terminal/unauthorized/stale/conflict
transitions, malformed bounds, candidate evidence expiry/membership mismatch,
restart recovery, quarantine naming, idempotency, unavailable envelope shape,
and a static scan proving no execution/Treasury/wallet/signing/broadcast/
mutation/policy/identity/approval calls.

## G3-S1-O3 — Project specification (design only)

Define an immutable `ProjectSpecification` linked to exactly one approved
Project: objective, scope hash, deliverables, exclusions, acceptance criteria,
capability references, bounded acyclic task graph, budget allocation and
provenance. IDs/hashes are non-empty; budgets are finite non-negative and sum
within the Project ceiling; tasks reference only registered capabilities.
Creation requires `APPROVED` status with matching version/provenance.
Tests cover malformed bounds, foreign capabilities, cycles, duplicate tasks,
budget overflow, version mismatch, deterministic replay and immutability.
No execution, artifact build, deployment, customer, Treasury, wallet,
signing, broadcast, production mutation, policy, identity or approval authority.
