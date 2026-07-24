# Ethereum Capability

**Status:** `Planned` (Gen-5)

## Permissions
- **Scope:** Read access to RPC nodes. Write access (transaction signing) strictly limited to the `Wallet` organ holding a dedicated hot-wallet private key.
- **Prohibited:** Exposing the private key to the `WorkingMemory` or `EpisodicMemory`. The key never leaves the `Wallet` organ.

## Risks
- **Financial Ruin:** A hallucinated transaction payload could drain the Treasury or send funds to the wrong address.
- **Gas Spikes:** Approving a transaction during 500 Gwei gas could bankrupt the organism.

## Required Approvals
- Reading state (balances, contract views) is pre-approved.
- Sending transactions requires internal `Treasury` clearance (checking budget + the 20% sweep logic).
- Deploying *new* contracts requires Human Cryptographic Signature.

## Budget Implications
- Very High. Transactions cost real ETH. Must be strictly managed by the `CognitiveBudget` or a separate `ExecutionBudget`.

## Failure Modes
- RPC Timeout: Safely handled.
- Out of Gas / Revert: Results in lost capital. Organism must log failure to `EpisodicMemory` to build a semantic rule avoiding that contract/action.
