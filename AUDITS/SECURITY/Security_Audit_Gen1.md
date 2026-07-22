# Security Audit: Wallet Isolation & Sandbox Integrity

**Date:** July 23, 2026

## 1. File System Access (Sandbox Integrity)

**Status:** 🟢 PASS

**Invariant:**
The `DeterministicLab` must prevent any dynamically generated Cortex script from accessing the host file system or network, regardless of the script's contents.

**Attempted Violations:**
1. **Direct Import:** Attempted to inject `require('fs')` into the `ExecutionArtifact`.
2. **String Obfuscation Bypass:** Attempted to bypass the AST/String scanner by doing `const f='f'; const s='s'; require(f+s);`.
3. **Process Exfiltration:** Attempted to read `process.env.HOME` to leak the Vault path.

**Result:**
- **Attack 1:** Failed immediately at `Lab.validateArtifact()` due to explicit regex denial of `fs`.
- **Attack 2 & 3:** The script successfully compiled, bypassing the regex scanner, but failed fatally at runtime with `ReferenceError: require is not defined` and `ReferenceError: process is not defined`. 
- **Why it failed:** `isolated-vm` explicitly operates in a blank V8 isolate. It does not inherit Node's `global` object. Because the `Heart` does not explicitly inject `require` or `process` into the VM context, it is physically impossible for the sandbox to reach the host OS.

**Evidence:**
- Code: `src/execution/Lab.ts:106` (`const jail = context.global;`) shows only `__rpc_call_ref` and `__llm_complete_ref` are passed.
- Tests: `src/__tests__/test_security_audit.ts`

**Remaining Risks:**
If an attacker discovers a zero-day escape vulnerability in the C++ V8 engine itself, they could break out of `isolated-vm`.

**Technical Debt:**
The `validateArtifact()` string matching is security theater. The true security is the V8 isolate.

---

## 2. Wallet Isolation

**Status:** 🟢 PASS

**Invariant:**
No system outside of the `Heart` or the human-controlled `ApprovalGateway` can sign transactions or access the private key.

**Attempted Violations:**
1. **Sandbox RPC Drain:** Attempted to use the exposed `global.rpc.call("eth_sendRawTransaction", [...])` inside the Sandbox to broadcast a malicious transaction.
2. **Key Exfiltration:** Attempted to print `global.vault` from the Sandbox.

**Result:**
- **Attack 1:** Failed. While the Sandbox *can* access the RPC interface, it cannot sign a transaction because it does not possess the private key. `eth_sendRawTransaction` only accepts cryptographically signed hex strings. Without the key, the attacker cannot construct a valid payload.
- **Attack 2:** Failed. The `IVaultProvider` is injected into `Heart.ts` at boot but is strictly omitted when constructing the `DeterministicLab` environment.

**Evidence:**
- Code: `src/genome/Vault.ts` is the only file that loads the JSON key.
- Code: `src/execution/Lab.ts:164` demonstrates the RPC adapter is injected, but the Vault adapter is not.
- Tests: `src/__tests__/test_security_audit.ts`

**Remaining Risks:**
Memory scanning. Because the `Heart` loads the private key into memory via `viem` at boot, a highly sophisticated OS-level attack could scrape the Node.js memory heap to find the `0x...` string.

**Technical Debt:**
Migrate from plaintext `vault.json` to an encrypted keystore file or a hardware HSM module (e.g., AWS KMS or Ledger integration) in Gen-3.
