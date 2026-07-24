# LLM Inference Capability

## Permissions
- **Scope:** Execution via `Cortex` organ only. No other system may raw-call `openai` or `anthropic` SDKs.
- **Provider Access:** Authorized to use keys defined in environment variables.

## Risks
- **Prompt Injection:** External data injected into `EpisodicMemory` could manipulate the LLM during `ReflectionEngine` cycles.
- **Budget Drain:** An infinite loop in `THINK` could drain the `CognitiveBudget`.
- **Hallucination:** Proposing structurally invalid JSON or biologically lethal strategies.

## Required Approvals
- Standard `Cortex` calls (Planning, Reflection, Dreaming) are pre-approved up to the `CognitiveBudget` limit (20% of Treasury).

## Budget Implications
- Extremely high. Billed per token (Input/Output). Monitored strictly by `Treasury`.

## Failure Modes
- **API Timeout (504):** Handled by fallback to secondary provider.
- **Rate Limit (429):** Exponential backoff.
- **Schema Mismatch:** Cortex throws `SchemaValidationError` and organism skips pulse.
