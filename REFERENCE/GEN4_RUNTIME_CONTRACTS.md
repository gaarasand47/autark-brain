# Gen-4 Runtime Contracts

Provider records include provider identity, implementation version, mode
(`SIMULATED` or `LIVE`), request/response provenance, model/version, evidence
hash, and clock timestamp. Simulated output is never admissible as protected
evidence; LIVE mode fails closed if the configured provider is absent or
identity/version mismatches.

Clock is injected and monotonic for lifecycle guards; Replay requires a stable
replay key and deterministic result. ResourceMeter enforces CPU, memory, disk,
process, duration, egress bytes/requests, and cost ceilings. Backup contracts
include encrypted manifest, schema/version, state hashes, RPO/RTO, restore
verification, and human-authorized activation. Deployment, rollback, and
incident transitions are separate Approval/Policy authorities; OperatorSystem
can only request and record them.
