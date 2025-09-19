# Step 4: Query and Validate Data

1. Use Fabric SQL Endpoint or a Notebook to query the mirrored tables:

```sql
SELECT country, COUNT(*) 
FROM IOT.READINGS
GROUP BY country;
```

✅ **Expected Result:** You should see counts grouped by country from the Snowflake source data.
