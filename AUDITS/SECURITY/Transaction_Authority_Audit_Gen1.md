# Transaction Authority Audit — Gen-1

**Status:** OPEN — reconciliation evidence, not production approval.

## Mechanical path

1. **Intent:** `src/kernel/Heart.ts` builds an `ExecutionArtifact` from a plan.
2. **Budget:** Heart calls `Treasury.reserve`; Treasury delegates to `Ledger.reserveBudget`.
3. **Key access:** `VaultProvider` loads/generates a local account; `SigningService` can sign messages through `genome/Vault`.
4. **Signing:** no Heart-to-SigningService call exists. `VaultProvider.signTransaction` is exposed by the environment but Heart does not invoke it.
5. **Raw transaction:** Lab maps `eth_sendRawTransaction` to `IRPCProvider.sendTransaction` only when `READ_ONLY_MODE=false`.
6. **Broadcast:** `RealRPCProvider.sendTransaction` calls viem `sendRawTransaction`.
7. **Settlement:** Heart queries a receipt, records receipt data, and calls `Treasury.settle`; this is not proof of a signed/broadcast transaction.
8. **Crash/retry:** reservations can become `UNKNOWN`/`RECLAIMED`; `WorkQueue` prevents active dequeue of UNKNOWN, but uncertain broadcast reconciliation is operator/manual and no canonical tx-intent-to-broadcast binding is proven.

## Direct answers

- Can Heart broadcast? **Not directly.** Heart does not sign or call `sendTransaction`; it invokes Lab, which may call an injected RPC provider if explicitly taken out of read-only mode.
- Can Lab broadcast when `READ_ONLY_MODE=false`? **Yes, potentially.** It forwards an already serialized value to the injected provider. This is a material authority gap and must remain disabled for Gen-1.
- Can SigningService be reached from production orchestration? **No proven Heart orchestration path.** It remains independently importable, so absence of wiring is not a capability boundary by itself.
- Does ApprovalGateway approve code mutation, financial spend, or both? **Neither executable capability.** It verifies a proposal signature only; Evolution still returns `NOT_IMPLEMENTED`. It is not in Treasury/Lab/Heart spend flow.
- Is a human public key used correctly? **For proposal verification only:** repair code uses `APPROVAL_PUBLIC_KEY`, not `WALLET_PRIVATE_KEY`. No evidence proves a configured production public key or financial authorization protocol.
- Can any component spend without human approval? **Potentially if `READ_ONLY_MODE=false`:** Lab can forward raw transactions and `heartbeat/killswitch.ts` contains a direct wallet send path. No human-approval binding was found for either.
- What happens after restart following an uncertain broadcast? **UNKNOWN/manual reconciliation.** Recovery marks stale reservations UNKNOWN; duplicate prevention is incomplete because intent, signing, broadcast hash, and settlement are not one atomic record.

## Adversarial evidence

`src/testing/transaction-authority.test.ts` proves default read-only Lab does not call the sender and Heart does not import SigningService. `src/testing/evolution-boundaries.test.ts` proves Heart has no mutation path and approval returns `NOT_IMPLEMENTED` rather than deployment.

## Required follow-up

Do not enable write mode until a signed immutable authorization record binds policy, treasury reservation, signer, serialized transaction, broadcast hash, receipt, and restart reconciliation.
