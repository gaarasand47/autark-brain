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
