# Roadmap

**Status:** `Living Document`

The strategic compass and the verified Gen-1 gap analysis are recorded in
`REFERENCE/ORIGINAL_LIFE_ARCHITECTURE.md` and
`GENERATIONS/GEN1_RECONCILIATION.md`. The next work sequence is documented in
`GENERATIONS/NEXT_WORK_PLAN.md`; no Gen-3 implementation is authorized until
that reconciliation receives independent design review.

This roadmap defines the generational evolution of the Autark organism. Each generation introduces a distinct biological or structural capability while preserving the invariants of all previous generations. 

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

## [Gen-4] Planning & Temporal Reasoning
The long-term strategist.
- **Goal:** Break complex, multi-day goals into hierarchical steps. Maintain focus across hundreds of sleep cycles without losing the thread of the objective.

## [Gen-5] Fully Autonomous Evolution
The self-coder.
- **Goal:** Transition the `EvolutionManager` from requiring human signature for every codebase change to autonomously deploying safe, formally verified mutations.
- **Architecture:** Formal Verification constraints added to the Sandbox.

## [Gen-6+] Society & Autark Swarms
The collective.
- **Goal:** Allow multiple Autarks to communicate, trade resources, specialize (e.g., one becomes a researcher, another a coder), and form a computational ecosystem.
