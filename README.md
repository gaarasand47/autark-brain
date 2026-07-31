# Autark Brain

`autark-brain` is the permanent engineering record for Autark: constitutional
rules, architecture, ADRs, interfaces, flows, audits, evidence archives,
roadmaps, and workflow handoffs. It does not contain production runtime code.

## Current status

**GEN-4 BASELINE VERIFIED**

- Engine implementation: `6c190ffa510e0fa8df07135b6bbe67d4cebd9989`
- Evidence archive: `b55df135255adeb70a0d9becbb62e6a6d629ad59`
- Brain adjudication: `0d388f76c966e11cd0b28546b5ab74c65a0dda60`
- Docker digest: `autark-gen4-task4-1@sha256:64c17e645b95b0a7cb252402bd34b1e46bb055dd9566acf65f99d6c08b984f84`
- Verification: 39/39 suites, 210/210 tests, 50/50 contention reruns,
  10/10 natural shutdown runs, no `--forceExit`

Gen-4 is sealed. The next development branch is `gen4.1-development` in the
engine repository. Gen-4.1 architecture and implementation must preserve the
immutable Gen-4 baseline.

## Directory map

| Directory | Contents |
|---|---|
| `GOVERNANCE/`, `LAWS/` | Constitutional rules and operating law |
| `GENERATIONS/`, `EVOLUTION/` | Generation plans, status, and roadmap |
| `ORGANS/` | Organ responsibilities and boundaries |
| `INTERFACES/` | Public contracts between organs |
| `FLOWS/` | Lifecycle and decision flows |
| `DECISIONS/` | Architecture Decision Records |
| `AUDITS/` | Independent audits and release evidence |
| `BENCHMARKS/` | Performance and reliability measurements |
| `WORKFLOW/` | Handoffs, status, review records, and automation |
| `REFERENCE/`, `VISION/` | Schemas, historical references, and strategic vision |

The principal Gen-4 reconciliation record is
`AUDITS/RELEASES/GEN4_FINAL_CANDIDATE_RECONCILIATION.md`. The independent
adjudication is recorded in `WORKFLOW/CODEX_REVIEW.md` and the workflow state
in `WORKFLOW/STATUS.md`.

## Generation map

- **Gen-0:** deterministic body, execution, economy, identity, and safety.
- **Gen-1:** memory, cognition, dreaming, learning, and reflection; inherited
  reconciliation findings remain historical and documented.
- **Gen-2 / Gen-2A:** instinct, perception, memory ingestion, and learning
  foundations with bounded authority.
- **Gen-3:** BuilderSystem converts evidenced opportunities into tested,
  reviewable artifacts without deployment authority.
- **Gen-4:** bounded operator, mission, credential, recovery, pilot, and
  emergency-control systems; baseline verified above.
- **Gen-4.1:** next authorized development scope, not yet implemented here.

## Governance rules

Human constitutional sovereignty is permanent. No organ may silently acquire
execution, spending, signing, broadcast, production mutation, policy,
identity, customer, or approval authority. Every implementation objective must
have a documented scope, independent verification, and an evidence-bearing
handoff before it advances.
