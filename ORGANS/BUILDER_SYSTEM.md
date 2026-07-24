# BuilderSystem Organ Specification

**Status:** Proposed — Gen-3 Stage 0

BuilderSystem is the sole Gen-3 Builder organ. Internal components are not
top-level organs and cannot be invoked by Heart, Cortex or external callers.

## Public boundary

- evaluate evidenced opportunity candidates;
- create or recover bounded projects after the approval gate;
- advance guarded lifecycle transitions;
- construct artifacts only in isolated project workspaces;
- request validation and produce a review package;
- record measured outcomes after an external/human decision.

## Internal components

OpportunityEvaluator, ProjectManager, ArtifactFactory, ValidationPipeline,
ReleasePackager and OutcomeTracker.

## Safety and failure

Missing evidence, invalid schemas, stale observations, budget exhaustion,
workspace escape, failed tests, corrupted persistence or invalid transitions
must fail closed to `REJECTED`, `BLOCKED` or `FAILED` with provenance. Partial
artifacts remain quarantined and cannot become review-ready.

## Authority

BuilderSystem has no Treasury, wallet, signing, broadcast, deployment,
production mutation, policy, identity, approval or customer-communication
authority. It may request those bounded external decisions through interfaces.
