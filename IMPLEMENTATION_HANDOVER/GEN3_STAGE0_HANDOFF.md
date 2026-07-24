# Gen-3 Stage 0 Design Handoff

**Status:** READY_FOR_CODEX_DESIGN_REVIEW
**Scope:** Documentation-only architecture reconciliation.

## Inherited immutable baselines

- Engine: `Gen-2A-Baseline` at `86c8e79213d207edf4d38969a97865147f06f39f`.
- Brain handoff: `5acbed72f07f8a169e035443a1ed6ea5a9b8a99f`.
- Gen-2A limitation: one writer/process persistence; cross-process locking is
  not implemented.

## Documents prepared

- `GENERATIONS/GEN-3.md`
- `DECISIONS/ADR-009-GEN3-BUILDER-BOUNDARY.md`
- `ORGANS/BUILDER_SYSTEM.md`
- `INTERFACES/HEART_BUILDER_INTERFACE.md`
- `INTERFACES/BUILDER_CORTEX_INTERFACE.md`
- `FLOWS/GEN3_BUILDER_LIFECYCLE.md`
- `REFERENCE/GENERATION_TIMELINE_REVIEW.md`

## Explicit exclusions

No production implementation, deployment, customer communication, purchases,
real-money action, wallet/signing/broadcast, autonomous mutation, policy or
identity change is included. Gen-2A files and tags are untouched.

## Design-review questions

1. Does BuilderSystem remain one top-level organ with internal components only?
2. Are opportunity, project, artifact and outcome schemas sufficiently
   evidence-bound, deterministic and replayable?
3. Are project approval, artifact acceptance and deployment clearly separated?
4. Is isolated workspace construction bounded without production mutation?
5. Are Heart, Cortex, ObservationEngine, Memory, Learning, Treasury, Policy,
   Sandbox and Approval boundaries preserved?
6. Is the first vertical slice narrow enough for one-objective governance?

No Stage 1 objective may begin until these documents receive independent design
approval.
