---
name: autark-gen2-workflow
description: Standard operating procedure and workflow cycle for Autark Gen-2 development and verification.
---

# Autark Gen-2 Workflow Cycle

This skill defines the mandatory step-by-step cycle for all Gen-2 implementation work.

## Development Cycle

1. **Draft Objective**
   - Read the relevant `autark-brain` architecture, ADRs, and Gen-2 roadmap.
   - Draft the exact objective, scope, exclusions, interfaces, invariants, risks, and acceptance tests.
   - **STOP** and wait for Codex design review before writing any code.

2. **Implement Approved Scope**
   - Upon explicit approval from Codex review, implement ONLY the approved objective scope.
   - Write focused unit/integration tests and update affected `autark-brain` documentation.
   - Ensure zero mocks, zero fake success, zero silent fallbacks, and zero undocumented authority.

3. **Implementation Handoff**
   - Produce a structured handoff detailing:
     - Files changed
     - Branch & commit SHA
     - Test commands and test execution output
     - Known limitations & deviations from plan
   - **STOP** for independent Codex verification.

4. **Repair Cycle**
   - If Codex returns `FAIL` or `PASS WITH LIMITATIONS`, repair ONLY the listed findings.
   - Re-run focused tests and submit updated handoff for Codex re-verification.

## Mandatory Rules & Constraints
- Work on exactly one narrow objective at a time.
- Never claim `PASS`, `Complete`, `Frozen`, or `Production-Ready`.
- Never broaden scope without returning for design review.
