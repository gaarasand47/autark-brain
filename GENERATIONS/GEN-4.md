# Gen-4 Operator Architecture (Stage 0)

Status: documentation-only; awaiting independent Codex design review.

Gen-4 turns a tested Gen-3 artifact into a bounded, observable operator service. It may deploy and operate approved artifacts only through explicit policy, budget, sandbox, and human-approval gates. It does not acquire customers, sell, borrow, sign, broadcast, mutate production code, or exercise constitutional authority.

## Required components

- OperatorSystem: one top-level organ coordinating deployment, service, maintenance, and incident workflows.
- DeploymentManager, ServiceSupervisor, MaintenanceScheduler, IncidentManager: private components.
- ProtectedActionGateway remains the sole route to protected actions; live credentials are leased, scoped, revocable, and never persisted in plaintext.
- Immutable provenance for every intent, artifact, credential lease, deployment, health observation, rollback, and human decision.

## Canonical envelopes and guards

`OperatorIntent {intentId, artifactHash, environment, capabilitySet, budgetCents, policyVersion, approvalRef, evidenceHash, expiresAt, rollbackTarget}` and `LifecycleTransition {from, to, actor, authority, reason, evidenceHash, version, occurredAt}` are immutable and schema-versioned. Guards reject stale versions, expired approvals, missing evidence, budget overflow, unapproved capabilities, dependency drift, invalid environment, and non-monotonic transitions. Recovery is atomic, idempotent, single-writer, and quarantines corrupt state.

## Lifecycle

`PROPOSED → APPROVED → STAGED → CANARY → ACTIVE → PAUSED → ROLLING_BACK → RETIRED`.
Transitions require typed evidence and their owning authority. Deployment approval, service operation, maintenance approval, and incident recovery are separate decisions.

## Stage boundaries

Stage 0 defines and reviews architecture. Stage 1 implements one narrow digital-artifact operator slice in a zero-value/test environment. Later stages may run a four-day human-observed pilot only after independent verification and authorization.

## Explicit exclusions

No customer communication, sales, contracts, pricing, revenue, autonomous purchasing, borrowing/lending, portfolio management, multi-organism society, banking/credit/currency, replication, unrestricted self-modification, or removal of permanent human constitutional sovereignty.

## Exit criteria

Documentation is complete, interfaces are versioned, authority matrix is explicit, security/DR/observability controls are testable, pilot entry/exit is defined, and independent review is APPROVED or APPROVED WITH CONDITIONS. No production implementation is authorized by this document.

Dependency, privacy, backup-restore, human-intervention, and four-day pilot evidence are mandatory before any later stage.
# Strategic completion gate

Gen-4 is not complete when OperatorSystem exists. The defining verified loop is: accepted useful artifact → persistent multi-day mission → deployment proposal and separate approval → real deployment → health verification → continuous observation → bounded low-risk maintenance → recovery or rollback → measured operational outcome → learning feedback. At least one useful artifact must remain operational through the pilot. Gen-4 targets E2 operated value and may support E3 only with human commercial assistance; customer/revenue autonomy is Gen-5.

All Gen-4 Stage 0 reviews must include the Vision Drift Check and temporal hierarchy (Mission, Phase, Milestone, Task, Action proposal), with deterministic resume, drift detection, completion proof and no authority bypass.
