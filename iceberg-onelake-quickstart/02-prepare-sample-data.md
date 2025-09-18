# 2. Prepare Sample Data

We will use the built‑in **SNOWFLAKE_SAMPLE_DATA** share to keep things simple.

- The first step is to create a database and warehouse in the Snowflake environment.
- Then create a database for the sample data from a public share in the Data Cloud.
- Let's run the following code statement by statement

> Replace your names as needed, but the workshop uses the following objects:
> - Warehouse: `FAB_SF_WH`
> - Database: `FAB_SF_DEMO_DB`
> - Schema: `ICEBERG_WS`

```sql
-- Run in Snowflake SQL Worksheet (Account Admin or appropriate role)
USE ROLE ACCOUNTADMIN;

-- Create DB and WH for Iceberg
CREATE OR REPLACE WAREHOUSE FAB_SF_WH WAREHOUSE_SIZE = 'XSMALL';

CREATE OR REPLACE DATABASE FAB_SF_DEMO_DB;
USE DATABASE FAB_SF_DEMO_DB;
CREATE OR REPLACE SCHEMA ICEBERG_WS;
USE SCHEMA ICEBERG_WS;

-- Create a database for the sample data from the share.
CREATE DATABASE SNOWFLAKE_SAMPLE_DATA FROM SHARE SFC_SAMPLES.SAMPLE_DATA;

-- Grant the PUBLIC role access to the database.
GRANT IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE_SAMPLE_DATA TO ROLE PUBLIC;

-- Quick peek at the sample customer data we'll use later
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.customer LIMIT 10;
```

> Continue to **[3. Create an Iceberg table in OneLake](03-create-iceberg-table-in-onelake.md)**.
