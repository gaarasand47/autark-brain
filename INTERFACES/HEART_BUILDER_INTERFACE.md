# Heart ↔ BuilderSystem Interface

Heart schedules BuilderSystem operations and forwards immutable results. Heart
does not evaluate opportunities, own project state, calculate budgets, write
artifacts or decide approval.

The boundary must expose only bounded operations equivalent to:

- `evaluateOpportunity(candidate)`;
- `recoverProject(projectId)`;
- `transitionProject(projectId, transition)`;
- `build(projectId, specification)`;
- `validate(projectId)`;
- `createReviewPackage(projectId)`;
- `recordOutcome(outcome)`.

Every returned value is advisory/read-only. Treasury, Policy, Sandbox and
Approval remain separate authority boundaries.
## Boundary contract

Heart forwards immutable requests and returns immutable results without
interpreting or approving them. It never mutates lifecycle state, selects
transitions, or supplies approval. Builder owns guard evaluation; Approval
owns approval decisions. Every call carries correlation ID and evidence refs.
