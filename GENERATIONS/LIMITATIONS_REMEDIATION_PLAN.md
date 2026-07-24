# Cross-Generation Limitations and Remediation Plan

## Gen-0 — frozen foundation

Replication is explicitly deferred to the final phase and remains under
permanent human constitutional control. This is an intentional constraint,
not a defect. No remediation is authorized before the later generation that
defines it.

## Gen-1 — open inherited risks

- Production readiness, deterministic replay, architecture drift, live
  validation, and the final freeze remain open or unverified.
- Document-integrity findings G1-001/G1-002/G1-003 remain open.
- Transaction authority audit remains open: write mode can potentially reach
  broadcast paths, the killswitch can send directly, human approval is not
  bound into the transaction, uncertain restart reconciliation is manual, and
  intent/sign/broadcast/settlement are not atomic.
- Simulated/random Lab vitals, transaction-hash/cost fallbacks, static retry
  reserves, and disabled/unimplemented organs cannot support production or
  economic claims.

## Gen-2 / Gen-2A

- Jest still needs `--forceExit` because of an open handle.
- Full chaos/security validation was deferred.
- Gen-2A persistence is bounded to one writer/process; cross-process locking
  and stress coverage remain absent by accepted design limitation.

## Gen-3

- High-contention multi-process stress remains incomplete.
- Authority verification is structural/source-based rather than a
  runtime-complete transitive reachability proof.

## Remediation sequence

### P0 — safety and authority

1. Keep Gen-1 write mode permanently disabled in all verification and default
   runtime paths.
2. Close the transaction authorization audit: bind human approval, remove
   direct wallet-send paths, and define deterministic restart reconciliation.
3. Re-audit all transitive authority paths before any production mode is
   considered.

### P1 — integrity and deterministic foundations

4. Resolve G1-001/G1-003 document-integrity and traceability findings.
5. Decide and record Gen-1 freeze status only after deterministic replay and
   architecture-drift findings are closed.
6. Add Gen-2A cross-process persistence locking and high-contention stress
   evidence, preserving corruption quarantine and replay semantics.
7. Replace Gen-3 source/regex authority checks with runtime reachability tests
   and add multi-process stress evidence.

### P2 — bounded implementation debt

8. Replace simulations and stubs only within an explicitly authorized
   generation scope; do not backfill economic or production claims into frozen
   generations.
9. Resolve the Jest open-handle issue and run the deferred chaos/security
   suites when their generation is authorized.

### P3 — deferred evolution

10. Keep replication, banking, credit, currency, and self-expansion
    simulation-first and human-governed until their separately authorized
    generations.

No Gen-4 implementation starts automatically from this plan.
