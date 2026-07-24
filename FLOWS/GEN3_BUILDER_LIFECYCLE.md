# Gen-3 Builder Lifecycle Flow

```text
Observation/Hypothesis
  → evidence validation and opportunity deduplication
  → qualification and expiry check
  → human project approval
  → deterministic specification and budget
  → isolated artifact construction
  → tests/security/build validation
  → review package with checksums and limitations
  → human release decision outside Gen-3
  → outcome observation and learning
```

Every transition is versioned, persisted atomically, replayable and guarded.
Failure produces a durable failure record and quarantines partial artifacts.
The flow cannot access production deployment, customer communication, wallet,
signing, broadcast or real-money actions.
## Transition records and terminal behavior

Each transition is an atomic versioned record containing actor, decision,
evidence references, prior/new versions, timestamp and correlation ID. A
missing guard fails closed. `ACCEPTED_FOR_RELEASE` is terminal with no side
effect; deployment and operation are later-generation decisions. Outcomes
without externally observable evidence are recorded only as `UNMEASURED`.
