# Codex Review

## Review Metadata

- **Objective:** `G2-S0-O1` — Gen-2 Stage 0 Architecture Reconciliation
- **Architecture commit reviewed:** `635f8ccd55491eea4281b2577bbc188f7ee58c5d`
- **Review type:** Independent design review
- **Verdict:** `APPROVED WITH CONDITIONS`

## Required Conditions

1. Align nullable evidence across every exposed schema. `MotivationalContext.evidenceHash`
   must use the canonical `string | null` type.
2. Make Data Deficiency genuinely typed. Add a `NeedKind` or equivalent
   discriminant containing `DATA_DEFICIENCY`, and replace arbitrary
   `sourceMetrics: string[]` values with typed metric evidence or stable
   evidence references.
3. Replace the high-confidence phrase "All objective classes permitted" with
   "all otherwise policy-eligible proposal classes." Explicitly preserve
   Constitution, Policy, Treasury, Approval, Sandbox, Vault, and Identity
   restrictions.
4. Update `FLOWS/INSTINCT_EVALUATION_FLOW.md` so confidence `0.50–0.99`
   permits only low-risk internal/read-only proposals. Normal proposal
   generation remains subject to inherited policy and authority boundaries.

## Verified

- ADR-008 correctly reconciles ADR-006.
- Heart remains an orchestrator.
- `InstinctSystem` is the sole top-level organ.
- Drives have no direct execution, Treasury, wallet, signing, broadcast,
  mutation, policy, identity, or approval authority.
- Approval applies at protected-action boundaries, not harmless internal
  cognition.
- Hunger monotonically tightens risk under scarcity.
- Determinism, confidence, missing-data, persistence, recovery, baseline
  provenance, and objective decomposition are defined.
- No Gen-2 production source code was introduced.

## Required Next Action

Apply one documentation-only repair limited to the four conditions above.
Do not implement or broaden `G2-S1-O1`. After the repair, update
`ANTIGRAVITY_HANDOFF.md`, set `STATUS.md` to
`READY_FOR_CODEX_REPAIR_VERIFICATION`, and stop.
