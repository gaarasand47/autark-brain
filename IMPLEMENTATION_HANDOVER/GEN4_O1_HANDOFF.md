# Gen-4 O1 Implementation Handoff

Candidate engine commit: `2ae39e1` on `gen4-development`.

This objective is limited to typed Operator intent envelopes, deterministic
lifecycle records, atomic/versioned persistence, replay/idempotency, writer
fencing, and corruption quarantine. It grants no execution, deployment,
Treasury, wallet, signing, broadcast, production mutation, policy, identity,
or approval authority.

Independent verification must cover clean pinned-Docker build, adversarial
schema/bounds/timestamp/provenance tests, restart and duplicate replay,
stale-writer rejection and takeover, quarantine evidence, natural shutdown,
and static/runtime authority checks. The reviewer must record one verdict in
`WORKFLOW/CODEX_REVIEW.md`; no baseline tag or later objective may advance on
an unverified candidate.
