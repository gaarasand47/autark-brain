# ADR-009: Gen-3 Builder Boundary

**Status:** Proposed — Gen-3 Stage 0

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
## Binding actor and authority contract

Every lifecycle transition records `actor`, `decision`, `evidenceRefs`,
`previousVersion`, `newVersion`, timestamp and correlation ID. Heart is a
blind pass-through and never decides or mutates Builder state. Builder owns
guards but has no approval authority. Cortex is advisory only. Project
approval, artifact acceptance and deployment approval are separate decisions.
Treasury, Policy, Sandbox, Approval, Memory and Learning retain ownership;
Builder cannot execute, spend, sign, broadcast, mutate production, change
policy or identity. Human constitutional sovereignty is permanent.

`ACCEPTED_FOR_RELEASE` is terminal for Gen-3 and has no deployment side effect.
An outcome not supported by externally observed evidence is `UNMEASURED`.
