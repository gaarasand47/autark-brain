# Documentation Constitution

**Status:** `Frozen` (Gen-1)

This Constitution governs the `autark-brain` repository itself. The organism's code executes logic; this repository executes truth. 

## The Core Mandate
The Memory Vault exists to preserve understanding, not merely information. It must self-maintain its accuracy as the organism evolves.

## 1. Documentation Never Lies
If a document states that a feature exists, it must exist in the `main` branch. 

## 2. Code is the Source of Truth
Never infer implementation from intent. If the architecture document describes a `PREDICT` state, but `Heart.ts` does not contain it, the document is factually incorrect and must be rectified or marked as `[Planned]`.

## 3. Mandatory Traceability
Every architectural claim, biological organ, or capability must be traceable to the codebase via the `TRACEABILITY.md` matrix. If a document lacks code traceability, it is considered hypothetical.

## 4. Stale Document Handling
If documentation and code disagree, the document must immediately be flagged with `[STALE: Code Discrepancy]`. We prefer missing documentation over false documentation. Remove obsolete documentation entirely rather than letting it rot.

## 5. Explicit Planning
Planned features or future generations must never be written as currently implemented. They must be explicitly tagged as `[Planned]` or cordoned into the `Future Extensions` footer.

## 6. Generational Inheritance
Every generation inherits the previous generation's documentation unless a document is explicitly superseded by a new version or an Architectural Decision Record (ADR).

## 7. The Workflow (The Update Loop)
The Memory Vault is not updated "after the fact." The Vault is updated in lockstep with the organism.
1. Code changes via `EvolutionManager`.
2. Tests are updated.
3. Documentation is updated.
4. `TRACEABILITY.md` is updated.
5. An ADR is written if the architecture changed.
6. Handover regenerated.
7. Audit performed.
8. Freeze.

---
### Implementation Status
Implemented

### Implementation Maturity
Frozen

### Source Files
- This repository (`autark-brain`).

### Future Extensions
- **Gen-3:** Introducing automated CI/CD checks that scan for `[STALE]` flags and block merges.
