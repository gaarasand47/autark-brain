# Immutable Engineering Standards

**Rule 1: The Brain Evolves with the Code**
Code changes are strictly incomplete and unverified until the Memory Vault (`autark-brain`) is perfectly synchronized. No exceptions.

The pipeline for ANY structural change, refactor, or feature addition is:
1. ✓ Execute the Code Changes
2. ✓ Update relevant `ORGANS/*.md` or `FLOWS/*.md`
3. ✓ Create/Update `DECISIONS/ADR-*.md` (if architecture changed)
4. ✓ Update `TRACEABILITY.md`
5. ✓ Re-run Audits and record mechanical proofs.
6. ✓ Re-run Tests.
7. ✓ Commit to `autark-brain` repository.

**Rule 2: Audits Must Violate, Not Validate**
Nothing passes an audit simply because the code compiles or imports look clean.
An audit must actively attempt to break the organism (e.g. string concatenation bypass, unauthorized wallet access, state machine corruption).
Every audit must be recorded using the strict mechanical format:
- Status (PASS/FAIL)
- Invariant (What was proven?)
- Attempted Violations (Exactly what attacks were attempted?)
- Result (Why they succeeded or failed)
- Evidence (Logs, traces, code references)
- Remaining Risks & Technical Debt

**Rule 3: Strict Repository Separation**
- `autark/` - Executable organism
- `autark-brain/` - Verified engineering knowledge
- `autark-lab/` - Research & experiments
- `autark-data/` - Runtime state
- `autark-bench/` - Benchmarks & performance history (Introduced later)
