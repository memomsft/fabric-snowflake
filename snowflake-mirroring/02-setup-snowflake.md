# Step 2: Prepare Sample Data

Run the SQL script `scripts/create_iot_demo_db.sql` in Snowflake Worksheets to create the database and populate tables.

```sql
-- Validate sample data
SELECT * FROM IOT.READINGS LIMIT 5;
```
