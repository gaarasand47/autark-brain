# Gen-1 Stub and Simulation Inventory

**Status:** reconciliation inventory; no item below is release approval.

| Location | Behavior | Classification | Required treatment |
| --- | --- | --- | --- |
| `constitution/ConstitutionCompiler.ts` | returns `[]` | DISABLED EXPERIMENTAL | Do not claim Markdown constitution enforcement. |
| `drivers/EthereumDriver.ts` | returns NOT_IMPLEMENTED/stub receipts | DISABLED EXPERIMENTAL | Keep unavailable; no success claims. |
| `cognitive/SkillCompiler.ts` | emits stub-oriented output | PROPOSAL-ONLY | Never route to execution as implemented skill compilation. |
| `execution/Lab.ts` telemetry fallback | random CPU/memory values | ACCEPTED LIMITATION | Mark vitals simulated; exclude from deterministic/performance proof. |
| `kernel/Heart.ts` | `simulation` tx-hash fallback and cost fallback | ACCEPTED LIMITATION | Cannot constitute broadcast, settlement, or economics proof. |
| `evolution/EvolutionManager.ts` | proposal/rollback placeholders | PROPOSAL-ONLY | Returns `NOT_IMPLEMENTED`; no source mutation. |
| `evolution/ApprovalGateway.ts` | interactive proposal signature only | PROPOSAL-ONLY | Not a spend/deploy authority grant. |
| `homeostasis/HomeostasisMonitor.ts`, `immune/*` | NOT_IMPLEMENTED real telemetry/integrity hooks | DISABLED EXPERIMENTAL | Fail closed/unavailable. |
| `reality/RealityRegistry.ts` | capabilities marked NOT_IMPLEMENTED | IMPLEMENTED classification mechanism | Keep unavailable capabilities blocked. |
| `testing/**`, RVF mock providers | mock LLM/RPC and chaos data | TEST-ONLY | Evidence only for harness behavior. |
| `governance/Governor.ts` | static retry reserve fallback | ACCEPTED LIMITATION | Not a real fee/market estimate. |
| `genome/Vault.ts` Solana account | throws on EVM signing | DISABLED EXPERIMENTAL | Correctly unavailable; do not bridge. |

Items not explicitly listed must be reviewed before any release claim. No stub is classified IMPLEMENTED merely because it returns a value.
