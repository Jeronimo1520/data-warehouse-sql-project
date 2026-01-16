/*
===============================================================================
Quality Checks
===============================================================================
Script purpose:
    This script can performs various quality checks for data consistency, accuracy, 
    and standardization across the 'bronze' or 'silver' schemas. It includes checks for:
      - Null or dupicate primary keys
      - Unwanted spaces in string fields.
      - Data standardization and consistency
      - Invalid date ranges
      - Data Consistency between related fields

Usage notes:
   - Run the checks after loading silver layer
   - Investigate and resolve any discrepancies found
   - Change the scripts depending on what schema or tables you want to check

===============================================================================
*/

-- Check for nulls or duplicates in Primary Key
--Expectations: No result
SELECT
cst_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces
-- Expectations: No results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Data standardization and consistency
SELECT DISTINCT cntry
FROM silver.[erp_loc_a101]

-- Check for NULLS or Negative numbers
-- Expectation: No resuts
SELECT sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR sls_order_dt IS NULL;

-- Check for Invalid Date orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- Check for invalid dates

SELECT 
NULLIF(sls_ship_dt,0) sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0
OR LEN(sls_ship_dt) != 8 
OR sls_ship_dt > 20260101
OR sls_ship_dt < 19000101;

-- Check for invalid date orders
SELECT 
*
FROM
[bronze].[crm_sales_details]
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check data consistency: Between sales, Quantity and price
-- << Sales = quantity * price
-- << Values must not be NULL, Zero or negative

SELECT DISTINCT
sls_sales AS sls_old_sales,
sls_quantity,
sls_price AS sls_old_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
OR sls_sales = 0 OR sls_quantity = 0 OR sls_price = 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- Identify Out-of-range dates
SELECT bdate
FROM silver.[erp_cust_az12]
WHERE bdate < '1926-01-01' OR bdate > GETDATE()
