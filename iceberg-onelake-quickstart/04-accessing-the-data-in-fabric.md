# 4. Accessing the Data in Fabric

Now that the Iceberg table lives in **OneLake**, we can expose it to a **Fabric Lakehouse** using a **Table Shortcut**.

### Create a Table Shortcut
1. Open the **Lakehouse** in your Fabric workspace.
2. Select **New ▸ Table shortcut**.
3. Browse to the path used by the table (the `BASE_LOCATION` inside your External Volume path):
   ```
   /Files/iceberg_ws/ws_dim_customer/
   ```
4. Complete the wizard. You should see a new table appear in the Lakehouse.

### Validate from Fabric
Use a Notebook or SQL endpoint in Fabric to query the shortcut:

```sql
SELECT COUNT(*) FROM ws_dim_customer;
SELECT C_NATIONKEY, COUNT(*) AS cnt
FROM ws_dim_customer
GROUP BY C_NATIONKEY
ORDER BY cnt DESC;
```

You have now validated **bi‑directional access**: Snowflake wrote data in Iceberg on OneLake, and Fabric read it via a shortcut.
  
> Continue to **[5. Conclusion and Resources](05-conclusion-and-resources.md)**.
