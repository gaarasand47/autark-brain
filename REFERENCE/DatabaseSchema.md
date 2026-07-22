# Database Schema

**Status:** `Stable` (Gen-1)

Autark relies exclusively on local `better-sqlite3` databases to ensure deterministic, zero-latency persistence.

## 1. `treasury.db`
Manages the immutable ledger.
```sql
CREATE TABLE ledger_entries (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,          -- 'revenue', 'expense', 'sweep'
    amount REAL NOT NULL,
    currency TEXT NOT NULL,
    provider TEXT,               -- e.g., 'stripe', 'openai'
    reference_id TEXT,           -- Ties expense to an Episode ID
    status TEXT NOT NULL,        -- 'pending', 'settled'
    timestamp INTEGER NOT NULL
);
```

## 2. `memory.db`
Manages episodic and semantic persistence.
```sql
CREATE TABLE episodes (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,          -- 'success', 'failure', 'dream'
    timestamp INTEGER NOT NULL,
    summary TEXT NOT NULL,
    execution_result TEXT,
    metadata TEXT,               -- JSON blob
    token_cost REAL NOT NULL
);

CREATE TABLE semantic_rules (
    rule_id TEXT PRIMARY KEY,
    category TEXT NOT NULL,
    premise TEXT NOT NULL,
    conclusion TEXT NOT NULL,
    confidence_score REAL NOT NULL, -- 0.0 to 1.0
    decay_factor REAL NOT NULL,
    last_used_at INTEGER NOT NULL,
    evidence_episode_ids TEXT    -- JSON array of Episode IDs
);
```

## 3. `identity.db`
Stores the fundamental genetic constraints.
```sql
CREATE TABLE identity_core (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);
-- Pre-populated at Genesis:
-- ('generation', 'Gen-1')
-- ('creatorAddress', '0x...')
-- ('profitShareAddress', '0x...')
```
