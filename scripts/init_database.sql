/*
================================================================
Create Database and Schemas
================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionaly, the script sets up three schemas 
    withitn the database: 'bronze', 'silver' and 'gold'.

WARNING:
    Running this script will dropt the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceddwith caution and
    ensure you have proper backups before running this script.
*/

USE master;
GO
  
-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK INMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO


CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
