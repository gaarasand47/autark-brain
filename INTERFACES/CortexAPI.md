# Cortex API

**Status:** `Stable` (Gen-1)

The `CortexAPI` defines the sole conduit between the organism and external LLM providers.

## 1. `infer<T>(prompt: string, schema: JSONSchema, model?: string)`
The primary reasoning method.
- **Inputs:** 
  - `prompt`: The context and goal.
  - `schema`: A strict JSON schema object describing the required output shape.
  - `model`: Optional override (e.g., "claude-3-5-sonnet"). Defaults to configured primary.
- **Outputs:** `Promise<{ result: T, cost: number }>`
- **Side effects:** Makes a network call. Consumes tokens.
- **Failure conditions:** 
  - Throws `InferenceTimeout` if the provider takes too long.
  - Throws `SchemaValidationError` if the output cannot be coerced into the requested schema.
- **Guarantees:** Will automatically retry up to 3 times on 429/500 errors before failing. Will ALWAYS return an object matching the schema, never a raw string.

## 2. `estimateCost(prompt: string)`
- **Inputs:** The prompt payload.
- **Outputs:** `number` (estimated tokens * model price).
- **Side effects:** None. (Uses local tokenizer like `tiktoken`).
- **Guarantees:** Always over-estimates slightly to ensure `Treasury` budget is not accidentally exceeded.
