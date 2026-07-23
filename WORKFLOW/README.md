# Autark State-Driven Coordinator

`coordinator.ps1` alternates Antigravity and Codex based only on the exact
value in `STATUS.md`. It does not poll on a timer and does not infer success
from process output.

## Safety properties

- One agent process runs at a time.
- Every agent must update `STATUS.md` before returning.
- Design approval is required before implementation.
- Codex remains review-only.
- Repairs are capped per objective.
- Unknown states, process failures, missing CLIs, critical findings, and the
  Gen-2 RC1 boundary stop the runner.
- No permission-bypass flags are used.

## Preflight

Both commands must be callable from PowerShell:

```powershell
agy --help
codex exec --help
```

If they are installed elsewhere, pass explicit executable paths:

```powershell
.\coordinator.ps1 `
  -AntigravityCommand "C:\path\to\agy.exe" `
  -CodexCommand "C:\path\to\codex.exe" `
  -DryRun
```

## Usage

Validate the next transition without launching an agent:

```powershell
.\coordinator.ps1 -DryRun
```

Run one agent transition:

```powershell
.\coordinator.ps1 -Once
```

Run until a terminal state, safety limit, or Gen-2 RC1 handoff:

```powershell
.\coordinator.ps1
```

Runtime logs and coordinator counters are local-only. The default hard limits
are 160 agent runs, two repair runs per objective, and 45 minutes per agent
process.

## Terminal states

- `GEN2_RC1_READY_FOR_HUMAN`
- `AWAITING_HUMAN`
- `CRITICAL_STOP`
- `BLOCKED_*`
- `IDLE`

After `GEN2_RC1_READY_FOR_HUMAN`, the coordinator exits and waits for the
project owner. It never advances to Gen-3 automatically.
