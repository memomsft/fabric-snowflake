# Step 0: Prerequisites

Ensure the following before starting:
- Snowflake account with CREATE DATABASE privilege in case you want to create new tables to replicate. For this lab we will create new Database, schema and tables using a Snowflake Trial so the `accountadmin` role included should be enough.
- Fabric workspace with Contributor access
- Internet access from Fabric to Snowflake endpoints
- Ensure the user who is performing the mirroring has the correct permissions as stated in [01-premissions](01-permissions.md)**.

✅ **Tip:** Use a Fabric F-SKU or Trial capacity for hands-on learning.

⚠️ Important: The CREATE DATABASE permissions are recommended only for the lab environment.
In production, database/schema/table creation is usually handled by an administrator role (e.g., SYSADMIN).

> Continue to **[1. Permissions](01-permissions.md)**.
