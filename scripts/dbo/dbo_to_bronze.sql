USE DataWarehouse;
GO
--copy dbo to bronze layer
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'cust_info'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.cust_info;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'crm_cust_info'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.crm_cust_info;

INSERT INTO bronze.crm_cust_info
(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT
    TRY_CAST(cst_id AS int) AS cst_id,
    CAST(cst_key AS nvarchar(50)) AS cst_key,
    CAST(cst_firstname AS nvarchar(50)) AS cst_firstname,
    CAST(cst_lastname AS nvarchar(50)) AS cst_lastname,
    CAST(cst_marital_status AS nvarchar(50)) AS cst_marital_status,
    CAST(cst_gndr AS nvarchar(50)) AS cst_gndr,
    TRY_CAST(cst_create_date AS date) AS cst_create_date
FROM dbo.cust_info;

SELECT COUNT(*) FROM bronze.crm_cust_info;

-- copy prod info

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'prd_info'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.prd_info;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'crm_prd_info'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.crm_prd_info;

INSERT INTO bronze.crm_prd_info
(
    prd_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
SELECT
    TRY_CAST(prd_id AS int) AS prd_id,
    CAST(prd_key AS nvarchar(50)) AS prd_key,
    CAST(prd_nm AS nvarchar(50)) AS prd_nm,
    TRY_CAST(prd_cost AS int) AS prd_cost,
    CAST(prd_line AS nvarchar(50)) AS prd_line,
    TRY_CAST(prd_start_dt AS datetime) AS prd_start_dt,
    TRY_CAST(prd_end_dt AS datetime) AS prd_end_dt
FROM dbo.prd_info;

SELECT COUNT(*) FROM bronze.crm_prd_info;

-- copy dbo.sales info to bronze.crm_sales_details

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'sales_details'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.sales_details;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'crm_sales_details'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.crm_sales_details;

INSERT INTO bronze.crm_sales_details
(
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)
SELECT
    CAST(sls_ord_num AS nvarchar(50)) AS sls_ord_num,
    CAST(sls_prd_key AS nvarchar(50)) AS sls_prd_key,
    TRY_CAST(sls_cust_id AS int) AS sls_cust_id,
    TRY_CAST(sls_order_dt AS int) AS sls_order_dt,
    TRY_CAST(sls_ship_dt AS int) AS sls_ship_dt,
    TRY_CAST(sls_due_dt AS int) AS sls_due_dt,
    TRY_CAST(sls_sales AS int) AS sls_sales,
    TRY_CAST(sls_quantity AS int) AS sls_quantity,
    TRY_CAST(sls_price AS int) AS sls_price
FROM dbo.sales_details;

SELECT COUNT(*) FROM bronze.crm_sales_details;

--copy dbo.custaz12 to bronze.erp_cust_az12

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'CUST_AZ12'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.CUST_AZ12;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'erp_cust_az12'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.erp_cust_az12;

INSERT INTO bronze.erp_cust_az12
(
    cid,
    bdate,
    gen
)
SELECT
    CAST(CID AS nvarchar(50)) AS cid,
    TRY_CAST(BDATE AS date) AS bdate,
    CAST(GEN AS nvarchar(50)) AS gen
FROM dbo.CUST_AZ12;

SELECT COUNT(*) FROM bronze.erp_cust_az12;

-- copy dbo.LOC_A101 to bronze.erp_loc_a101

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'LOC_A101'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.LOC_A101;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'erp_loc_a101'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.erp_loc_a101;

INSERT INTO bronze.erp_loc_a101
(
    cid,
    cntry
)
SELECT
    CAST(CID AS nvarchar(50)) AS cid,
    CAST(CNTRY AS nvarchar(50)) AS cntry
FROM dbo.LOC_A101;

SELECT COUNT(*) FROM bronze.erp_loc_a101;

--copy dbo.PX_CAT_G1V2 to bronze.erp_px_cat_g1v2

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'PX_CAT_G1V2'
    AND TABLE_SCHEMA = 'dbo';

SELECT COUNT(*) FROM dbo.PX_CAT_G1V2;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'erp_px_cat_g1v2'
    AND TABLE_SCHEMA = 'bronze';

SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;

INSERT INTO bronze.erp_px_cat_g1v2
(
    id,
    cat,
    subcat,
    maintenance
)
SELECT
    CAST(ID AS nvarchar(50)) AS id,
    CAST(CAT AS nvarchar(50)) AS cat,
    CAST(SUBCAT AS nvarchar(50)) AS subcat,
    CAST(MAINTENANCE AS nvarchar(50)) AS maintenance
FROM dbo.PX_CAT_G1V2;

SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;

--verfication
-- Verify row counts for all tables

-- cust_info
SELECT 'cust_info' AS TableName, COUNT(*) AS SourceCount FROM dbo.cust_info
UNION ALL
SELECT 'crm_cust_info', COUNT(*) FROM bronze.crm_cust_info;

-- prd_info
SELECT 'prd_info', COUNT(*) FROM dbo.prd_info
UNION ALL
SELECT 'crm_prd_info', COUNT(*) FROM bronze.crm_prd_info;

-- sales_details
SELECT 'sales_details', COUNT(*) FROM dbo.sales_details
UNION ALL
SELECT 'crm_sales_details', COUNT(*) FROM bronze.crm_sales_details;

-- CUST_AZ12
SELECT 'CUST_AZ12', COUNT(*) FROM dbo.CUST_AZ12
UNION ALL
SELECT 'erp_cust_az12', COUNT(*) FROM bronze.erp_cust_az12;

-- LOC_A101
SELECT 'LOC_A101', COUNT(*) FROM dbo.LOC_A101
UNION ALL
SELECT 'erp_loc_a101', COUNT(*) FROM bronze.erp_loc_a101;

-- PX_CAT_G1V2
SELECT 'PX_CAT_G1V2', COUNT(*) FROM dbo.PX_CAT_G1V2
UNION ALL
SELECT 'erp_px_cat_g1v2', COUNT(*) FROM bronze.erp_px_cat_g1v2;

-- Sample data from source and target for visual comparison

SELECT TOP 5 * FROM dbo.cust_info;
SELECT TOP 5 * FROM bronze.crm_cust_info;

SELECT TOP 5 * FROM dbo.prd_info;
SELECT TOP 5 * FROM bronze.crm_prd_info;

SELECT TOP 5 * FROM dbo.sales_details;
SELECT TOP 5 * FROM bronze.crm_sales_details;

SELECT TOP 5 * FROM dbo.CUST_AZ12;
SELECT TOP 5 * FROM bronze.erp_cust_az12;

SELECT TOP 5 * FROM dbo.LOC_A101;
SELECT TOP 5 * FROM bronze.erp_loc_a101;

SELECT TOP 5 * FROM dbo.PX_CAT_G1V2;
SELECT TOP 5 * FROM bronze.erp_px_cat_g1v2;
