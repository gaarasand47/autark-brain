# Gen-2A Docker Adversarial Verification Record

**Verdict:** `UNVERIFIED`
**Recorded:** 2026-07-24T14:10:13.8454742+05:00
**Engine commit:** `86c8e79213d207edf4d38969a97865147f06f39f`
**Brain handoff commit:** `5acbed72f07f8a169e035443a1ed6ea5a9b8a99f`

## Required Docker command

```text
docker version --format '{{.Server.Version}}'
```

Exit code: `1`

Raw output:

```text
failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine; check if the path is correct and the daemon is running; open //./pipe/dockerDesktopLinuxEngine: The system cannot find the file specified.
```

## Evidence checksums

```text
ObservationEngine.ts  B90AE310950DB59A6FAB833EEAF522F5BF1EB14100B0ED769FD9815CB6CEA718
ObservationEnvelope.ts 76BC20188D5DC9CE4F357F64F6B81B7A5FC685CCA5FBA10FD9823CF09A7C7D1C
```

The pinned Docker build, focused tests, restart/recovery, duplicate
suppression, malformed-source degradation, corruption quarantine, deterministic
learning, unsupported-evidence rejection, offline-authority checks and
authority-boundary checks were not executable because the Docker daemon was
unavailable. No Gen-2A baseline tag was created and no Brain status was changed.
