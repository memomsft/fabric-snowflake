-- 1️⃣ Snowflake Setup: External Volume
USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE WAREHOUSE WS_QS_WH WITH WAREHOUSE_SIZE = 'XSMALL';

CREATE OR REPLACE DATABASE WS_QS_DB;
USE DATABASE WS_QS_DB;
CREATE SCHEMA iceberg_qs;
USE SCHEMA iceberg_qs;

CREATE OR REPLACE EXTERNAL VOLUME WS_ExVol_IcebergQS
  STORAGE_LOCATIONS = (
    (
      NAME = 'oneLakeVolQS',
      STORAGE_PROVIDER = 'AZURE',
      STORAGE_BASE_URL = 'azure://onelake.dfs.fabric.microsoft.com/<FabricWorkspaceName>/<LakehouseName>.Lakehouse/Files/iceberg_qs/',
      AZURE_TENANT_ID = '<YourTenantID>'
    )
  );

-- Verify External Volume
DESC EXTERNAL VOLUME WS_ExVol_IcebergQS;
