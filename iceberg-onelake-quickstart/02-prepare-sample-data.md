# 2. Prepare Sample Data

We will use the built‑in **SNOWFLAKE_SAMPLE_DATA** share to keep things simple.

> Replace names as needed, but the workshop uses the following objects:
> - Warehouse: `FAB_SF_WH`
> - Database: `FAB_SF_DEMO_DB`
> - Schema: `ICEBERG_WS`

```sql
-- Run in Snowflake SQL Worksheet (AccountAdmin or appropriate role)
USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE WAREHOUSE FAB_SF_WH
  WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 AUTO_RESUME = TRUE;

CREATE OR REPLACE DATABASE FAB_SF_DEMO_DB;
USE DATABASE FAB_SF_DEMO_DB;

CREATE OR REPLACE SCHEMA ICEBERG_WS;
USE SCHEMA ICEBERG_WS;

-- Quick peek at the sample customer data we'll use later
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER LIMIT 10;
```

> Continue to **[3. Create an Iceberg table in OneLake](03-create-iceberg-table-in-onelake.md)**.
