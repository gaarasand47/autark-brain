# Generation Release Checklist (Definition of Done)

A generation (e.g. Gen-1, Gen-2) **CANNOT** be frozen or tagged for release until every single gate in this checklist is verified and checked off.

## Release Gates

- [ ] **1. Unit Audits**: All organ unit audits passed with mechanical proof.
- [ ] **2. Interface Audits**: All inter-organ API boundary audits passed.
- [ ] **3. Workflow Audits**: Boot, Execute, and Sleep lifecycles verified unreachable states removed.
- [ ] **4. Dependency Audits**: Forward and reverse imports obey strict architectural boundaries.
- [ ] **5. State Machine Audits**: Reachability, exit conditions, and dynamic task resumption verified.
- [ ] **6. Security Audits**: Active violation testing (sandbox break attempts, wallet isolation) passed.
- [ ] **7. Performance Audits**: All organ micro & system benchmarks pass within defined budget limits.
- [ ] **8. Reliability & Stress Tests**: Endurance run (10,000+ pulses) demonstrates zero memory leaks or handle leaks.
- [ ] **9. Chaos Engineering**: Simulated network drops, database locks, and crashes recover gracefully.
- [ ] **10. End-to-End System Validation**: Fresh organism boots, executes a real task, sleeps, and resumes state cleanly.
- [ ] **11. Architecture Drift Audit**: Final drift report shows zero undocumented architectural deviation.
- [ ] **12. Documentation Synchronized**: Memory Vault (`autark-brain`) matches exact verified code state.
- [ ] **13. Benchmarks Archived**: `baseline.json` and `performance_report.md` committed to `autark-brain/BENCHMARKS/GenX/`.
- [ ] **14. Traceability Updated**: `TRACEABILITY.md` maps every requirement to source lines and tests.
- [ ] **15. No Undocumented TODOs**: Codebase scanned for `TODO`, `FIXME`, `MOCK`, `HACK`, `STUB`.
- [ ] **16. No Undocumented Mocks**: All production paths use real or sanitized real providers.
- [ ] **17. Tests Passing**: 100% test suite execution succeeds.
- [ ] **18. Git Tag Created**: Immutable tag assigned (e.g. `gen1-freeze`).
- [ ] **19. Release Notes Written**: Summary of features, invariants, and known technical debt published.
- [ ] **20. Memory Vault Committed**: Final commit made to `autark-brain`.
- [ ] **21. Benchmarks Committed**: Final commit made to `autark-bench`.
- [ ] **22. Version Frozen**: Branch locked; future work moves to `gen2-development`.
