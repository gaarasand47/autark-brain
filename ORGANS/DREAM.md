# Dream Engine

## 1. Why this exists & Biological Role
The `DreamEngine` is the organism's safe simulator. In traditional AI, if an agent wants to try a new strategy, it runs it in production and hopes for the best. Autark is biologically forbidden from running untested code in production. The Dream Engine allows the organism to construct synthetic states, compile hypotheses into code, and run them against mocked APIs. If it succeeds, the hypothesis graduates to a `SemanticRule` or `Skill`. If it fails, no real money is lost, and no real systems are damaged.

## 2. Responsibilities & Inputs/Outputs
- **Responsibilities:**
  - Mock external API boundaries (Network, Filesystem, LLM wrappers).
  - Inject synthetic scenarios derived from failed `EpisodicMemory` events.
  - Execute candidate `Skills` within a strict timeout and memory limit.
  - Report success/failure back to the `ReflectionEngine`.
- **Inputs:** A specific scenario (e.g., "Mock the Stripe API returning 500") and a candidate logic block.
- **Outputs:** A deterministic execution report (Pass/Fail, Time taken, Memory used, Error trace).

## 3. Internal Data Structures & State Transitions
- **State Transition:** 
  - `IDLE` -> `BOOTING_SIMULATOR` -> `RUNNING_HYPOTHESIS` -> `REPORTING` -> `TEARDOWN`.

## 4. Dependency Map
- **Depends On:** 
  - `Sandbox` (For executing the actual code block).
  - `Treasury` (Requires `CognitiveBudget` to even begin a dream cycle).
- **Used By:** 
  - `Heart` (Triggers it during `SLEEP` phase if budget allows).
  - `EvolutionManager` (To test codebase mutations before proposing).

## 5. Invariants
- **Zero Real Side Effects:** Code running inside the Dream Engine MUST NOT have access to live network sockets, real file system paths outside `/tmp/dream`, or the real `Ledger`.
- **Budget Constrained:** Dreaming consumes LLM tokens to generate the mocks and scenarios. It must immediately halt if the `CognitiveBudget` hits 0.

## 6. Performance Budget
- **Time:** A single Dream simulation cannot exceed 5 minutes. If it hangs, the Heart violently terminates the thread.
- **Memory:** Simulated environment capped at 50MB RAM.

## 7. Observability
- **Metrics Produced:** `dreams_simulated`, `dreams_passed`, `dreams_failed`, `dream_time_ms`.
- **Logs Produced:** `DREAM_START`, `DREAM_MOCK_GENERATED`, `DREAM_HYPOTHESIS_FAILED`, `DREAM_HYPOTHESIS_PASSED`.

## 8. Lifecycle
- **Birth/Init:** Loads mock templates and verifies the Sandbox binary.
- **Normal Operation:** Runs heavily during the `SLEEP` state.
- **Failure:** If the Sandbox crashes, the dream is logged as a catastrophic hypothesis failure.
- **Recovery:** Teardown is guaranteed by a strict process monitor.
- **Shutdown:** Kills any hanging Sandbox processes.

## 9. Security Boundaries & Economic Cost
- **Security:** The highest risk organ. If the isolation breaks, a hallucinated strategy could execute real trades or delete files. It relies on strict Node.js `vm` or `worker_threads` isolation (and Docker in Gen-3).
- **Economic Cost:** Very high. Generating plausible synthetic data via LLM costs significant capital.

## 10. Technical Debt & Known Limitations
- Node.js `vm` is not a true security boundary for malicious code. For Gen-1, it assumes the code is buggy, not actively malicious.

---
### Implementation Maturity
Experimental (Gen-1)

### Source Files
- `src/cognitive/DreamEngine.ts`
- `src/security/Sandbox.ts`

### Future Extensions
- **Gen-3:** True Docker-in-Docker isolation for the Dream Engine.
- **Gen-4:** The ability to pull live staging data into the dream instead of purely hallucinating mocks.
