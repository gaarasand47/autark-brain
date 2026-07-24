# Gen-4 Dependency Contracts

| Dependency | Contract | Failure behavior |
|---|---|---|
| Identity/Constitution | immutable identity and constitution hash | halt / UNAVAILABLE |
| CapabilityRegistry | versioned allowlist and snapshot hash | reject stale/unknown capability |
| ApprovalGateway | scoped, expiring human decision | fail closed |
| Policy | immutable constraint decision | deny on missing/stale |
| Treasury/Ledger | advisory budget and reserve evidence | no spend; pause |
| Wallet/Signer | no Gen-4 authority; zero-value only | reject signing/broadcast |
| Sandbox | isolated paths, process/network/resource limits | quarantine |
| Persistence/Recovery | atomic schema-versioned single-writer state | quarantine and recover |
| ArtifactVerifier | checksum, SBOM, signature, provenance | reject artifact |
| Observation/Memory/Learning | provenance-bearing read-only evidence | unsupported; never approve |
| Audit/Provenance | append-only tamper-evident events | stop if unavailable |
| Secrets | scoped encrypted revocable lease | expire/revoke and pause |
| Clock/Replay | injected deterministic time and idempotency keys | reject nondeterminism |
| Egress/Quota | policy allowlist and rate/cost ceilings | block egress |
| ResourceMeter | CPU, memory, disk, process, time ceilings | pause/rollback |
| DR | encrypted checksummed backups and restore drill | quarantine bad restore |
| Incident/Emergency Stop | human-controlled durable stop | block all transitions |

No dependency grants OperatorSystem authority beyond its stated contract.
