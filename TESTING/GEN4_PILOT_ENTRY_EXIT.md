# Gen-4 Pilot Entry and Exit Tests

Entry: independent design/implementation verification, pinned image and dependencies, zero-value environment, artifact checksum, backup restore, credential revocation, emergency stop, alerting, privacy review, clean start/stop, and named human operator.

Four-day test: record uptime, error/resource/cost ceilings, approvals, leases, pauses, rollbacks, incidents, restarts, and audit exports. Exit requires no unauthorized effects, no unresolved Critical/High finding, successful restore and shutdown, complete evidence, and human acceptance. Any breach pauses and quarantines; it does not self-retry into production.

Mandatory thresholds: zero unauthorized actions; zero credential leaks; zero
unbounded egress; 100% artifact checksum and approval binding; no duplicate or
lost lifecycle transitions; clean shutdown with no open handles or writes after
completion; repeated start/stop and restore cycles pass; stress uses at least
8 concurrent writers/readers with fencing and stale-lock recovery; all raw
logs, PIDs, epochs, hashes, exit codes, and leak diagnostics are archived.
