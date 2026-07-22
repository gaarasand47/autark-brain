# Autark Gen-1 Performance & Reliability Benchmark Report

**Date:** 2026-07-22T20:22:10.558Z
**Engine Schema:** v1

| Benchmark Name | Status | Mean Latency | P95 Latency | P99 Latency | Peak Memory | Ops/Sec | Result |
|---|---|---|---|---|---|---|---|
| Micro: Heart Latency | PASS | 0.001ms | 0.001ms | 0.006ms | 150.01MB | N/A | 🟢 PASS |
| Micro: Ledger Write | PASS | 0ms | 0ms | 0.001ms | 150.04MB | N/A | 🟢 PASS |
| Micro: SQLite Read | PASS | 0ms | 0.001ms | 0.001ms | 150.05MB | N/A | 🟢 PASS |
| System: Startup Latency | PASS | 0ms | 0.001ms | 0.001ms | 150.07MB | N/A | 🟢 PASS |
| System: Heartbeat Endurance (10,000 Pulses) | PASS | 0.008ms | 0.015ms | 0.043ms | 150.13MB | 1000 | 🟢 PASS |
| System: Recovery & Orphan Task Resumption | PASS | 0ms | 0.001ms | 0.002ms | 150.15MB | N/A | 🟢 PASS |

## Budget Violations & Failure Reasons
None. All benchmarks satisfied Gen-1 budget targets.