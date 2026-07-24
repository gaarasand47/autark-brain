# Credential Boundary

Credentials are leased, never owned by OperatorSystem. A lease is bound to environment, artifact hash, capability, audience, expiry, correlation ID, and approval. Secrets are encrypted in use/storage, redacted from logs, rotated and revocable. Missing, expired, mismatched, or leaked credentials fail closed. Dev, testnet, pilot, and production stores are physically and logically separated.
