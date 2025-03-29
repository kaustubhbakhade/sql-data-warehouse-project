/*
====================================================================
DDL Script : Create Silver Tables
===================================================================
Script Purpose

1) This script create tables in silver schema layers,dropping tables if they  already exist

====================================================================
*/
IF OBJECT_ID('silver.crm_cust_info','U') IS NOT NULL
  DROP TABLE silver.crm_cust_info
CREATE TABLE silver.crm_cust_info(
cst_id int,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(20),
cst_gndr nvarchar(20),
cst_create_date DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()

)
IF OBJECT_ID('silver.crm_prd_info','U') IS NOT NULL
  DROP TABLE silver.crm_prd_info

CREATE TABLE silver.crm_prd_info(
    prd_id int,
	c_id nvarchar(50),
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost int ,
    prd_line nvarchar(20),
    prd_start_dt DATE,
    prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()

)

IF OBJECT_ID('silver.crm_sales_details','U') IS NOT NULL
  DROP TABLE silver.crm_sales_details

CREATE TABLE silver.crm_sales_details(
    sls_ord_num nvarchar(20),
    sls_prd_key nvarchar(50),
    sls_cust_id int,
    sls_order_dt DATE ,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales int,
	sls_quantity int ,
	sls_price int,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
)

IF OBJECT_ID('silver.erp_loc_a101','U') IS NOT NULL
  DROP TABLE silver.erp_loc_a101
CREATE TABLE silver.erp_loc_a101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.erp_cust_az12','U') IS NOT NULL
  DROP TABLE silver.erp_cust_az12

CREATE TABLE silver.erp_cust_az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.erp_px_cat_g1v2','U') IS NOT NULL
  DROP TABLE silver.erp_px_cat_g1v2

CREATE TABLE silver.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
