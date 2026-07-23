# Autark Gen-1 Performance & Reliability Benchmark Report

**Date:** 2026-07-23T06:14:06.231Z
**Engine Schema:** v1

| Benchmark Name | Status | Mean Latency | P95 Latency | P99 Latency | Peak Memory | Ops/Sec | Result |
|---|---|---|---|---|---|---|---|
| Micro: Heart Latency | PASS | 0.001ms | 0.002ms | 0.011ms | 140.03MB | N/A | 🟢 PASS |
| Micro: Ledger Write | PASS | 0ms | 0ms | 0.001ms | 140.06MB | N/A | 🟢 PASS |
| Micro: SQLite Read | PASS | 0ms | 0.001ms | 0.001ms | 140.08MB | N/A | 🟢 PASS |
| System: Startup Latency | PASS | 0ms | 0.001ms | 0.001ms | 140.1MB | N/A | 🟢 PASS |
| System: Heartbeat Endurance (10,000 Pulses) | PASS | 0.011ms | 0.017ms | 0.213ms | 140.16MB | 1000 | 🟢 PASS |
| System: Recovery & Orphan Task Resumption | PASS | 0ms | 0ms | 0.001ms | 140.18MB | N/A | 🟢 PASS |
| Reliability: 100,000 Pulse Endurance | PASS | 0ms | 0ms | 0ms | 139.81MB | 100000 | 🟢 PASS |
| Reliability: Queue Stress (100k Items) | PASS | 0.607ms | 2.655ms | 2.655ms | 139.85MB | 15000 | 🟢 PASS |
| Reliability: Database Concurrency & Lock Contention | PASS | 0ms | 0.001ms | 0.001ms | 139.86MB | N/A | 🟢 PASS |
| Reliability: Resource & Handle Leak Audit | PASS | 0.04ms | 0.251ms | 0.671ms | 139.94MB | N/A | 🟢 PASS |
| Reliability: Mid-State Crash Recovery & Double-Spend Defense | PASS | 0ms | 0.001ms | 0.001ms | 139.95MB | N/A | 🟢 PASS |
| Reliability: Economic Balance & 20% Budget Cap Integrity | PASS | 0.011ms | 0.016ms | 0.021ms | 140.42MB | 10000 | 🟢 PASS |
| Reliability: Dream Engine & Working Memory Amnesia | PASS | 0.004ms | 0.002ms | 0.091ms | 140.46MB | N/A | 🟢 PASS |

## Budget Violations & Failure Reasons
None. All benchmarks satisfied Gen-1 budget targets.