# Current State of Autark Organism

> ## Gen-1 reconciliation override — 2026-07-23
>
> Gen-1-RC (`b81204d7f1fb63c07fecc957cb0f490330d6ed6f`) is immutable and was
> independently found to have failed reconciliation. Remediation is on
> `autark:gen1-reconciliation-repair`, currently through `111b487` (with the
> restored test baseline at `541a032`). The successful 8-suite/19-test Docker
> run is repair-branch evidence only; it does **not** make Gen-1 frozen,
> production-ready, or final-freeze verified. See
> `AUDITS/RECONCILIATION/Gen1/full-jest-20260723T124536Z-success.metadata.md`.

**Generation:** Gen-2  
**Current Stage:** Stage 0 (Baseline Inheritance & Architecture Reconciliation)  
**Status:** Gen-2 Stage 0: DESIGN REVIEW  
**Source Implementation:** NOT STARTED (Awaiting Codex Stage 0 Architecture Approval)  

---

## Baseline Provenance & Branching Origin
- **Immutable Gen-1-Baseline Tag Targets:**
  - `autark` engine tag (`Gen-1-Baseline`): `5c39218208d160cc46725ae8d1e5354a08c567d8`
  - `autark-brain` memory vault tag (`Gen-1-Baseline`): `37bca336ab4e17cff306208e52cf8d8772ac8db7`
- **Stage-0 Branching Origin Commits:**
  - `autark` engine repository: `0136b096fa2f5068d1833d89ea5cd9658bc51923` (branch: `gen2-development`)
  - `autark-brain` memory vault: `26d532506672504f092afb96fd449d7261321236` (branch: `gen1-baseline`)

---

## Repositories & Working Directory
Parent Directory: `d:\autark\`

| Repository | Path | Role | Branch | Commit |
|---|---|---|---|---|
| **`autark`** | `d:\autark\autark` | Executable Organism Engine | `gen2-development` | `0136b096fa2f5068d1833d89ea5cd9658bc51923` |
| **`autark-brain`** | `d:\autark\autark-brain` | Memory Vault & Engineering Knowledge | `gen2-development` | `HEAD` |
| **`autark-bench`** | `d:\autark\autark-bench` | Benchmarking & Reliability Engine | `gen2-development` | `HEAD` |
| **`autark-lab`** | `d:\autark\autark-lab` | Research & Prototypes | N/A | N/A |
| **`autark-data`** | `d:\autark\autark-data` | Runtime State & SQLite DBs | N/A | N/A |

---

## Gen-2 Progress Matrix

- [ ] **G2-S0-O1 Stage 0 Architecture Reconciliation**: DESIGN REVIEW — Awaiting independent Codex review of ADR-008 & Gen-2 spec.
- [ ] **Stages 1-7 (G2-S1-O1 through G2-S7-O3)**: OPEN — Source implementation not started.

## Gen-1 Inherited Audit Status

- [ ] **Stage 11 Production Readiness**: UNVERIFIED — prior PASS is superseded by reconciliation findings.
- [ ] **Stage 12 Deterministic Replay**: OPEN — direct clock/random dependencies remain.
- [ ] **Stage 13 Architecture Drift**: OPEN — traceability and organ/interface claims conflict with code.
- [ ] **Stage 14 Release Candidate / Live Validation**: UNVERIFIED — no live validation is authorized or evidenced.
- [ ] **Stage 15 Gen-1 Freeze**: OPEN — immutable tag preserved; final-freeze decision withheld.
