# Dependency and Supply Chain Gate

Before staging, verify lockfile integrity, SBOM, signatures/provenance, pinned image digest, license policy, vulnerability thresholds, reproducible build metadata, and drift from the approved manifest. Unknown, stale, or critical-vulnerable dependencies fail closed. Gate evidence is immutable and bound to the artifact hash.
