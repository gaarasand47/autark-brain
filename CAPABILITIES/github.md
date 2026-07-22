# GitHub Capability

**Status:** `Experimental` (Gen-1)

## Permissions
- **Scope:** Read/Write access to the `autark` repository via API token.
- **Prohibited:** Overwriting history (force push), deleting the repository, modifying branch protection rules.

## Risks
- **Bad Code:** Committing code that breaks the build or introduces security flaws.
- **Secret Leakage:** Accidentally committing API keys into the repository during a mutation.

## Required Approvals
- **Reading:** Pre-approved for contextual awareness.
- **Writing (Pull Requests / Commits):** Requires Human Cryptographic Signature via `EvolutionManager`. No code is merged autonomously.

## Budget Implications
- Zero direct API cost. Token cost via `Cortex` to generate the code.

## Failure Modes
- API downtime: Evolution pipeline halts and waits.
- Merge conflicts: Organism must spawn a `DreamEngine` instance to resolve conflicts, or abort.
