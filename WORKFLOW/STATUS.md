GEN3_BASELINE_READY_WITH_LIMITATIONS

G3-S1-O3 independently verified at autark commit ec52565. Docker build and
five focused suites (23/23) passed. Accepted limitations: no explicit
cross-process stale-lock/concurrency test, capability registry provenance is
membership-validated but not persisted as a snapshot hash, and authority
scanning is regex-based. No deployment or later-generation authority.

Limitation-fix verification at engine commit `713913d`: PASS WITH
LIMITATIONS. Docker and TypeScript passed; 27/27 focused tests passed.
Registry snapshot hashing, stale-lock takeover, competing-writer rejection,
replay conflict, and raw-byte quarantine hashing passed. Remaining limits are
full multi-process stress coverage and runtime-complete authority reachability.

GEN3_BASELINED_AWAITING_GEN4_AUTHORIZATION

Human baseline authorization accepted. Evidence is archived in
`AUDITS/RELEASES/GEN3_BASELINE_ARCHIVE.md`. Gen-4 remains blocked pending
separate human authorization.

GEN3_FOUNDATION_HARDENING_VERIFIED_WITH_LIMITATIONS

Final hardening evidence is archived in
`AUDITS/RELEASES/GEN3_FINAL_FOUNDATION_HARDENING.md`. No RC2 tag is created
until the remaining high-contention stress and inherited Gen-1 test issues
are separately resolved or explicitly authorized.

GEN3_FOUNDATION_HARDENED_AWAITING_GEN4_AUTHORIZATION

Fresh independent Docker verification passed at engine commit `6e254a5`:
25 suites/112 tests, natural exit, and complete asserted multiprocess stress.
Final evidence is archived in
`AUDITS/RELEASES/GEN3_FOUNDATION_HARDENING_FINAL.md`. Gen-4 remains blocked
until separate human authorization.
GEN4_STAGE0_DESIGN_IN_PROGRESS

Human authorization accepted the confirmed Gen-4 Stage 0 additions and
exclusions. Documentation-only architecture package is prepared for
independent Codex design review. No Gen-4 implementation has started.

READY_FOR_CODEX_STRATEGIC_VISION_REVIEW

Gen-4 design package has typed contracts, provider/LLM boundaries, lifecycle
recovery semantics, pilot thresholds, and complete dependency traceability.

GEN4_O1_IMPLEMENTATION_READY_FOR_INDEPENDENT_VERIFICATION

Implementation candidate: autark commit `2ae39e1` on `gen4-development`. This
is an unverified handoff for independent Docker, adversarial, restart, and
authority verification only. No later objective, live credential, deployment,
or Gen-4 baseline is authorized.

GEN4_O1_VERIFIED_READY_FOR_GEN4_O2_PLAN

O1 independently passed at engine commit `efd03e2`. Pinned Docker image digest
`sha256:5907dbe...`; focused verification passed 9/9 tests. Dependency
advisories and broader multi-process stress remain tracked limitations. The
next permitted action is drafting the narrow G4-O2 plan; implementation and
live operation remain blocked pending that plan and review.

GEN4_O2_REPAIR_REQUIRED

Independent review of engine commit `a4916e9` returned `FAIL`. Repair is
required within the existing O2 scope. Do not advance to O3, create a Gen-4
baseline, add credentials, deploy, or broaden authority until a fresh
independent verification passes.

GEN4_O2_VERIFIED_READY_FOR_GEN4_O3_PLAN

O2 independently passed at engine commit `ae40e73`. Docker digest
`sha256:bbacb066...`; four focused tests passed. The inherited O1 quarantine
path assertion remains a documented hardening caveat. The next permitted
action is drafting the narrow G4-O3 plan; no implementation or baseline tag is
authorized yet.

GEN4_O5_VERIFIED_READY_FOR_GEN4_O6_PLAN

O5 independently passed at engine commit `d7b6ca8`. Docker digest
`sha256:2bf594...`; three focused tests passed. The inherited O1
quarantine-path assertion remains a documented hardening caveat. The next
permitted action is drafting the narrow G4-O6 plan; no implementation or
baseline tag is authorized yet.

GEN4_O6_REPAIR_AND_REMAINING_OBJECTIVES_DEFINED

