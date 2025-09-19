-- Create demo database and sample tables
CREATE OR REPLACE DATABASE FABRIC_MIRROR_DEMO;

USE DATABASE FABRIC_MIRROR_DEMO;

CREATE SCHEMA IF NOT EXISTS IOT;

CREATE OR REPLACE TABLE IOT.DEVICES (
  device_id STRING,
  device_type STRING,
  registered_on DATE
);

CREATE OR REPLACE TABLE IOT.LOCATIONS (
  location_id STRING,
  country STRING,
  city STRING
);

CREATE OR REPLACE TABLE IOT.READINGS (
  reading_id STRING,
  device_id STRING,
  location_id STRING,
  reading_ts TIMESTAMP,
  temperature DOUBLE,
  humidity DOUBLE
);

INSERT INTO IOT.DEVICES VALUES
('D1', 'Thermostat', '2024-01-01'),
('D2', 'Sensor', '2024-02-01');

INSERT INTO IOT.LOCATIONS VALUES
('L1', 'US', 'New York'),
('L2', 'CA', 'Toronto');

INSERT INTO IOT.READINGS VALUES
('R1', 'D1', 'L1', '2024-07-01 08:00:00', 22.5, 60.0),
('R2', 'D1', 'L1', '2024-07-01 09:00:00', 23.0, 58.5),
('R3', 'D2', 'L2', '2024-07-01 10:00:00', 19.8, 65.0);
