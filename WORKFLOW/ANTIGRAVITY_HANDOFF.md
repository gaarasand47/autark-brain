# Gen-2 RC1 Baseline Handoff

## Authority and Review Separation

The project owner temporarily authorized Codex to implement only the three
findings in the preceding `CODEX_REVIEW.md`. Codex has not reviewed, approved,
or assigned a verification verdict to its own implementation. A separate
independent reviewer is required.

## Exact Scope

- Engine base: `bd0d08b740ffee97caa601f708eb1dfa3c0a8290`
- Engine initial repair: `c7f5e4f5945fe367e3b434f578c8dde0ebb784a0`
- Engine independent-finding repair:
  `077d756303d48e9e19f8dbeac034c54f4c6a0c9f`
- Brain base: `d0755cef47d590a4bd04bfb8e49b1892a9086c8e`
- Brain repair: the commit containing this handoff is authoritative.

## Implemented Repairs

1. Critical Hunger remains `FINANCIAL_CONSERVATION`/`LOW`; the generic
   suggested-class path cannot widen it back to `FINANCIAL_TRANSACTION`.
2. Persistence recovery rejects non-finite evidence numbers, negative
   evidence timestamps, urgency outside `[0,1]`, negative expected value,
   negative creation time, and expiration not strictly after creation.
3. Canonical organ, interface, flow, roadmap, current-state, traceability, and
   workflow documents now say implementation repair is awaiting independent
   verification rather than claiming completion.
4. After independent review found that non-financial suggested classes could
   still replace critical-Hunger conservation, the override was made
   unconditional: every `ObjectiveClass` suggestion now leaves critical
   Hunger as `FINANCIAL_CONSERVATION`/`LOW`.

## Docker Evidence Produced by Implementer

- Image: `autark-gen2-final-repair`
- `npm run build`: passed.
- Focused suites after the independent-finding repair: 5/5 suites, 30/30
  tests passed.
- Full suite after the independent-finding repair: 17/17 suites, 75/75 tests
  passed.
- Jest required `--forceExit`; the existing open-handle warning remains a
  limitation and was not broadened into this repair.

## Independent Reviewer Checklist

- Inspect the exact engine and brain diffs.
- Re-run the focused and full Docker suites.
- Adversarially confirm critical-Hunger monotonic tightening.
- Confirm persistence rejects the new numeric/time corruptions while valid
  round trips recover.
- Confirm canonical documents agree and no authority boundary changed.
- Record an independent verdict without asking this implementing Codex run to
  approve itself.

## RC1 smoke evidence

- Engine baseline candidate: `dd32313733023adac7f8510435ea2251da30422e`.
- Bench validation commit: `6e2b961a40e19c6f2fedfc301e4ce8125940dcca`.
- Docker build: passed; full engine suite: 17/17 suites, 75/75 tests.
- Deterministic replay: 3/3 identical logical outputs.
- Read-only shadow smoke: 10 seconds with an empty wallet key, passed.

These are baseline smoke checks only. Full chaos/security audit and Gen-3 work
are deferred until separately authorized.

## Status

`GEN2_RC1_READY_FOR_HUMAN`
