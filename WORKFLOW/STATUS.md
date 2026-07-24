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
