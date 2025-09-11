CREATE LOGIN powerbi_reader WITH PASSWORD = 'Kavinda123';
USE DataWarehouse;
CREATE USER powerbi_reader FOR LOGIN powerbi_reader;
GRANT SELECT ON SCHEMA::gold TO powerbi_reader;
