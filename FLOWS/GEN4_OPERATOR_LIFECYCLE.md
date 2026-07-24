# Gen-4 Operator Lifecycle

1. Validate artifact checksum, provenance, policy, budget, dependency and sandbox attestations.
2. Obtain separate deployment approval; stage in isolated workspace.
3. Run deterministic canary with health/error/resource thresholds and immutable evidence.
4. Human/ApprovalGateway records canary acceptance before activation.
5. ServiceSupervisor operates only the approved artifact under quotas and network allowlists.
6. On threshold breach, pause or rollback using an explicit incident decision; never auto-escalate authority.
7. Maintenance changes create a new artifact/version and repeat validation; in-place mutation is forbidden.
8. Retire with evidence, credential revocation, backup, and audit export.

Failure states are `UNAVAILABLE`, `QUARANTINED`, `PAUSED`, `ROLLING_BACK`, and
`RECOVERY_PENDING`. They cannot auto-transition to ACTIVE; fresh evidence and
the owning approval are required. Recovery is atomic, idempotent, and writes
no post-shutdown events.

`RECONCILE_REQUIRED` is owned by the human/ApprovalGateway after a replay or
state conflict. Retry rules: only bounded idempotent retries for transient
provider/resource errors; never retry policy, approval, credential, identity,
hash, or authority failures. Quarantine is owned by Persistence/Incident and
requires forensic evidence before discard.
