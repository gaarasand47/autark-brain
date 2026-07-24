# Codex Gen-3 Design Consolidation Report

**Date:** 2026-07-24
**Target Audience:** Codex
**Status:** `READY_FOR_GEN3_DESIGN`

## Executive Summary
To facilitate the transition to the Gen-3 Builder System, the `autark-brain` repository has been mechanically consolidated. The highly fragmented Gen-1/Gen-2 documentation (which consisted of dozens of tiny markdown files scattered across over a dozen directories) has been logically concatenated into **five unified master documents**.

No knowledge, context, or technical details were removed or summarized. The contents of all previously scattered files were explicitly appended in their entirety into these master documents.

## The New Brain Structure

The canonical knowledge base now resides directly at the root of `autark-brain` in the following five files:

### `1_GOVERNANCE_AND_LAWS.md`
**Domain:** The mechanical rules and operational standards governing the organism and repository.
**Source Materials:** `CONSTITUTION.md`, `DOCUMENTATION_CONSTITUTION.md`, `ENGINEERING_STANDARDS.md`, `PRINCIPLES.md`, `WHY_AUTARK_EXISTS.md`, and all files previously in `LAWS/`.

### `2_ARCHITECTURE_AND_ORGANS.md`
**Domain:** The organism's biology, interfaces, capabilities, and life-cycle flows.
**Source Materials:** `GENOME.md`, `LIFE.md`, `AGENTS.md`, `STATE_ATLAS.md`, `GLOSSARY.md`, and all files previously in `ORGANS/`, `INTERFACES/`, `FLOWS/`, and `CAPABILITIES/`.
**Codex Note:** *This is the most critical document for Gen-3 design. It contains the exact interfaces for the Cortex, Heart, InstinctSystem, Memory, and all existing flows.*

### `3_EVOLUTION_AND_ROADMAP.md`
**Domain:** The timeline, historical phases, and forward-looking status of the project.
**Source Materials:** `CURRENT_STATE.md`, `ROADMAP.md`, `TRACEABILITY.md`, `GENERATION_CHECKLIST.md`, and all files previously in `EVOLUTION/` and `GENERATIONS/`.

### `4_OPERATIONS_AND_HANDOVERS.md`
**Domain:** Session boundaries, prompts, and historical handovers between Codex and Antigravity.
**Source Materials:** All files previously in `IMPLEMENTATION_HANDOVER/` and `WORKFLOW/` (markdown files only, the raw scripts and states remain in the physical directory for execution).

### `5_REFERENCE_AND_DECISIONS.md`
**Domain:** Architectural Decision Records (ADRs) and static schema definitions.
**Source Materials:** All files previously in `DECISIONS/` and `REFERENCE/`.

## Retained Infrastructure
The following structural folders were retained and unchanged due to their nature as verifiable execution artifacts rather than readable prose:
- `AUDITS/`: Contains explicit `.log` and `.db` files from E2E Chaos and Production validation.
- `BENCHMARKS/`: Contains explicit JSON metrics.
- `WORKFLOW/`: Contains runtime `.ps1` execution scripts and `.json` state files.

## Instructions for Codex
When designing Gen-3:
1. **Context Window Efficiency:** You can now read the entire biological map in a single pass by requesting `2_ARCHITECTURE_AND_ORGANS.md`.
2. **Appending New ADRs:** Append new decisions directly into `5_REFERENCE_AND_DECISIONS.md`.
3. **Updating Architecture:** Append the new `BuilderSystem` organ definitions and interfaces directly into `2_ARCHITECTURE_AND_ORGANS.md`. Do not create new scattered directories.

The vault is sealed and ready for Gen-3 Genesis.
