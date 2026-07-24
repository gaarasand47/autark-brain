# ADR-010: Gen-4 Operator Boundary

Status: proposed, Stage 0 only. Supersedes no prior ADR; extends ADR-009 without changing Gen-3 authority.

Gen-4 may coordinate deployment and operation of an already accepted Gen-3 artifact, but every effect is mediated by existing Policy, Treasury, Sandbox, Approval, and ProtectedActionGateway authorities. OperatorSystem cannot approve itself, mint credentials, alter constitution, or deploy without an independently recorded approval.

Decisions: fail closed on missing/stale evidence; immutable append-only audit; atomic versioned transitions; deterministic replay; single-writer persistence unless a later ADR authorizes a proven distributed protocol; human emergency stop always wins.
