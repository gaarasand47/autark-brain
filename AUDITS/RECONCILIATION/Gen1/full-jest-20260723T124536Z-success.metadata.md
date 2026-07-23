# Gen-1 Successful Full Jest Reconciliation Evidence

- Command: `docker compose -f docker-compose.test.yml build --no-cache rvf-runner; docker compose -f docker-compose.test.yml run --name gen1-jest-full-99574f9-rerun rvf-runner npx jest --runInBand`
- Exit code: `0`
- Started (UTC): `2026-07-23T12:45:32.89864281Z`
- Finished (UTC): `2026-07-23T12:45:46.456926051Z`
- Result: `8 passed suites; 19 passed tests`
- Pinned base image: `node:22@sha256:5647be709086c696ff32edaaf1c70cd26d1da6ab2b39c32f3c7b4c4a31957e37`
- Rebuilt image digest: `gen1-rc-audit-rvf-runner@sha256:eaed4bb115a60417fa9fc4cecdf6c7ad688948f2d147804c7c0166f154ef8027`
- Immutable Gen-1-RC base SHA: `b81204d7f1fb63c07fecc957cb0f490330d6ed6f`
- Source baseline commit: `541a032`
- Documentation evidence commit: `111b487`
- Raw log: `full-jest-20260723T124536Z-success.log`
- Raw-log SHA-256: `E43F02247DC3C4176400239FBDA32CE84FD6A6A5440EEACEA273061D0F1FDD60`

This demonstrates the restored test baseline on the reconciliation branch only. It does not verify production readiness, release gates, or the immutable Gen-1-RC tag.
