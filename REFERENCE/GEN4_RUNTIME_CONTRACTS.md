# Gen-4 Runtime Contracts

```ts
type ProviderMode = 'SIMULATED'|'LIVE';
interface ProviderIdentity { providerId:string; implementationVersion:string; modelId:string|null; modelVersion:string|null; mode:ProviderMode; }
interface ProviderProvenance { sourceId:string; sourceVersion:string; collectedAt:string; evidenceHash:string; correlationId:string; }
interface ProviderEvidence { identity:ProviderIdentity; requestHash:string; responseHash:string; provenance:ProviderProvenance; observedAt:string; }
```
Provider selection must explicitly require `LIVE`, then verify provider/model
identity and approved version. Any unavailable, mismatched, expired, or
simulated provider fails closed; no fallback value, hash, cost, reserve, or
success claim may resemble real evidence.

Clock is injected and monotonic for lifecycle guards; Replay requires a stable
replay key and deterministic result. ResourceMeter enforces CPU, memory, disk,
process, duration, egress bytes/requests, and cost ceilings. Backup contracts
include encrypted manifest, schema/version, state hashes, RPO/RTO, restore
verification, and human-authorized activation. Deployment, rollback, and
incident transitions are separate Approval/Policy authorities; OperatorSystem
can only request and record them.
