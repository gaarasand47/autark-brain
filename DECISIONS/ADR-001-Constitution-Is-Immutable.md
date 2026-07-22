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
- *External Supervisor Agent:* Having a second AI watch the first AI. Rejected because it introduces infinite regress—who watches the watcher?

## Consequences
- The `EvolutionManager` must strictly diff proposals against the Constitution and reject non-compliant mutations before they even reach human approval.
- We sacrifice some potential hyper-optimization because the 20% profit sweep and cognitive limits cannot be removed.

## Future Mutability
Never. Gen-4 may *add* laws, but it can never repeal the foundational ones.
