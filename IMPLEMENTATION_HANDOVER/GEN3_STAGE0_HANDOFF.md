# Gen-3 Stage 0 Design Handoff

**Status:** READY_FOR_CODEX_DESIGN_REVIEW
**Scope:** G3-S1-O1 OpportunityCandidate schema and evidence-bound
qualification only.

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

## G3-S1-O1 implementation handoff (pending design approval)

Engine implementation: `src/builder/OpportunityCandidate.ts` and focused tests
in `src/__tests__/unit/OpportunityCandidate.test.ts`.

The slice validates bounded numeric fields, `DIGITAL_ARTIFACT` class,
`authority: NONE`, deterministic evidence membership (observation id,
fingerprint and source id), and fail-closed qualification. It has no project,
artifact, deployment, customer, Treasury, wallet, signing, broadcast,
mutation, policy, identity or approval path.

Acceptance evidence: `npm run build`; focused Jest suite. This objective is
not authorized until the repaired Stage 0 architecture receives independent
design approval. No self-approval or baseline claim is made.
