# Gen-3 Builder — Stage 0 Architecture Reconciliation

**Status:** Stage 0 design in progress; documentation only
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
