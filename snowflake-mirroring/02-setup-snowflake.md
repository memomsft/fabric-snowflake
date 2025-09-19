# Step 2: Prepare Sample Data

Run the SQL script contained within this workshop directoyy --> `script/create_iot_demo_db.sql` in a Snowflake Workshees to create the database and populate tables.

**⚠️ Nota sobre Creación de Objetos: **
Para el laboratorio se requieren permisos para crear la base y las tablas de ejemplo.
En entornos productivos, la creación de objetos la realiza un rol administrativo y el rol de mirroring solo debe conservar permisos de lectura (USAGE, SELECT, CREATE STREAM).Como se indica en los prerequisitos.

Then once all the objects are created, run the following to validate the data is properly inserted

```sql
-- Validate sample data
SELECT * FROM IOT.READINGS LIMIT 5;
```

> Continue to **[3. Create mirrored Database ](03-create-mirrored-db.md)**.
