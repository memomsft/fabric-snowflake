# 4. Accessing the Data in Fabric

Now that the Iceberg table lives in **OneLake**, we can expose it to a **Fabric Lakehouse** using a **Table Shortcut**.

### Create a Table Shortcut
1. Open the **Lakehouse** in your Fabric workspace.
2. In the **Tables** menu (...) --> select **New shorcut**.
3. Select **Microsoft One Lake**
4. Navigate the Lakehouse --> folder structure and select the checkbox next to your Iceberg table folder to select it as the shortcut target location. **Do not select** the checkboxes for "data" or "metadata" subfolders.
5. Click **Next** and **Create** your shortcut. *If you get an error, retry*





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
