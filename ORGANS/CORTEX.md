# Cortex

## 1. Why this exists & Biological Role
The `Cortex` is the organism's higher-order reasoning engine. While the `Heart` handles the rhythm and the `MemoryEngine` stores patterns, the `Cortex` is the only organ capable of synthesizing novel solutions to unseen problems. It abstracts the raw integration with Large Language Models (LLMs), shielding the rest of the organism from API specifics, prompt-engineering, and schema parsing. 

## 2. Responsibilities & Inputs/Outputs
- **Responsibilities:**
  - Route prompts to external LLM providers (e.g., OpenAI, Anthropic, local LLaMA).
  - Enforce strict JSON Schema outputs for all model responses.
  - Implement retry logic and fallback models if the primary model fails or times out.
  - Report exact token usage back to the caller so the `Treasury` can bill it.
- **Inputs:** `PromptContext` (Goal, Evidence, Rules) and an expected JSON Schema.
- **Outputs:** A strictly typed object matching the requested schema, along with `TokenCost`.

## 3. Internal Data Structures & State Transitions
- **State Transition:** 
  - `IDLE` -> `ROUTING` -> `WAITING_FOR_INFERENCE` -> `PARSING` -> `VALIDATING` -> `RETURN`.

## 4. Dependency Map
- **Depends On:** 
  - Network (External APIs).
- **Used By:** 
  - `Planner` (During `THINK` state).
  - `ReflectionEngine` (During `SLEEP` state).
  - `SkillCompiler` (To write code).

## 5. Invariants
- **Schema Enforcement:** The Cortex MUST throw an error if the LLM output does not match the requested JSON schema. It never returns raw unstructured strings to the execution context.
- **Cost Transparent:** Every call must explicitly return token usage.

## 6. Performance Budget
- **Time:** Highly variable. Bounded by API timeouts (typically 30s-60s).
- **Memory:** Depends on context length, but internal parsing overhead must be < 50MB.

## 7. Observability
- **Metrics Produced:** `inference_calls_total`, `inference_latency_ms`, `tokens_consumed`, `schema_validation_errors`.
- **Logs Produced:** `CORTEX_PROMPT_SENT`, `CORTEX_RESPONSE_RECEIVED`, `CORTEX_PARSING_FAILED`.

## 8. Lifecycle
- **Birth/Init:** Loads API keys from environment and validates provider connections.
- **Normal Operation:** Sits idle until invoked.
- **Failure:** If API returns 429 (Rate Limit) or 500, it initiates a backoff retry, then falls back to a secondary provider. If all fail, throws `InferenceExhaustedError`.
- **Recovery:** Stateless. Recovers on the next call.
- **Shutdown:** None required.
- **Persistence:** None. The Cortex has no memory.
- **Restart:** Recovers instantly.

## 9. Security Boundaries & Economic Cost
- **Security:** The Cortex handles raw strings from the internet. It is vulnerable to Prompt Injection. Output must be heavily sanitized if passed to the `Sandbox`.
- **Economic Cost:** Very high. This is the primary driver of the `CognitiveBudget` burn.

## 10. Technical Debt & Known Limitations
- Hardcoded dependency on specific SDKs (like OpenAI). Needs a generalized unified API wrapper.

---
### Implementation Maturity
Stable (Gen-1)

### Source Files
- `src/cognitive/Cortex.ts`
- `src/cognitive/InferenceRouter.ts`

### Future Extensions
- **Gen-2:** On-premise local model fallback for when internet connectivity is severed.
