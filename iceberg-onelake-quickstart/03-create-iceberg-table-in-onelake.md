# 3. Create an Iceberg Table in OneLake

In this step you will **(a) create an External Volume** that points to your Fabric OneLake path and **(b) create an Iceberg table** stored there.

### A) Create External Volume (points to OneLake)
Update the placeholders for your **Fabric Workspace**, **Lakehouse** and **Tenant ID**.

```sql
USE ROLE ACCOUNTADMIN;
USE DATABASE FAB_SF_DEMO_DB;
USE SCHEMA ICEBERG_WS;

CREATE OR REPLACE EXTERNAL VOLUME EXVOL_ONELAKE_WS
  STORAGE_LOCATIONS = (
    (
      NAME = 'oneLakeVol',
      STORAGE_PROVIDER = 'AZURE',
      STORAGE_BASE_URL = 'azure://onelake.dfs.fabric.microsoft.com/<FabricWorkspaceName>/<LakehouseName>.Lakehouse/Files/iceberg_ws/',
      AZURE_TENANT_ID = '<YourTenantID>'
    )
  );

DESC EXTERNAL VOLUME EXVOL_ONELAKE_WS;
```

**Copy the value of `AZURE_MULTI_TENANT_APP_NAME`** from the `DESC` output — it is the **Snowflake service principal** you must grant access to the Lakehouse in Fabric.

### B) Grant SP access in Fabric
1. In **Fabric Admin portal** / your **Workspace settings**, enable Iceberg virtualization if applicable.
2. In the **Lakehouse**, grant **Contributor** to the **Snowflake SP** (the value from `AZURE_MULTI_TENANT_APP_NAME`).

### C) Create & Populate the Iceberg table
We’ll create a dimension‑style table with a workshop‑specific name: **`WS_DIM_CUSTOMER`**.

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
