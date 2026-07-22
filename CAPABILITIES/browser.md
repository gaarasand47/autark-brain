# Browser Capability

**Status:** `Planned` (Gen-4)

## Permissions
- **Scope:** Execution of Headless Chrome/Puppeteer to interact with non-API web properties.
- **Prohibited:** Accessing local host addresses (`127.0.0.1`, `localhost`) to prevent SSRF attacks against internal services.

## Risks
- **Security:** Browsing malicious websites could compromise the container.
- **Instability:** DOM structures change frequently, causing brittle skills.

## Required Approvals
- Navigating and reading text is pre-approved up to the `CognitiveBudget` (due to compute costs of rendering).
- Submitting forms with financial data requires `Treasury` approval.

## Budget Implications
- Running headless browsers is memory and CPU intensive.

## Failure Modes
- DOM Changes: Elements not found. Organism must fail the tick, log the episode, and use the `DreamEngine` to rewrite the scraping skill.
