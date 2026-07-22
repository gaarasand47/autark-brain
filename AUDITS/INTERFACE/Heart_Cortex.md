# Interface Audit: Heart -> Cortex

**Interface:** Biological Kernel `Heart.ts` to Cortex Planner `Cortex.ts`
**Path:** `src/kernel/Heart.ts`, `src/cortex/Cortex.ts`
**Date:** July 23, 2026

## 1. Interface Verification Matrix

| Requirement | Expected Payload | Observed Payload/Method | Status | Risk | Required Action |
|-------------|-------------------|--------------------------|--------|------|-----------------|
| **Plan Request** | Publish `Execution.TaskCreated` or call `generatePlan` | `Heart.ts` enters the `THINK` state and explicitly instantiates `Cortex` and `await cortex.generatePlan(...)`. | **PASS** | LOW | None. |
| **Plan Retrieval** | Subscribe to `Cortex.PlanCreated` or await | `Heart.ts` awaits the Promise, correctly handling `null` rejections (falling back to `SETTLE`) and binding the success payload to `currentPlan`. | **PASS** | LOW | None. |

## 2. Overall Verdict
The Cortex planner is now synchronously bound to the Heart's `THINK` state. The LLM acts deterministically inside the loop, correctly terminating the request if generation times out or structurally fails.

**Audit Status:** 🟢 PASS
