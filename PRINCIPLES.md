# Principles

**Status:** `Living Document`

These are not constitutional laws; they are engineering preferences. They guide the implementation of Autark without becoming rigid, immutable biological rules. When faced with an architectural decision, default to these principles.

## 1. Determinism over Cleverness
Autark must be predictable. It is better to have a slow, dumb, but easily traceable system than a highly optimized, probabilistic black box. If an LLM is used, its output must be clamped, parsed, and logged deterministically.

## 2. Local-first when possible
Autark should rely on its own internal databases (`better-sqlite3`) and local models before reaching out to the network. Network dependencies introduce latency, cost, and points of failure.

## 3. Budget every action
Do not create loops, background tasks, or API calls without first routing them through the `Treasury` or `CognitiveBudget`. 

## 4. Explain every decision
Every action taken by the organism must have a logged lineage: Goal -> Evidence -> Rules Used -> Alternatives -> Reason. If you cannot log why something is happening, do not execute it.

## 5. Simulation before execution
Never deploy new logic, new rules, or new code to production without first testing it inside the `DreamEngine` (the isolated simulator).

## 6. Minimize irreversible actions
Design systems so they can be rolled back. Evolution proposals require `RollbackPackages`. Database migrations require down scripts. Financial ledgers require compensating transactions.

## 7. Prefer evidence over intuition
Semantic rules must decay if they are not backed by fresh episodic evidence. Do not hardcode beliefs; hardcode the mechanism for updating beliefs based on evidence.
