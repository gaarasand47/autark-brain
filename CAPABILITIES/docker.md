# Docker Capability

**Status:** `Planned` (Gen-3)

## Permissions
- **Scope:** Execution of containerized skills. The organism may spawn ephemeral Docker containers to run code that requires environments other than its native Node.js.
- **Prohibited:** Binding the host filesystem (except `/tmp/dream`), exposing host ports, or running in `--privileged` mode.

## Risks
- **Container Escape:** If the runtime is vulnerable, sandboxed code could escape to the host.
- **Resource Exhaustion:** A Docker container with a `while(true)` loop could consume all CPU/RAM, suffocating the `Heart`.

## Required Approvals
- Pulling *new* base images requires Human Cryptographic Signature.
- Running pre-approved images is permitted up to the memory limit.

## Budget Implications
- Cloud compute costs (EC2 / GCP). 

## Failure Modes
- Daemon unresponsive: Fall back to native Node `vm` Sandbox if possible, else skip execution.
