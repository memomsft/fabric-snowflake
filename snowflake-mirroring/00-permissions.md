## Step 0: Snowflake Permissions (Required)

Before starting the mirroring setup, ensure the Snowflake user or role you will use has the following permissions:

- `USAGE` on the **DATABASE** and **SCHEMA** containing the data to mirror  
- `SELECT` on all **tables** you plan to mirror  
- `SHOW TABLES` for schema discovery  
- `DESCRIBE TABLE` to read metadata  
- `CREATE STREAM` on the schema or tables (required for change tracking / CDC)

> **💡 Note:** Without these privileges, Fabric cannot complete the initial snapshot or track incremental changes.

### Example (Granting to a Role)

```sql
-- Replace ROLE_NAME, DATABASE_NAME, SCHEMA_NAME accordingly

GRANT USAGE ON DATABASE <DATABASE_NAME> TO ROLE <ROLE_NAME>;
GRANT USAGE ON SCHEMA <DATABASE_NAME.SCHEMA_NAME> TO ROLE <ROLE_NAME>;
GRANT SELECT, REFERENCES ON ALL TABLES IN SCHEMA <DATABASE_NAME.SCHEMA_NAME> TO ROLE <ROLE_NAME>;
GRANT CREATE STREAM ON SCHEMA <DATABASE_NAME.SCHEMA_NAME> TO ROLE <ROLE_NAME>;

-- Optional: apply to future tables
GRANT SELECT, REFERENCES ON FUTURE TABLES IN SCHEMA <DATABASE_NAME.SCHEMA_NAME> TO ROLE <ROLE_NAME>;

