# Step 2: Prepare Sample Data

Run the SQL script `scripts/create_iot_demo_db.sql` in Snowflake Worksheets to create the database and populate tables.

Then once all the objects are created, run the following to validate the data is properly inserted

```sql
-- Validate sample data
SELECT * FROM IOT.READINGS LIMIT 5;
```

> Continue to **[3. Create mirrored Database ](03-create-mirrored-db.md)**.
