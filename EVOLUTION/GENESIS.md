# Genesis (Gen-0)

**Era:** The Beginning

Genesis is the foundational build of the Autark organism. It answered the most basic question: Can we build a piece of software that pays its own bills and has a biological pulse?

## What Survived
- **The Heart:** The concept of a single-threaded synchronous `tick()` loop proved incredibly stable. It forced all execution to be deterministic.
- **The Treasury:** The strict 20% creator sweep and ledger logic worked flawlessly, establishing trust.

## What Failed
- **Stateless Execution:** Gen-0 had no memory. It reacted to every input as if it had just been born. This led to infinite loops if an external API repeatedly sent the same error, as the organism could not "remember" that it just tried and failed.
- **Runaway API Costs:** Gen-0 ran LLM prompts without a cognitive budget. In one test, it burned $5.00 in 10 minutes trying to parse a broken JSON payload.

## Lessons Learned
- Intelligence without memory is just a state machine.
- Cognition must be budgeted just like external action.
- The organism needs a place to "practice" without burning real capital.

This led directly to the architectural requirements of **Gen-1 (Mind)**.
