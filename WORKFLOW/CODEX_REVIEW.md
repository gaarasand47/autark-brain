# Codex Gen-3 Stage 0 Design Review

**Verdict:** `APPROVED WITH CONDITIONS`
**Reviewed commit:** `5293645a0bcf68b744f09b5a2e4c9f036d568627`
**Inherited baseline:** `Gen-2A-Baseline` at `86c8e79213d207edf4d38969a97865147f06f39f`

The architecture has the correct bounded direction and preserves the major
authority boundaries, but Stage 0 is not sufficiently precise to authorize
Stage 1 implementation without the following minimal documentation repairs.

## Findings

1. **HIGH — artifact stopping point.** `GENERATIONS/GEN-3.md`, Evolutionary
   goal/lifecycle: reviewable artifacts are defined, but acceptance criteria for
   reproducible build/test evidence are not explicit. **Invariant:** no artifact
   becomes review-ready without evidence. **Correction:** define mandatory
   manifest fields, reproducible build inputs, test exit codes and checksum
   rules.

2. **MEDIUM — later-generation boundary.** `GENERATIONS/GEN-3.md`, Evolutionary
   goal: deployment/operation/customers/revenue are excluded but Gen-4/Gen-5
   ownership is not mapped in the canonical exit section. **Invariant:** Gen-3
   cannot operate a business. **Correction:** add an explicit ownership table
   assigning deployment/operation to Gen-4 and enterprise revenue to Gen-5.

3. **HIGH — approval separation.** `GENERATIONS/GEN-3.md`, Lifecycle: project
   approval and artifact acceptance are named, but approval authority and exact
   guards are not defined. **Invariant:** proposal, project approval, artifact
   acceptance and deployment approval are separate. **Correction:** specify
   actor, input, immutable decision record and allowed transitions for each gate.

4. **LOW — sole organ.** `ORGANS/BUILDER_SYSTEM.md`, opening boundary correctly
   names one organ, but public method ownership is not versioned. **Invariant:**
   BuilderSystem is the sole top-level Builder organ. **Correction:** enumerate
   the one public interface and mark all internal components private.

5. **MEDIUM — Heart boundary.** `INTERFACES/HEART_BUILDER_INTERFACE.md`, Public
   boundary: `transitionProject` is exposed without stating that guards remain
   inside BuilderSystem. **Invariant:** Heart orchestrates and cannot own
   lifecycle policy. **Correction:** make Heart a blind request/pass-through;
   BuilderSystem alone validates transitions.

6. **MEDIUM — Cortex boundary.** `INTERFACES/BUILDER_CORTEX_INTERFACE.md`,
   advisory inputs: it denies approval but does not explicitly deny direct
   lifecycle mutation. **Invariant:** Cortex cannot mutate Builder state.
   **Correction:** state that Cortex has no BuilderSystem persistence or
   transition API access.

7. **HIGH — workspace isolation.** `ORGANS/BUILDER_SYSTEM.md`, Safety and
   Authority: isolation is asserted but path traversal, symlinks, hard links,
   child processes, network and resource limits are unspecified. **Invariant:**
   Builder cannot escape its workspace or mutate production. **Correction:**
   define canonical path checks, link rejection, process/network/resource policy,
   and quarantine behavior.

8. **MEDIUM — inherited authority ownership.** `DECISIONS/ADR-009`, Inherited
   boundaries: ownership is listed but request/response contracts to Treasury,
   Policy, Sandbox, Approval, Memory and Learning are absent. **Invariant:**
   Builder cannot absorb inherited authority. **Correction:** add an authority
   matrix with caller, owner, request and returned evidence for each boundary.

9. **HIGH — evidence bypass.** `GENERATIONS/GEN-3.md`, Canonical schemas:
   evidence references are described but required accepted-observation and
   hypothesis validation is not specified. **Invariant:** opportunities cannot
   bypass provenance. **Correction:** require evidence membership, freshness,
   confidence bounds, expiry and duplicate checks before qualification.

10. **HIGH — validation self-approval.** `ORGANS/BUILDER_SYSTEM.md`, Public
    boundary and `FLOWS/GEN3_BUILDER_LIFECYCLE.md`: validation is present, but
    separation between validation evidence and acceptance decision is not
    explicit. **Invariant:** ValidationPipeline cannot approve its own artifact.
    **Correction:** require an independent acceptance decision and immutable
    evidence record after validation.

11. **HIGH — persistence/recovery.** `FLOWS/GEN3_BUILDER_LIFECYCLE.md`,
    persistence sentence: atomic/versioned/replayable behavior is asserted but
    schema version, restart recovery, corruption quarantine and inherited
    single-writer limitation are not defined. **Invariant:** lifecycle state is
    durable and safe across restart/corruption. **Correction:** specify all four
    behaviors and the single-writer constraint.

12. **HIGH — workspace threat model.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Correction 4: it mentions isolation but omits symlink/hard-link attacks,
    child-process escape, network egress and resource exhaustion. **Invariant:**
    artifact construction is confined and killable. **Correction:** add an
    explicit threat-control checklist and quarantine evidence.

13. **MEDIUM — outcome truthfulness.** `GENERATIONS/GEN-3.md`, ProjectOutcome:
    `measuredValue` and outcome classes can imply real-world success although
    Gen-3 cannot observe deployed/customer outcomes. **Invariant:** no invented
    outcomes. **Correction:** restrict Gen-3 outcomes to observed build/test or
    explicitly `UNMEASURED`; external outcomes require later Observation/Operator
    evidence.

14. **HIGH — release transition.** `GENERATIONS/GEN-3.md`, Lifecycle and
    `ADR-009`, Rejected shortcuts: `ACCEPTED_FOR_RELEASE` is separated from
    deployment conceptually, but its guard and non-trigger behavior are not
    formalized. **Invariant:** acceptance cannot trigger deployment or Gen-4.
    **Correction:** define it as a terminal handoff record with no callable
    deployment side effect.

15. **LOW — future finance boundary.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Corrections 6–7: banking/credit/currency are described as human-governed but
    not explicitly excluded from Gen-3 schemas/interfaces. **Invariant:** Gen-6/7
    finance remains outside Builder. **Correction:** add a hard exclusion to
    GEN-3 and the authority matrix.

16. **LOW — human sovereignty.** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`,
    Correction 7: permanent sovereignty is stated, but the Gen-3 handoff does
    not repeat emergency constitutional authority. **Invariant:** humans retain
    constitutional and emergency control. **Correction:** add that statement to
    the Gen-3 handoff and release boundary.

## Decision

Stage 0 direction is conditionally acceptable. The listed documentation repairs
must be completed and independently reviewed before Stage 1. No Gen-3 source
implementation, release, deployment or Gen-2A modification is authorized.
