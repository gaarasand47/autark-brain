# Autark Workflows

This rule defines custom slash commands for the Autark implementation lifecycle.

## /autark-plan
**Description:** Generate a design plan for the current objective.
**Instructions:**
1. Read `WORKFLOW/CURRENT_TASK.md`.
2. Produce a bounded design in `WORKFLOW/ANTIGRAVITY_HANDOFF.md` covering the objective.
3. Set `WORKFLOW/STATUS.md` to `READY_FOR_CODEX_DESIGN_REVIEW`.
4. Stop execution and await Codex.

## /autark-implement
**Description:** Implement an approved objective scope.
**Instructions:**
1. Run ONLY if `WORKFLOW/CODEX_REVIEW.md` indicates `APPROVED`.
2. Implement ONLY the approved scope.
3. Update `WORKFLOW/ANTIGRAVITY_HANDOFF.md` with commit SHA, files changed, tests run, and known limitations.
4. Set `WORKFLOW/STATUS.md` to `READY_FOR_CODEX_VERIFICATION`.
5. Stop execution and await Codex.

## /autark-repair
**Description:** Repair an implementation or design based on Codex findings.
**Instructions:**
1. Read ONLY the listed Codex findings in `WORKFLOW/CODEX_REVIEW.md`.
2. Apply minimal fixes strictly scoped to the findings.
3. Update `WORKFLOW/ANTIGRAVITY_HANDOFF.md` documenting the fixes.
4. Set `WORKFLOW/STATUS.md` to `READY_FOR_CODEX_REPAIR_VERIFICATION`.
5. Stop execution and await Codex.
