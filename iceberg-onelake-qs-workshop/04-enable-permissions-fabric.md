# Enable Permissions in Fabric

1. From Snowflake, run `DESC EXTERNAL VOLUME WS_ExVol_IcebergQS;`.
2. Copy the value of `AZURE_MULTI_TENANT_APP_NAME` (Snowflake Service Principal).
3. In Fabric Admin Portal:
   - Enable *Delta to Iceberg Virtualization* in Workspace Settings.
   - Add the Snowflake SP as **Contributor** to the target Lakehouse.

![Permissions](assets/img/permissions.png)
