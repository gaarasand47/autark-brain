# Immutable Engineering Standards

When operating in the Autark workspaces, you MUST abide by these operational principles at all times:

## 1. The Brain Evolves with the Code (Scaled to Scope)
Code changes are unverified until the Memory Vault (`autark-brain`) is appropriately synchronized.
- **If architecture changes**: Update ADRs, Organ docs, and Flows.
- **If interfaces change**: Update Interface docs and Traceability.
- **If behavior changes**: Update the Memory Vault relevant sections.
- **If implementation only**: Update only the specifically affected documentation.

## 2. Never Claim Implementation Without Proof
Never state that a feature is implemented unless one of the following exists:
- Executable code
- Passing tests
- Audit evidence
- Runtime logs

Otherwise, explicitly classify it as: `[Planned]`, `[Partial]`, `[Prototype]`, or `[Experimental]`.

## 3. Audits Must Violate, Not Validate
Nothing passes an audit simply because the code compiles or imports look clean.
An audit MUST actively attempt to break the organism (e.g., string concatenation bypasses, unauthorized wallet access, state machine corruption).
Every audit MUST be recorded using this exact mechanical format:
- **Status**: (PASS/FAIL)
- **Invariant**: (What was being proven?)
- **Attempted Violations**: (Exactly what attacks were attempted?)
- **Result**: (Why they succeeded or failed)
- **Evidence**: (Logs, Code references, Tests, Execution trace)
- **Remaining Risks**: (Known limitations)
- **Technical Debt**: (Future improvements)

## 4. Evidence First
Every claim or explanation must answer:
- Where?
- Which file?
- Which function?
- Which test?
- Which audit?
- Which commit?

## 5. No Mocks Survive a Freeze
Before freezing a generation, you MUST mechanically search the entire codebase for:
`TODO`, `FIXME`, `MOCK`, `TEMP`, `HACK`, `STUB`, `PLACEHOLDER`

Every occurrence must be:
- Removed
- Justified
- Or documented explicitly as intentional technical debt in an ADR or Audit.

## 6. Strict Repository Separation
Respect the architectural boundaries of the organism:
- `autark/` - Executable organism
- `autark-brain/` - Verified engineering knowledge
- `autark-lab/` - Research & experiments
- `autark-data/` - Runtime state
- `autark-bench/` - Benchmarks & performance history
