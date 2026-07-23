# Stage 10: End-to-End System Validation

This document outlines the acceptance tests required for the Gen-1 End-to-End (E2E) Validation phase. Every scenario mandates a strict traceability chain and must produce raw execution artifacts.

## Traceability Standard
Every test execution MUST link:
`Scenario -> Requirement -> ADR -> Implementation -> Benchmark -> Audit -> Evidence`

---

## Scenario 1: The Full Autonomous Lifecycle
**Objective:** Verify the complete, uninterrupted 11-step execution loop of the organism.

**Traceability Matrix:**
- **Requirement**: Organism must continuously operate its core loop without human intervention.
- **ADR**: ADR-001 (Autonomous Control Loop), ADR-005 (Cortex Memory Integration)
- **Implementation**: `autark/src/index.ts` (Core Loop), `autark/src/nervous/`
- **Benchmark**: `autark-bench/src/system/stress_runner.ts`
- **Evidence Output Required**: `scenario1_lifecycle.log`, `scenario1_state.json`

**Execution Flow (Expected):**
1. BOOT
2. OBSERVE (Fetch environment state)
3. THINK (Synthesize plan)
4. AUTHORIZE (Internal policy check)
5. GENERATE (Produce artifact)
6. SANDBOX (Validate artifact)
7. EXECUTE (Perform side-effect)
8. RECORD (Write to SemanticMemory)
9. SLEEP (Cooldown)
10. DREAM (Consolidation)
11. READY (Return to start)

---

## Scenario 2: Crash-Recover Lifecycle
**Objective:** Verify that the organism can recover gracefully if violently interrupted during a network request.

**Traceability Matrix:**
- **Requirement**: Organism must not lose state or double-spend if crashed mid-flight.
- **ADR**: ADR-003 (State Machine Resiliency)
- **Implementation**: `autark/src/memory/OrganismMemory.ts`
- **Benchmark**: `autark-bench/src/chaos/live_chaos_runner.ts` (Network Crash)
- **Evidence Output Required**: `scenario2_crash_resume.log`, `scenario2_sqlite.db`

**Execution Flow (Expected):**
1. Organism begins `EXECUTE`.
2. Network RPC Failure injected.
3. Organism crashes or enters `RECOVERY`.
4. Organism restarts.
5. Organism resumes `EXECUTE` idempotently or reverts cleanly.

---

## Scenario 3: High-Throughput Integrity (100 Jobs)
**Objective:** Verify that the queue handles bulk parallel load without dropping or duplicating tasks.

**Traceability Matrix:**
- **Requirement**: The system must process high-volume queues idempotently.
- **ADR**: ADR-002 (Queue Processing)
- **Implementation**: `autark/src/queue/WorkQueue.ts`
- **Benchmark**: `autark-bench/src/system/queue_stress.ts`
- **Evidence Output Required**: `scenario3_metrics.json`, `scenario3_queue_state.json`

**Execution Flow (Expected):**
1. 100 jobs pushed to queue.
2. System executes all 100.
3. Random SIGKILL halfway through.
4. System recovers.
5. Exact 100 jobs processed (0 orphans, 0 duplicates).

---

## Scenario 4: Multi-Hour Endurance
**Objective:** Verify that the system does not leak memory, file handles, or bloat the DB uncontrollably over a long period.

**Traceability Matrix:**
- **Requirement**: System must run indefinitely (24h+) without degradation.
- **ADR**: ADR-008 (Memory Limits & Checkpointing)
- **Implementation**: `autark/src/nervous/Heart.ts`
- **Benchmark**: `autark-bench/src/system/endurance.ts`
- **Evidence Output Required**: `scenario4_heap_profile.json`, `scenario4_sqlite_wal.db`

**Execution Flow (Expected):**
1. Run for 4 hours.
2. Measure CPU load (must remain < 50% avg).
3. Measure Memory (Heap delta < 10MB).
4. Measure DB size (WAL checkpoint frequency stable).
