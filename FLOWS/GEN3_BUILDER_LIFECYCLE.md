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
