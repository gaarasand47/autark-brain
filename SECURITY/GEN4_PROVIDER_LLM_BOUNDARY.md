# Provider and LLM Boundary

Provider and LLM calls are advisory, sandboxed, quota-limited, and provenance
tagged. Responses are untrusted input: validate schema, source, freshness,
confidence, and simulation/live mode before persistence. Simulated or synthetic
evidence cannot authorize protected action. Live mode fails closed when a real
provider is unavailable; no fallback value, hash, cost, reserve, or success
claim may resemble real evidence. Prompts, outputs, credentials, and personal
data obey privacy retention and audit rules.
