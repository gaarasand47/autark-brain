[CmdletBinding()]
param(
    [string]$Root = "D:\autark",
    [string]$AntigravityCommand = "",
    [string]$CodexCommand = "",
    [int]$MaxAgentRuns = 160,
    [int]$MaxRepairsPerObjective = 2,
    [int]$AgentTimeoutMinutes = 45,
    [switch]$DryRun,
    [switch]$Once
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$workflow = Join-Path $Root "autark-brain\WORKFLOW"
$statusFile = Join-Path $workflow "STATUS.md"
$taskFile = Join-Path $workflow "CURRENT_TASK.md"
$antigravityPromptFile = Join-Path $workflow "ANTIGRAVITY_PROMPT.md"
$codexPromptFile = Join-Path $workflow "CODEX_PROMPT.md"
$stateFile = Join-Path $workflow ".coordinator-state.json"
$lockFile = Join-Path $workflow ".coordinator.lock"
$logsDirectory = Join-Path $workflow "logs"

$terminalStates = @(
    "GEN2_RC1_READY_FOR_HUMAN",
    "AWAITING_HUMAN",
    "CRITICAL_STOP",
    "IDLE"
)

function Write-AtomicText {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Value
    )

    $temporaryPath = "$Path.tmp"
    [System.IO.File]::WriteAllText(
        $temporaryPath,
        $Value.Trim() + [Environment]::NewLine,
        [System.Text.UTF8Encoding]::new($false)
    )
    Move-Item -LiteralPath $temporaryPath -Destination $Path -Force
}

function Read-WorkflowStatus {
    if (-not (Test-Path -LiteralPath $statusFile)) {
        throw "Missing workflow status file: $statusFile"
    }
    return (Get-Content -LiteralPath $statusFile -Raw).Trim()
}

function Read-ObjectiveId {
    if (-not (Test-Path -LiteralPath $taskFile)) {
        return "UNKNOWN"
    }

    $taskText = Get-Content -LiteralPath $taskFile -Raw
    $match = [regex]::Match($taskText, "G2-S\d+-O\d+")
    if ($match.Success) {
        return $match.Value
    }
    return "UNKNOWN"
}

function Read-CoordinatorState {
    if (-not (Test-Path -LiteralPath $stateFile)) {
        return [ordered]@{
            totalRuns = 0
            objectiveId = "UNKNOWN"
            repairRuns = 0
        }
    }

    $saved = Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
    return [ordered]@{
        totalRuns = [int]$saved.totalRuns
        objectiveId = [string]$saved.objectiveId
        repairRuns = [int]$saved.repairRuns
    }
}

function Write-CoordinatorState {
    param([Parameter(Mandatory = $true)]$State)

    $json = $State | ConvertTo-Json
    Write-AtomicText -Path $stateFile -Value $json
}

function Resolve-AgentCommand {
    param(
        [string]$ConfiguredCommand = "",
        [Parameter(Mandatory = $true)][string]$DefaultName
    )

    $candidate = $ConfiguredCommand
    if ([string]::IsNullOrWhiteSpace($candidate)) {
        $candidate = $DefaultName
    }

    $resolved = Get-Command $candidate -ErrorAction SilentlyContinue
    if ($null -eq $resolved) {
        return $null
    }
    return $resolved.Source
}

