# Codex Gen-3 Stage 0 Design Review

**Verdict:** `APPROVED WITH CONDITIONS`
**Reviewed commits:** engine `facbaf0`; Brain `5d1901c`
**Inherited baseline:** Gen-2A-Baseline at `86c8e79`

The repaired Stage 0 documentation addresses the prior sixteen findings. The
narrow OpportunityCandidate slice is evidence-bound and has no authority over
execution or external systems.

Independent evidence:

- pinned Node 22 Docker build: passed;
- TypeScript compilation: passed;
- focused OpportunityCandidate tests: 4/4 passed;
- authority scan: no execution, Treasury, wallet, signing, broadcast,
  deployment, policy, identity, approval, process or network access.

Conditions:

1. Keep implementation limited to the narrow evidence-bound OpportunityCandidate
   slice until its independent verification is complete.
2. Do not implement Project lifecycle, workspace construction, persistence,
   ValidationPipeline, release packaging, operation or later Gen-3 stages yet.
3. Independently verify actual workspace controls, persistence/recovery and
   lifecycle guards when those components are implemented.
4. Preserve exact evidence observedAt/expiry checks in regression tests.
5. Do not create a Gen-3 baseline or modify Gen-2A.

No deployment, operation, customers, revenue, autonomous mutation or Gen-2A
change is authorized.

## G3-S1-O2 Project lifecycle design review

**Reviewed plan:** `e92ca54`
**Verdict:** `APPROVED WITH CONDITIONS`

The repaired plan defines the Project schema and finite bounds, exact guarded
transitions and terminal states, actor/approval ownership, idempotency and
conflict semantics, schema-versioned atomic persistence/recovery, quarantine and
unavailable envelopes, deterministic replay inputs, candidate evidence
freshness/membership, adversarial assertions and authority scanning.

Implementation conditions: enforce the normative plan exactly, especially UTC
timestamp validation, bounded arrays, evidence expiry/freshness, terminal
no-outgoing edges and quarantine provenance. Independently test each condition.
No scope expansion or Gen-3 baseline is authorized.
