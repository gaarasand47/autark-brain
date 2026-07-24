# Codex Gen-2A Docker Verification

**Verdict:** `PASS WITH LIMITATIONS`
**Engine:** `86c8e79213d207edf4d38969a97865147f06f39f`
**Brain handoff:** `5acbed72f07f8a169e035443a1ed6ea5a9b8a99f`

The pinned Docker build, focused tests, restart recovery, duplicate suppression,
malformed-source degradation, corruption quarantine, deterministic learning,
unsupported-evidence rejection, offline authority and authority-boundary scan
all passed. Raw output and checksums are archived in
`AUDITS/GEN2A/DOCKER_VERIFICATION_2026-07-24-PASS.md`.

Cross-process locking is the accepted architectural limitation. Gen-3 remains
blocked pending human authorization.
