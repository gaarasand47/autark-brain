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
