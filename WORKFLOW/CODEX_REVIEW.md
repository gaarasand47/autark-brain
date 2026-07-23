# Codex Review

## Verdict

**FAIL**

## Scope and Evidence

- Engine commit: `e541eb93704835d61776e1b638367df5f3254f83`
- Brain commit: `b3605d61ce60f0c5fa1139cd566f244a0704c06e`
- Docker TypeScript build: PASS
- Focused Docker suites: PASS, 24/24 tests
- Full Docker regression suite: PASS, 49/49 tests

Green tests do not establish working Gen-2 integration. The following material
findings block verification.

## Required Repairs

1. **Heart does not pass motivational context to Cortex.**
   `src/kernel/Heart.ts` stores `evalResult` in `currentDecisionContext` at
   line 168, but the context constructed for `cortex.generatePlan()` at line
   202 omits `motivationalState`. The production Cortex therefore receives
   `undefined`, contrary to the Heart/Cortex interface and walkthrough.

2. **Instinct persistence is unreachable in the active Heart state machine.**
   `src/kernel/Heart.ts` contains duplicate `case OrganismState.SLEEP` branches
   at lines 187 and 455. The first branch always matches and breaks, so the
   later branch containing `instinctSystem.persistState()` at line 464 cannot
   execute.

3. **Boot recovery and acknowledgement routing are not integrated.**
   Heart constructs the organ at line 48 but never calls
   `instinctSystem.recoverState()` during BOOT. No production caller invokes
   `acknowledgeProposal`; the required Cortex -> Heart -> InstinctSystem blind
   pass-through is absent.

4. **Drive decay is declared but not implemented.**
   `decayRatePerMinute` and `previousIntensities` exist in `DriveEngine.ts`,
   but no elapsed-time decay calculation uses them. The walkthrough and
   canonical Stage 3 behavior therefore overclaim completion.

5. **Hysteresis is not a correct threshold hysteresis implementation.**
   `applyHysteresis()` adds a fixed boost after `isActive` was calculated and
   does not recompute activation. It can inflate the previous drive but cannot
   correctly preserve activation across separate enter/exit thresholds.

6. **Proposal evidence is discarded.**
   `GoalProposalEngine.ts` emits `evidence: []` at line 101. Canonical
   proposals require evidence references and traceable provenance.

7. **Critical-Hunger allowlisting is not enforced.**
   Both ordinary and critical Hunger map directly to
   `FINANCIAL_TRANSACTION` at lines 60 and 64. Assigning `riskClass: LOW`
   is not an enforceable allowlist and does not itself restrict proposals to
   conservation/cost-reduction actions.

8. **Persistence recovery is not safely validated or quarantined.**
   `InstinctStore` casts unvalidated SQLite values into canonical unions and
   can restore persisted `actionAuthority = 1` using `true as any`, violating
   the literal-false invariant. Its claimed quarantine calls `clear()`, which
   deletes evidence instead of retaining corrupt records for inspection.
   There is also no explicit persistence schema-version/migration table.

9. **Snapshot provenance is wrong.**
   `DriveEngine.ts` hardcodes `snapshotVersion: "1.0.0"` instead of preserving
   `OrganismStateSnapshot.version`.

10. **The production boundary remains untyped.**
    `DecisionContext.motivationalState` and
    `CortexContext.motivationalState` are `any`, so compile-time checks do not
    enforce immutable `InstinctEvaluationResult` input.

11. **Required documentation was not maintained.**
    Brain commit `b3605d6` updates workflow files and adds a walkthrough, but
    does not update `GENERATIONS/GEN-2.md`, `ORGANS/INSTINCT_SYSTEM.md`,
    either interface specification, the evaluation flow, `ROADMAP.md`,
    `CURRENT_STATE.md`, or `TRACEABILITY.md` to distinguish implemented,
    tested, failed-verification, and remaining work.

12. **The workflow handoff is internally inconsistent.**
    `STATUS.md` contains both `READY_FOR_CODEX_DESIGN_REVIEW` and
    `READY_FOR_CODEX_VERIFICATION`. `ANTIGRAVITY_HANDOFF.md` still identifies
    `G2-S1-O2` and design-review status while appending a consolidated Gen-2
    completion claim.

## Required Regression Coverage

- Production Heart test proving evaluation reaches the actual Cortex input.
- State-machine test proving BOOT recovery and reachable SLEEP persistence.
- Acknowledgement pass-through and lifecycle persistence test.
- Deterministic decay and enter/exit hysteresis tests using `TestClock`.
- Critical-Hunger monotonic tightening and allowlist tests.
- Evidence propagation/provenance test.
- Adversarial recovery tests for invalid enums, malformed JSON, forbidden
  `actionAuthority = 1`, incompatible schema, and retained quarantine data.
- Snapshot-version propagation test.

Repair only these findings, update the canonical brain documents and coherent
handoff metadata, commit engine and brain repairs separately, then set
`STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`.
