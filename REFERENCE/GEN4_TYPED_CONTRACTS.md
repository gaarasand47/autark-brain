# Gen-4 Typed Contracts

```ts
type Environment = 'DEV' | 'TESTNET' | 'PILOT';
type Lifecycle = 'PROPOSED'|'APPROVED'|'STAGED'|'CANARY'|'ACTIVE'|'PAUSED'|'ROLLING_BACK'|'RETIRED';
interface OperatorIntent { intentId:string; artifactHash:string; environment:Environment; capabilitySet:string[]; budgetCents:number; policyVersion:string; approvalRef:string; evidenceHash:string; expiresAt:string; rollbackTarget:string|null; }
interface LifecycleTransition { transitionId:string; from:Lifecycle; to:Lifecycle; actorId:string; authority:string; reason:string; evidenceHash:string; version:number; occurredAt:string; }
interface HealthEvidence { artifactHash:string; observedAt:string; errorRate:number; latencyMs:number; cpuPercent:number; memoryBytes:number; status:'HEALTHY'|'DEGRADED'|'UNAVAILABLE'; evidenceHash:string; }
interface CredentialLease { leaseId:string; environment:Environment; artifactHash:string; capability:string; issuedAt:string; expiresAt:string; revokedAt:string|null; }
```

All identifiers are non-empty canonical strings; hashes are lowercase SHA-256;
budget and resource values are finite non-negative integers within configured
ceilings; timestamps are UTC RFC3339; arrays are duplicate-free and sorted.
Every record carries schema version, correlation ID, and provenance. Unknown
fields, invalid bounds, stale versions, expired approvals, or mismatched hashes
are rejected and quarantined.
