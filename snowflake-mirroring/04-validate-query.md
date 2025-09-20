# Step 4: Query and Validate Data

1. Use Fabric SQL Endpoint or a Notebook to query the mirrored tables. In the mirrored database, select `Query in T-SQL`, it will open the SQL Enpoint for the mirrored database

![Mirror2](img/mirror10.png)

```sql
SELECT country, COUNT(*) 
FROM IOT.READINGS
GROUP BY country;
```

![Mirror2](img/mirror11.png)

✅ **Expected Result:** You should see counts grouped by country from the Snowflake source data.

> Continue to **[5.Resources ](05-resources.md)**.
