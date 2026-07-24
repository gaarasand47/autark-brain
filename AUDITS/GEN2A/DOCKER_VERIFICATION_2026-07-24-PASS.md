# Gen-2A Docker Adversarial Verification Record

**Verdict:** `PASS WITH LIMITATIONS`
**Recorded:** 2026-07-24T14:13:18.8135908+05:00
**Engine commit:** `86c8e79213d207edf4d38969a97865147f06f39f`
**Brain handoff commit:** `5acbed72f07f8a169e035443a1ed6ea5a9b8a99f`
**Pinned image:** `autark-gen2a-verify@sha256:a995e92ee874503a634892660ae0472379a114ac5c6bcc973a4de9569e4368ea`

## Commands and results

- `docker build --pull=false -t autark-gen2a-verify:86c8e79 .` — exit `0`.
- Focused Jest with `--runInBand --forceExit` — exit `0`, 1 suite / 3 tests.
- Focused Jest with `--runInBand --detectOpenHandles` — exit `0`, 1 suite / 3 tests.
- Docker Node adversarial assertions — exit `0`:
  restart recovery, duplicate suppression, malformed-source `UNAVAILABLE`,
  corruption quarantine, deterministic lesson decay, unsupported evidence
  rejection, and hypothesis authority `NONE`.
- Docker authority scan of `src/observation`, `src/learning` and `src/dreaming`
  — no execution/Treasury/wallet/signing/broadcast/mutation/policy/identity/
  approval authority found.

## Checksums

```text
ObservationEngine.ts  B90AE310950DB59A6FAB833EEAF522F5BF1EB14100B0ED769FD9815CB6CEA718
ObservationEnvelope.ts 76BC20188D5DC9CE4F357F64F6B81B7A5FC685CCA5FBA10FD9823CF09A7C7D1C
LessonLedger.ts       B48BE38245853BBAF706D9B7EA9FF2864FC66C7A508081ED92EF6622DE897A30
HypothesisEngine.ts   5F4D78F23B48AED66618F34BE77D3D71F2AD7A609D7107C5E0E6AC38F656D9D8
```

**Limitation:** persistence serialization is bounded to one writer/process;
cross-process locking is not implemented and is accepted by the architecture.
No Gen-3 behavior was added or tested.
