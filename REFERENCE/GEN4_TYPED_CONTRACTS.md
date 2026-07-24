# Gen-4 Typed Contracts

```ts
type Environment = 'DEV' | 'TESTNET' | 'PILOT';
type Lifecycle = 'PROPOSED'|'APPROVED'|'STAGED'|'CANARY'|'ACTIVE'|'PAUSED'|'ROLLING_BACK'|'RETIRED'|'UNAVAILABLE'|'QUARANTINED'|'RECOVERY_PENDING'|'RECONCILE_REQUIRED';
interface OperatorIntent { schemaVersion:string; intentId:string; correlationId:string; replayKey:string; artifactHash:string; environment:Environment; capabilitySet:string[]; capabilitySnapshotHash:string; budgetCents:number; resourceCeiling:{cpuPercent:number; memoryBytes:number; diskBytes:number; durationMs:number}; egress:{hosts:string[]; bytes:number; requests:number}; policyVersion:string; constitutionVersion:string; approvalRef:string|null; leaseId:string|null; evidenceHash:string; provenance:{source:string; sourceVersion:string; observedAt:string}; expiresAt:string; rollbackTarget:string|null; stateHash:string; }
interface LifecycleTransition { schemaVersion:string; transitionId:string; correlationId:string; replayKey:string; from:Lifecycle; to:Lifecycle; actorId:string; authority:string; reason:string; evidenceHash:string; policyVersion:string; constitutionVersion:string; previousStateHash:string; nextStateHash:string; version:number; occurredAt:string; }
interface HealthEvidence { schemaVersion:string; artifactHash:string; observedAt:string; errorRate:number; latencyMs:number; cpuPercent:number; memoryBytes:number; status:'HEALTHY'|'DEGRADED'|'UNAVAILABLE'; evidenceHash:string; }
interface CredentialLease { schemaVersion:string; leaseId:string; environment:Environment; artifactHash:string; capability:string; issuedAt:string; expiresAt:string; revokedAt:string|null; }
```

All identifiers are non-empty canonical strings; hashes are lowercase SHA-256;
budget and resource values are finite non-negative integers within configured
ceilings; timestamps are UTC RFC3339; arrays are duplicate-free and sorted.
Every record carries schema version, correlation ID, and provenance. Unknown
fields, invalid bounds, stale versions, expired approvals, or mismatched hashes
are rejected and quarantined.

Persistence uses versioned migrations with a single fenced writer epoch and
atomic commit. Recovery validates schema, state hashes, replay keys, and
provenance; conflicts become `RECONCILE_REQUIRED`. Quarantine preserves raw
bytes, checksum, reason, timestamp, and owner. Retries are bounded and only
allowed for idempotent replay keys; `QUARANTINED`, `UNAVAILABLE`, and
`RECOVERY_PENDING` require their owning authority and cannot self-promote.
