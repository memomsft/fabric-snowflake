# 3. Create an Iceberg Table in OneLake

In this step you will **(a) create an External Volume** that points to your Fabric OneLake path, **(b) enabling permissions** for Snowflake to access our Fabric Workspace and **(c) create an Iceberg table** stored there.

### A) Create External Volume (points to OneLake)

Before creating an Iceberg table, we must have an external volume. An external volume is one Snowflake object that stores information about your cloud storage locations, and identity and access management (IAM) entities (in this case, our Entra ID Tenant). Snowflake uses the external volume to establish a connection with our cloud storage in order to access Iceberg metadata and Parquet data.

We will need the OneLake Base URL. To find this in Fabric UI:

Update the placeholders for your **Fabric Workspace**, **Lakehouse** and **Tenant ID**.

- Go into an existing Fabric Workspace/create a new one.
- Create a New Item.
- Select Lakehouse and name it "Snow_LH".
- In the Explorer, click the elipses next to Files and then Properties.
- In the Properties Menu, copy the URL.
  **Note:** You will replace the https:// from the URL with the prefix azure:// in the SQL below for creating the volume in Snowflake


### B) Enable permissions to Snowflake in Microsoft Fabric




### C) Create the Iceberg Table

```sql
USE DATABASE FAB_SF_DEMO_DB;
USE SCHEMA ICEBERG_WS;

CREATE OR REPLACE ICEBERG TABLE WS_DIM_CUSTOMER (
    C_CUSTKEY     STRING,
    C_NAME        STRING,
    C_ADDRESS     STRING,
    C_NATIONKEY   STRING,
    C_PHONE       STRING,
    C_ACCTBAL     STRING,
    C_MKTSEGMENT  STRING,
    C_COMMENT     STRING
)
EXTERNAL_VOLUME = 'EXVOL_ONELAKE_WS'
CATALOG = snowflake
BASE_LOCATION = 'ws_dim_customer';

-- Load a small sample from TPCH_SF1.CUSTOMER
INSERT INTO WS_DIM_CUSTOMER
  SELECT TOP 500 *
  FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;

-- Verify in Snowflake
SELECT COUNT(*) AS rowcount FROM WS_DIM_CUSTOMER;
SELECT * FROM WS_DIM_CUSTOMER LIMIT 10;
```

> Continue to **[4. Accessing the Data in Fabric](04-accessing-the-data-in-fabric.md)**.
