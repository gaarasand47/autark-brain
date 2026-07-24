# Maintenance Flow

Propose maintenance against an immutable artifact version, validate dependencies and budget, obtain approval, stage in isolation, run tests/canary, and activate only after acceptance. Maintenance never edits a running artifact in place; failure quarantines the candidate.
