# Compiler Capability

**Status:** `Stable` (Gen-1)

## Permissions
- **Scope:** The `SkillCompiler` is permitted to invoke the TypeScript compiler (`tsc`) on files within the `src/skills/` directory.
- **Prohibited:** Overwriting core kernel files or architecture files.

## Risks
- **Syntax Errors:** Generating TypeScript code with syntax errors that breaks the build step.
- **Dependency Hallucination:** Generating code that `imports` npm packages that are not present in `package.json`.

## Required Approvals
- Compiling code to memory or `tmp/` for the `DreamEngine` is pre-approved.
- Compiling and committing code to `src/skills/` requires `ApprovalGateway` Human Cryptographic Signature.

## Budget Implications
- Low computational cost locally. High cognitive cost via `Cortex` to generate the code snippet.

## Failure Modes
- Compile Error: The organism logs the compilation error into `EpisodicMemory` and feeds the error back to the `Cortex` to attempt a fix during the next `SLEEP` cycle.
