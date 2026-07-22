# Configuration

**Status:** `Stable` (Gen-1)

Autark requires specific environment variables to boot. If these are missing, the `Heart` will refuse to start.

## `process.env`

### Core Identity
- `AUTARK_CREATOR_ADDRESS`: The wallet address of the human owner. Used for profit sweeps and verifying cryptographic signatures during Evolution.
- `AUTARK_GENERATION`: E.g., `Gen-1`. Used to validate that the codebase matches the `IdentityCore` database.

### API Providers
- `OPENAI_API_KEY`: Required for the `Cortex` to function.
- `ANTHROPIC_API_KEY`: Fallback model provider.

### Execution Knobs
- `HEART_TICK_MS`: The interval of the biological pulse. Default: `60000` (1 minute).
- `DB_STORAGE_PATH`: Directory where SQLite databases are persisted. Default: `./data/`.

## Secrets Management
Autark does NOT read secrets from a `.env` file in production. Secrets must be injected via secure CI/CD runners or secure OS vaults. `config.ts` enforces strict typings and throws immediately if `AUTARK_CREATOR_ADDRESS` is missing.