function Invoke-AgentProcess {
    param(
        [Parameter(Mandatory = $true)][string]$Executable,
        [Parameter(Mandatory = $true)][ValidateSet("ANTIGRAVITY", "CODEX")]
        [string]$Agent,
        [Parameter(Mandatory = $true)][string]$Prompt,
        [Parameter(Mandatory = $true)][string]$LogPath
    )

    $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
    if ($Executable.EndsWith(".cmd", [StringComparison]::OrdinalIgnoreCase) -or $Executable.EndsWith(".bat", [StringComparison]::OrdinalIgnoreCase) -or $Executable.EndsWith(".ps1", [StringComparison]::OrdinalIgnoreCase)) {
        $startInfo.FileName = "cmd.exe"
        if ($Agent -eq "ANTIGRAVITY") {
            $startInfo.Arguments = "/c `"`"$Executable`" -p `"$Prompt`"`""
        }
        else {
            $startInfo.Arguments = "/c `"`"$Executable`" exec -`""
        }
    }
    else {
        $startInfo.FileName = $Executable
        if ($Agent -eq "ANTIGRAVITY") {
            $startInfo.Arguments = "-p `"$Prompt`""
        }
        else {
            $startInfo.Arguments = "exec -"
        }
    }
    $startInfo.WorkingDirectory = $Root
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true
    $startInfo.RedirectStandardInput = ($Agent -eq "CODEX")
    $startInfo.CreateNoWindow = $true

    $process = [System.Diagnostics.Process]::new()
    $process.StartInfo = $startInfo

    try {
        if (-not $process.Start()) {
            throw "Failed to start $Agent process."
        }

        if ($Agent -eq "CODEX") {
            $process.StandardInput.Write($Prompt)
            $process.StandardInput.Close()
        }

        $stdoutTask = $process.StandardOutput.ReadToEndAsync()
        $stderrTask = $process.StandardError.ReadToEndAsync()
        $timeoutMilliseconds = $AgentTimeoutMinutes * 60 * 1000

        if (-not $process.WaitForExit($timeoutMilliseconds)) {
            $process.Kill($true)
            $process.WaitForExit()
            throw "$Agent exceeded the $AgentTimeoutMinutes minute timeout."
        }

        $stdout = $stdoutTask.GetAwaiter().GetResult()
        $stderr = $stderrTask.GetAwaiter().GetResult()
        $combined = @(
            "Agent: $Agent"
            "ExitCode: $($process.ExitCode)"
            "TimestampUtc: $([DateTime]::UtcNow.ToString('o'))"
            ""
            "STDOUT"
            $stdout
            ""
            "STDERR"
            $stderr
        ) -join [Environment]::NewLine

        [System.IO.File]::WriteAllText(
            $LogPath,
            $combined,
            [System.Text.UTF8Encoding]::new($false)
        )

        if ($process.ExitCode -ne 0) {
            throw "$Agent exited with code $($process.ExitCode). See $LogPath"
        }
    }
    finally {
        $process.Dispose()
    }
}

function Stop-WithStatus {
    param(
        [Parameter(Mandatory = $true)][string]$Status,
        [Parameter(Mandatory = $true)][string]$Message
    )

    Write-AtomicText -Path $statusFile -Value $Status
    Write-Host $Message
    exit 1
}

if (-not (Test-Path -LiteralPath $workflow)) {
    throw "Workflow directory not found: $workflow"
}

New-Item -ItemType Directory -Path $logsDirectory -Force | Out-Null

$lockStream = $null
try {
    try {
        $lockStream = [System.IO.File]::Open(
            $lockFile,
            [System.IO.FileMode]::CreateNew,
            [System.IO.FileAccess]::Write,
            [System.IO.FileShare]::None
        )
    }
    catch {
        throw "Another coordinator appears to be running: $lockFile"
    }

    $antigravityExecutable = Resolve-AgentCommand `
        -ConfiguredCommand $AntigravityCommand `
        -DefaultName "agy"
    $codexExecutable = Resolve-AgentCommand `
        -ConfiguredCommand $CodexCommand `
        -DefaultName "codex"

    $state = Read-CoordinatorState

    while ($true) {
        $status = Read-WorkflowStatus

        if ($terminalStates -contains $status -or $status -like "BLOCKED_*") {
            Write-Host "Coordinator stopped at terminal status: $status"
            exit 0
        }

        $agent = $null
        $promptFile = $null
        $runningStatus = $null
        $isRepair = $false

        switch ($status) {
            "READY_FOR_ANTIGRAVITY_PLAN" {
                $agent = "ANTIGRAVITY"
                $promptFile = $antigravityPromptFile
                $runningStatus = "ANTIGRAVITY_RUNNING_PLAN"
            }
            "READY_FOR_ANTIGRAVITY_IMPLEMENTATION" {
                $agent = "ANTIGRAVITY"
                $promptFile = $antigravityPromptFile
                $runningStatus = "ANTIGRAVITY_RUNNING_IMPLEMENTATION"
            }
            "READY_FOR_ANTIGRAVITY_REPAIR" {
                $agent = "ANTIGRAVITY"
                $promptFile = $antigravityPromptFile
                $runningStatus = "ANTIGRAVITY_RUNNING_REPAIR"
                $isRepair = $true
            }
            "READY_FOR_CODEX_DESIGN_REVIEW" {
                $agent = "CODEX"
                $promptFile = $codexPromptFile
                $runningStatus = "CODEX_RUNNING_DESIGN_REVIEW"
            }
            "READY_FOR_CODEX_VERIFICATION" {
                $agent = "CODEX"
                $promptFile = $codexPromptFile
                $runningStatus = "CODEX_RUNNING_VERIFICATION"
            }
            "READY_FOR_CODEX_REPAIR_VERIFICATION" {
                $agent = "CODEX"
                $promptFile = $codexPromptFile
                $runningStatus = "CODEX_RUNNING_REPAIR_VERIFICATION"
                $isRepair = $true
            }
            default {
                Stop-WithStatus `
                    -Status "BLOCKED_UNKNOWN_STATUS" `
                    -Message "Unknown workflow status: $status"
            }
        }

        if (-not (Test-Path -LiteralPath $promptFile)) {
            Stop-WithStatus `
                -Status "BLOCKED_MISSING_PROMPT" `
                -Message "Missing prompt file: $promptFile"
        }

        if ($DryRun) {
            $objectiveId = Read-ObjectiveId
            $cliAvailable = if ($agent -eq "ANTIGRAVITY") {
                $null -ne $antigravityExecutable
            }
            else {
                $null -ne $codexExecutable
            }
            Write-Host "DRY RUN: would launch $agent for $status ($objectiveId); CLI available: $cliAvailable."
            exit 0
        }

        if ($agent -eq "ANTIGRAVITY" -and $null -eq $antigravityExecutable) {
            Stop-WithStatus `
                -Status "BLOCKED_MISSING_ANTIGRAVITY_CLI" `
                -Message "Antigravity CLI not found. Install agy or pass -AntigravityCommand."
        }
        if ($agent -eq "CODEX" -and $null -eq $codexExecutable) {
            Stop-WithStatus `
                -Status "BLOCKED_MISSING_CODEX_CLI" `
                -Message "Codex CLI not found. Pass -CodexCommand if it is not on PATH."
        }

        if ($state.totalRuns -ge $MaxAgentRuns) {
            Stop-WithStatus `
                -Status "BLOCKED_AGENT_RUN_LIMIT" `
                -Message "Stopped after reaching MaxAgentRuns=$MaxAgentRuns."
        }

        $objectiveId = Read-ObjectiveId
        if ($state.objectiveId -ne $objectiveId) {
            $state.objectiveId = $objectiveId
            $state.repairRuns = 0
        }

        if ($isRepair) {
            $state.repairRuns++
            if ($state.repairRuns -gt $MaxRepairsPerObjective) {
                Stop-WithStatus `
                    -Status "BLOCKED_REPAIR_LIMIT" `
                    -Message "Repair limit exceeded for objective $objectiveId."
            }
        }
        else {
            $state.repairRuns = 0
        }

        $state.totalRuns++
        Write-CoordinatorState -State $state

        $basePrompt = Get-Content -LiteralPath $promptFile -Raw
        $dispatchContext = @"

## Coordinator Dispatch Context

- Dispatched from status: $status
- Running status visible in STATUS.md: $runningStatus
- Current objective: $objectiveId
- Agent run: $($state.totalRuns) of $MaxAgentRuns
- Repair run for objective: $($state.repairRuns) of $MaxRepairsPerObjective

You must update WORKFLOW/STATUS.md to the next valid state before exiting.
"@
        $prompt = $basePrompt + $dispatchContext

        Write-AtomicText -Path $statusFile -Value $runningStatus
        $timestamp = [DateTime]::UtcNow.ToString("yyyyMMddTHHmmssZ")
        $safeObjective = $objectiveId -replace "[^A-Za-z0-9_-]", "_"
        $logPath = Join-Path $logsDirectory "$timestamp-$safeObjective-$Agent.log"

        try {
            $executable = if ($agent -eq "ANTIGRAVITY") {
                $antigravityExecutable
            }
            else {
                $codexExecutable
            }

            Invoke-AgentProcess `
                -Executable $executable `
                -Agent $agent `
                -Prompt $prompt `
                -LogPath $logPath
        }
        catch {
            $failureStatus = if ($agent -eq "ANTIGRAVITY") {
                "BLOCKED_ANTIGRAVITY_PROCESS_FAILED"
            }
            else {
                "BLOCKED_CODEX_PROCESS_FAILED"
            }
            Stop-WithStatus -Status $failureStatus -Message $_.Exception.Message
        }

        $nextStatus = Read-WorkflowStatus
        if ($nextStatus -eq $runningStatus) {
            $failureStatus = if ($agent -eq "ANTIGRAVITY") {
                "BLOCKED_ANTIGRAVITY_DID_NOT_HANDOFF"
            }
            else {
                "BLOCKED_CODEX_DID_NOT_HANDOFF"
            }
            Stop-WithStatus `
                -Status $failureStatus `
                -Message "$agent exited without updating STATUS.md. See $logPath"
        }

        Write-Host "$agent transitioned $status -> $nextStatus"

        if ($Once) {
            exit 0
        }
    }
}
finally {
    if ($null -ne $lockStream) {
        $lockStream.Close()
        $lockStream.Dispose()
        $lockStream = $null
    }
    if (Test-Path -LiteralPath $lockFile) {
        Remove-Item -LiteralPath $lockFile -Force
    }
}
