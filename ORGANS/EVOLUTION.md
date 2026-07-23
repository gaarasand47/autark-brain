# Organ: Evolution Manager

**Status:** `Frozen` (Gen-1)

## Purpose
The Evolution Manager acts as the organism's self-coding subsystem, responsible for orchestrating safe biological mutations. It handles the proposal, evaluation, staging, and deployment of code changes that the organism generates to improve its own capabilities.

## Architecture

The `EvolutionManager` processes self-mutation through a strict pipeline:
1. **Proposal Generation**: Evaluates an identified system limitation and drafts an `ImprovementProposal`.
2. **Impact Assessment**: Simulates the proposed diff against the testing sandbox to ensure compilation and invariants hold.
3. **Rollback Staging**: Snapshots affected files into a `RollbackPackage` in case the mutation destabilizes the organism.
4. **Approval Routing**: Routes the verified proposal to the `ApprovalGateway` for mandatory human authorization.
5. **Deployment**: If approved, applies the diff physically to the execution source tree.

## Boundaries & Constraints
- **Zero-Trust Self-Coding**: The Evolution Manager operates under a zero-trust model for AI-generated code. No code can be applied to the primary `autark` directory without full test suite passes and human signature.
- **Rollback Supremacy**: The system must be capable of reverting any applied mutation back to the pre-mutation snapshot autonomously if post-deployment vitals degrade.

## Interfaces
- Integrates with `ApprovalGateway` for authorization.
- Interfaces with `Sandbox` for testing the generated diffs.
- Submits telemetry to `Vitals` regarding mutation success rates.

## Traceability
This organ acts as the mechanical actuator for the planned `Gen-5` self-coding goals, laying the Gen-1 foundation.