The canonical remaining objective sequence is recorded in
`GENERATIONS/GEN4_OBJECTIVE_SEQUENCE.md`. O6 implementation exists but is
unverified and remains blocked on fencing, contention, replay-conflict,
quarantine-evidence, shutdown, and authority regression evidence. O7 temporal
mission, O8 credential/DR and human intervention, O9 zero-value pilot/outcomes,
and O10 integrated baseline are architecture-only plans until each prior
objective independently passes. No live credentials, production deployment,
customer activity, pilot, or Gen-5 behavior is authorized.

GEN4_O7_O10_IMPLEMENTED_UNVERIFIED

Implementation commits now exist on the engine `gen4-development` branch for
the remaining planned objectives, but they are not approved or baselined:

- O7 temporal mission/operator lifecycle: `9414b90`
- O8 credential, disaster-recovery, and human-intervention closure: `c472040`
- O9 zero-value/testnet pilot and measured outcomes: `781a734`
- O10 integrated baseline candidate: `7720235`

These commits are **IMPLEMENTED_UNVERIFIED** only. O6 fencing, contention,
replay-conflict, quarantine-evidence, shutdown, and authority blockers remain
unresolved. O7 also has hardening gaps, and the actual Heart-to-operator wiring
is absent. No independent verification, baseline tag, live credential, pilot,
production deployment, customer activity, or Gen-5 behavior is authorized.

GEN4_O7_REPAIR_REQUIRED

Independent review of O7 engine commit `c8b2905` returned **FAIL**. Gaps:
real OS-process contention, concurrent readers, repeated rounds, natural
shutdown/cleanup; deep cross-reference and deadline validation; rejection and
persistence of illegal or skipped transitions; sequential chain/version/hash
verification; post-save owner-token/epoch fencing; quarantine byte/evidence
hash assertions; and replay coverage for restart, tampering, and concurrency.

O8 `c472040`, O9 `781a734`, and O10 `7720235` remain IMPLEMENTED_UNVERIFIED and
blocked behind O7. Required order: O7 repair/PASS -> O8 hardening/PASS -> O9
hardening/PASS -> O10 hardening/PASS -> O6 closure/PASS -> integrated Docker
and full-suite evidence -> human baseline decision. No baseline tag or live
operation is authorized.

GEN4_O4_VERIFIED_READY_FOR_GEN4_O5_PLAN

O4 independently passed at engine commit `a3e389d`. Docker digest
`sha256:e6edaa4...`; five focused tests passed. The inherited O1
quarantine-path assertion remains a documented hardening caveat. The next
permitted action is drafting the narrow G4-O5 plan; no implementation or
baseline tag is authorized yet.

GEN4_O7_COMBINED_REVIEW_FAILED_UNVERIFIED

Latest O7 repair commits: `44f3eb8` + `38af682`. Independent review is
**FAIL / UNVERIFIED**: Docker daemon unavailable (no executable evidence);
save lacks validation; cross-references/deadlines/dependencies are shallow;
transition-chain continuity/hash verification is absent; contention neither
kills workers nor proves OS stale fencing; quarantine cleanup/dispose has gaps.
O8 `c472040`, O9 `781a734`, and O10 `7720235` remain blocked/unverified.

Next repairs: validate every save (schema, bounds, provenance, deadlines,
dependencies, cross-reference closure); persist/verify contiguous transition
versions and hashes with illegal/skipped/tampered rejection; test real
OS-process contention with concurrent readers, repeated rounds, worker
termination, and stale-token/epoch fencing; close quarantine byte/evidence
hashing and cleanup/dispose; restore Docker-backed shutdown, restart, tamper,
and replay evidence; then obtain a fresh independent Docker PASS at the exact
final commit. No baseline, credentials, deployment, pilot, customer activity,
or Gen-5 behavior is authorized.

GEN4_O3_VERIFIED_READY_FOR_GEN4_O4_PLAN

O3 independently passed at engine commit `66c0ff1`. Docker digest
`sha256:84b665...`; six focused tests passed. The inherited O1 quarantine-path
assertion remains a documented hardening caveat. The next permitted action is
drafting the narrow G4-O4 plan; no implementation or baseline tag is
authorized yet.
