# Heart–Operator Interface

Heart may call only `OperatorSystem.observe()`, `stage()`, `requestCanary()`, `pause()`, `rollback()`, `maintain()`, and `recoverState()`. Calls are read-only planning or bounded lifecycle requests; Heart never receives credentials or executes effects. Returned envelopes are immutable and advisory until the owning authority records a decision.
