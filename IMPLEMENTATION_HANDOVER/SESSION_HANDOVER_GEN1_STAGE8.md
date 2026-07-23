# Session Handover: Gen-1 Stage 8 Complete

**Date:** July 23, 2026
**Handover Checkpoint:** Stage 8 (Reliability & Stress Testing) COMPLETE -> Next: Stage 9 (Chaos Engineering)

---

## 1. Repository Layout & Working Directory
All repositories live in `d:\autark\`:
- `d:\autark\autark` — Executable organism (Git branch: `gen1-development`)
- `d:\autark\autark-brain` — Permanent Memory Vault & engineering knowledge (Git branch: `main`)
- `d:\autark\autark-bench` — Benchmarking & performance engine (Git branch: `master`)
- `d:\autark\autark-lab` — Experiments & prototypes
- `d:\autark\autark-data` — Runtime SQLite databases & logs

## 2. Git Status & Commits
- **`autark`**: Commit `0ca10c2` (`feat(kernel): fix WorkQueue crash recovery and add security audit tests`)
- **`autark-brain`**: Commit `26bf8ef` (`docs: add Stage 8 Reliability Audit report to Memory Vault`)
- **`autark-bench`**: Commit `101e032` (`feat(reliability): add Stage 8 stress test modules`)

## 3. Pipeline Progress & Audit Status
- `[x]` **Stage 1**: Unit Audits (All 6 core organs passed)
- `[x]` **Stage 2**: Interface Audits (All API boundaries passed)
- `[x]` **Stage 3**: Workflow Audits (Boot, Execute, Sleep continuous pulse refactored)
- `[x]` **Stage 4**: Dependency Audits (Strict import rules verified)
- `[x]` **Stage 5**: State Machine Audit (10 biological states; WorkQueue lease expiration recovery fixed)
- `[x]` **Stage 6**: Security Audits (Isolated-VM sandbox violation attempts & wallet isolation passed)
- `[x]` **Stage 7**: Performance Audits (Tri-baseline benchmarking, budgets, 10k pulses passed)
- `[x]` **Stage 8**: Reliability & Stress Testing (100k pulses, 100k queue items, DB concurrency, resource leaks, mid-state crash recovery, 20% budget cap, memory amnesia - all 7 passed cleanly in Docker)
- `[ ]` **Stage 9**: Chaos Engineering *(NEXT STAGE)*
- `[ ]` **Stage 10**: End-to-End System Validation
- `[ ]` **Stage 11**: Architecture Drift Audit
- `[ ]` **Stage 12**: Gen-1 Release Freeze

## 4. Operational Principles & Engineering Standards
1. **The Brain Evolves with the Code**: Scaled to scope (`ENGINEERING_STANDARDS.md`).
2. **Never Claim Implementation Without Proof**: Must have code, tests, logs, or audit evidence.
3. **Audits Must Violate, Not Validate**: Mechanical attack scripts required.
4. **Evidence First**: Specify file, function, test, audit, and commit for every claim.
5. **No Mocks Survive a Freeze**: Scan for `TODO`/`MOCK`/`FIXME` before freeze.
6. **Strict Repository Separation**: Respect `autark`, `autark-brain`, `autark-bench`.
7. **No Optimization Without Measurement**: Benchmarks required for performance claims.

## 5. Important ADRs
- **ADR-001**: Constitution Is Immutable
- **ADR-002**: Cognitive Budget (20% Revenue Cap)
- **ADR-003**: Simulator-First Dreaming
- **ADR-004**: Semantic Memory Design
- **ADR-005**: Evidence-Based Learning
- **ADR-006**: Why No Instincts in Gen-1
- **ADR-007**: Continuous Biological Heartbeat (Pulse vs Job Queue)

## 6. Instructions for Next Session (Stage 9)
Start the next session by executing **Stage 9: Chaos Engineering**:
1. Create chaos injection test harness in `autark-bench` or `autark`.
2. Deliberately inject network timeouts, RPC failures, database lock corruptions, disk write failures, and malformed LLM responses.
3. Verify that the organism enters safe states, logs failures, preserves funds, and recovers automatically.
4. Output `autark-brain/AUDITS/CHAOS/Chaos_Audit_Gen1.md`.
5. Update `CURRENT_STATE.md`, commit code and documentation, and proceed to Stage 10.
