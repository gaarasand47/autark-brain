# File System Capability

## Permissions
- **Scope:** Strict isolation. Autark is only permitted to read/write to its own `data/` directory (for SQLite DBs) and `/tmp/dream` (for DreamEngine scratch space).
- **Prohibited:** Reading environment variables from files (`.env`), accessing `~/.ssh/`, or modifying its own `src/` directory outside of the `EvolutionManager`.

## Risks
- **Data Corruption:** Writing malformed data to SQLite causing organism failure.
- **Self-Modification Bug:** A hallucinated skill bypassing the Sandbox to overwrite `index.ts`.

## Required Approvals
- Local storage (SQLite / tmp): Pre-approved by architecture.
- Source code mutation (`src/`): Requires Human Cryptographic Signature via `ApprovalGateway`.

## Budget Implications
- Zero internal capital cost. Only restricted by physical disk space.

## Failure Modes
- Disk Full: Results in SQLite `ENOSPC`. Organism must halt `tick()` to prevent partial writes.
- Permissions Error: Results in organism failing to boot.
