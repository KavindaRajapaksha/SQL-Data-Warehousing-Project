-- Verify all loaded tables with row counts
SELECT COUNT(*) AS crm_cust_info_rows FROM bronze.crm_cust_info;
SELECT COUNT(*) AS crm_prd_info_rows FROM bronze.crm_prd_info;
SELECT COUNT(*) AS crm_sales_details_rows FROM bronze.crm_sales_details;
SELECT COUNT(*) AS erp_cust_az12_rows FROM bronze.erp_cust_az12;
SELECT COUNT(*) AS erp_loc_a101_rows FROM bronze.erp_loc_a101;
SELECT COUNT(*) AS erp_px_cat_g1v2_rows FROM bronze.erp_px_cat_g1v2;

EXEC bronze.load_bronze;
