# OperatorSystem

OperatorSystem is the sole top-level Gen-4 operator organ. DeploymentManager, ServiceSupervisor, MaintenanceScheduler, IncidentManager, CredentialLeaseManager, and ObservabilityAdapter are internal components and have no public authority beyond OperatorSystem.

Inputs are accepted artifact manifests, policy decisions, budgets, sandbox attestations, health evidence, and human approvals. Outputs are immutable operator intents and evidence envelopes. It cannot execute arbitrary code, access production paths, send network traffic outside an allowlist, spend funds, sign, broadcast, communicate with customers, or mutate Autark source.

Every operation carries artifact hash, policy version, budget, provenance, expiry, correlation ID, and approval reference. Recovery quarantines malformed state and returns UNAVAILABLE; no silent fallback.
