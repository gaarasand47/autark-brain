# Roadmap

**Status:** `Living Document`

The strategic compass and the verified Gen-1 gap analysis are recorded in
`REFERENCE/ORIGINAL_LIFE_ARCHITECTURE.md` and
`GENERATIONS/GEN1_RECONCILIATION.md`. The next work sequence is documented in
`GENERATIONS/NEXT_WORK_PLAN.md`. Gen-3 is now sealed as independently verified
historical evidence; Gen-4 remains documentation-only pending independent
Stage 0 design approval.

This roadmap defines the generational evolution of the Autark organism. Each
generation preserves prior invariants; Gen-4 is design-only and does not
authorize deployment, live operation, or Gen-5 behavior.

## [Gen-0] Genesis (Frozen)
The foundational organism.
- **Goal:** Establish the physical body, the pulse, and economic reality.
- **Organs:** Heart, Treasury, Basic Execution Sandbox, Identity Core.
- **Status:** Complete.

## [Gen-1] Mind (Reconciliation Remediation)
The cognitive foundation.
- **Goal:** Enable the organism to remember, reflect, and safely simulate strategies without burning real capital.
- **Organs:** Episodic Memory, Semantic Memory, Working Memory, Dream Engine, Skill Compiler.
- **Status:** Repair-branch test baseline restored; independent reconciliation remains open.
  The `Gen-1-RC` tag is immutable but not final-freeze verified. See
  `AUDITS/RECONCILIATION/Gen1/` and `autark:gen1-reconciliation-repair`.

## [Gen-2] Instinct & Motivation (RC1 Baseline Candidate)
The biological drive.
- **Goal:** Stop reacting to user prompts and start *wanting* things based on internal state deficits.
- **Capabilities:** 
  - Translate low Treasury into "Hunger".
  - Translate high error rates into "Anxiety" (driving conservative play).
  - Translate high stability into "Curiosity" (driving exploration).
- **Architecture:** Heart schedules instinct evaluation and consumes motivational state, while a dedicated Instinct subsystem (`InstinctSystem`) owns Need/Drive calculations (see `DECISIONS/ADR-008-GEN2-DRIVE-ARCHITECTURE.md`).
- **Baseline evidence:** Docker build, 17/17 suites and 75/75 tests, 3/3
  deterministic replays, and a 10-second read-only shadow smoke run passed.
  Full chaos/security validation is deferred.

## [Gen-3] Predictive World Modeling
**Gen-3 Builder — Opportunity-to-Artifact Organism (Stage 0 authorized).**
- **Goal:** Convert evidenced opportunities into bounded projects and tested,
  reviewable digital artifacts; no deployment or autonomous business.
- **Architecture:** One `BuilderSystem` organ; see `GENERATIONS/GEN-3.md` and
  `DECISIONS/ADR-009-GEN3-BUILDER-BOUNDARY.md`.
- **Future timeline review:** `REFERENCE/GENERATION_TIMELINE_REVIEW.md`.

## [Gen-4] Operator / Deployment Service
- **Goal:** Operate approved Gen-3 artifacts under bounded policy, sandbox,
  credential, budget, observability, and human-intervention controls.
- **Current reconciliation:** Final implementation candidate
  `6c190ffa510e0fa8df07135b6bbe67d4cebd9989` and evidence commit
  `b55df135255adeb70a0d9becbb62e6a6d629ad59` are documented with Docker digest
  `autark-gen4-task4-1@sha256:64c17e645b95b0a7cb252402bd34b1e46bb055dd9566acf65f99d6c08b984f84`.
  O6–O10 evidence and natural shutdown are complete for independent review;
  the baseline verdict and tag remain pending. No live credentials, production
  deployment, customer activity, or pilot is authorized until independent
  review and separate human authorization.

## [Gen-5] Evolution (Future, not Gen-4)
- **Goal:** Research and propose self-improvement under permanent human
  constitutional sovereignty; no Gen-5 behavior belongs in Gen-4.

## [Gen-6+] Society & Autark Swarms
The collective.
- **Goal:** Allow multiple Autarks to communicate, trade resources, specialize (e.g., one becomes a researcher, another a coder), and form a computational ecosystem.
# Strategic reconciliation (binding)

The original nine-phase vision remains canonical; Gen-0 through Gen-7 are an engineering refinement mapped to those phases in `VISION/AUTARK_STRATEGIC_COMPASS.md`. Generation numbers require a major end-to-end capability under `GOVERNANCE/GENERATION_NAMING_AND_VALUE_RULE.md`.

Gen-4 is Operator and Temporal Agency and must reach E2 operated value (and may reach E3 only with human commercial assistance). Its completion loop is persistent mission → approved deployment → health observation → bounded maintenance → recovery/rollback → measured learning. Gen-5 is Autonomous Enterprise and must include market/customer discovery, approved communication, offers, pricing, sales, contracts, delivery, payment/revenue accounting, support, portfolio, P&L and reinvestment; it targets E4/E5 and is not optional polish. Gen-6 society and Gen-7 autogenesis cannot be used to avoid proving Gen-5 real-world value.

Every Stage 0 uses the Vision Drift Check and records evidence-backed scorecard statuses; architecture, tests, simulations and documentation alone do not complete a generation.
