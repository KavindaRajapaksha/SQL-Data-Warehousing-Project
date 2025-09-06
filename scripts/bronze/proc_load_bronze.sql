USE DataWarehouse;
GO

-- ======================================================================
-- Load CRM Customer Info Table
-- ======================================================================

-- Remove old data for data integrity
TRUNCATE TABLE bronze.crm_cust_info;
GO

-- Load fresh data from CSV file into bronze.crm_cust_info
BULK INSERT bronze.crm_cust_info
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
  FIRSTROW = 2,              -- Skip header row
  FIELDTERMINATOR = ',',     -- Comma-separated file
  ROWTERMINATOR = '0x0a',    -- Newline as row terminator
  TABLOCK                    -- Lock table for performance
);

-- Verify loaded data
SELECT * FROM bronze.crm_cust_info;
SELECT COUNT(*) AS num_of_rows FROM bronze.crm_cust_info;
GO


-- ======================================================================
-- Load CRM Product Info Table
-- ======================================================================

TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK
);

-- Verify loaded data
SELECT * FROM bronze.crm_prd_info;
SELECT COUNT(*) AS num_of_rows FROM bronze.crm_prd_info;
GO


-- ======================================================================
-- Load CRM Sales Details Table
-- ======================================================================

TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK
);

-- Verify loaded data
SELECT * FROM bronze.crm_sales_details;
SELECT COUNT(*) AS num_of_rows FROM bronze.crm_sales_details;
GO


-- ======================================================================
-- Load ERP Customer Table
-- ======================================================================

TRUNCATE TABLE bronze.erp_cust_az12;
GO

BULK INSERT bronze.erp_cust_az12
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK
);

-- Verify loaded data
SELECT * FROM bronze.erp_cust_az12;
SELECT TOP 5 * FROM bronze.erp_cust_az12;
SELECT COUNT(*) AS num_of_rows FROM bronze.erp_cust_az12;
GO


-- ======================================================================
-- Load ERP Location Table
-- ======================================================================

TRUNCATE TABLE bronze.erp_loc_a101;
GO

BULK INSERT bronze.erp_loc_a101
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK
);

-- Verify loaded data
SELECT * FROM bronze.erp_loc_a101;
SELECT TOP 5 * FROM bronze.erp_loc_a101;
SELECT COUNT(*) AS num_of_rows FROM bronze.erp_loc_a101;
GO


-- ======================================================================
-- Load ERP Product Category Table
-- ======================================================================

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
GO

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'E:\Data Engineering Projects\SQL Data Warehousing Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  TABLOCK
);

-- Verify loaded data
SELECT * FROM bronze.erp_px_cat_g1v2;
SELECT TOP 5 * FROM bronze.erp_px_cat_g1v2;
SELECT COUNT(*) AS num_of_rows FROM bronze.erp_px_cat_g1v2;
GO
