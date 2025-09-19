# Snowflake Mirroring in Microsoft Fabric

This workshop demonstrates mirroring a **custom IoT dataset** from Snowflake to Fabric.

## Step 1: Prepare Snowflake Environment

Run the SQL script in `scripts/create_iot_demo_db.sql` from Snowflake Worksheets.
This will create a `FABRIC_MIRROR_DEMO` database with:
- `IOT.DEVICES` table
- `IOT.LOCATIONS` table
- `IOT.READINGS` table

### Validate Data
Run this in Snowflake before continuing:

```sql
SELECT * FROM IOT.READINGS LIMIT 5;
```
