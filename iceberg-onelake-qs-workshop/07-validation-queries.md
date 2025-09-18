# Validation Queries

### In Snowflake
```sql
SELECT COUNT(*) FROM WS_QS_DB.iceberg_qs.ws_qs_dim_customer;
```

### In Fabric
```sql
SELECT COUNT(*) FROM iceberg_qs_dim_customer;
SELECT C_NATIONKEY, COUNT(*) FROM iceberg_qs_dim_customer GROUP BY C_NATIONKEY;
```

![Validation](assets/img/validation.png)
