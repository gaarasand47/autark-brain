# Unit Audit: Cortex.ts

**Organ:** Cortex (Planner)
**Path:** `src/cortex/Cortex.ts`
**Date:** July 23, 2026

## 1. Unit Verification Matrix

| Requirement | Expected (File/Method) | Observed Evidence | Status | Risk | Required Action |
|-------------|-------------------------|-------------------|--------|------|-----------------|
| **Deterministic Layer 1** | Constraint Compilation | Line 53 `this.constraintCompiler.compile(context)` generates hard constraints prior to LLM. | **PASS** | LOW | None. |
| **LLM Layer 2 Timeout** | 5000ms max LLM generation time | Lines 70-79 successfully implement `Promise.race([llmCallPromise, timeoutPromise])`. | **PASS** | LOW | None. |
| **Deterministic Layer 3** | Validation of raw LLM output | Line 100 `this.validator.validate(plan, context)` successfully intercepts invalid JSON structure. | **PASS** | LOW | None. |
| **No-Retry Invariant** | Terminate loop on invalid plan | Lines 104-105 physically enforce single-shot generation. | **PASS** | LOW | None. |

## 2. Evolution Compatibility
- **Can Gen-2 extend me?** YES.
- **How?** The Cortex takes a generic `ILLMProvider` interface. Gen-2 can seamlessly hot-swap the LLM backend (e.g. from OpenAI to local Llama 3) simply by injecting a new provider without modifying `Cortex.ts`.
- **Breaking Changes?** None. The three-layer deterministic-sandwich architecture is highly resilient.

## 3. Overall Verdict
The Cortex successfully implements the "Deterministic Sandwich" invariant, wrapping non-deterministic LLM calls inside strict pre-compilation and post-validation constraints. It correctly honors the 5000ms timeout budget and strict No-Retry policy.

**Audit Status:** 🟢 PASS
