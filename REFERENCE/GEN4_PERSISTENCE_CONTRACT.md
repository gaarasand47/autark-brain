# Gen-4 Persistence Contract

Persistence owner is OperatorSystem's versioned state store. Acquisition uses
a lock file with owner ID and fenced writer epoch; lease expiry is checked on
every write. Readers use immutable snapshots and never block recovery. A stale
lease can be taken over only after monotonic clock validation; the former epoch
is rejected on resume. Migrations are ordered, checksummed, transactional, and
schema-versioned. Corrupt/truncated bytes are quarantined with raw bytes,
hash, reason, timestamp, and owner. Recovery validates state/provenance hashes
and replay keys; conflicts become `RECONCILE_REQUIRED` for human/ApprovalGateway.
