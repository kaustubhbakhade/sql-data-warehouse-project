/*


*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
     BEGIN TRY
	       DECLARE @start_time DATETIME,@end_time DATETIME;
           PRINT '===============================================================================';
           PRINT 'Loading Data Into Bronze Layer';
		   PRINT '===============================================================================';
		   PRINT '-----------------------------------------------------------------------------';
		   PRINT 'Loarding CRM Tables';
		   PRINT '-----------------------------------------------------------------------------';

		   PRINT '>> Truncate Table: bronze.crm_cust_info';
           TRUNCATE TABLE bronze.crm_cust_info

           PRINT 'Insert Data into : bronze.crm_cust_info';
		   SET @start_time = GETDATE();
           BULK INSERT bronze.crm_cust_info
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );
           PRINT 'Data Insertion Done';
           SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);

		   PRINT '>> Truncate Table: bronze.crm_prd_info';
           TRUNCATE TABLE bronze.crm_prd_info

		   PRINT 'Insert Data into : bronze.crm_prd_info';
           SET @start_time = GETDATE();
           BULK INSERT bronze.crm_prd_info
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );

		   PRINT 'Data Insertion Done';
		   SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);
           
		   PRINT '>> Truncate Table: bronze.crm_sales_details';
           TRUNCATE TABLE bronze.crm_sales_details

		   PRINT 'Insert Data into : bronze.crm_sales_details';
           SET @start_time = GETDATE();
           BULK INSERT bronze.crm_sales_details
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );

		   PRINT 'Data Insertion Done';
		   SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);

		   PRINT '-----------------------------------------------------------------------------';
		   PRINT 'Loarding CRM Tables';
		   PRINT '-----------------------------------------------------------------------------';
           
		   PRINT '>> Truncate Table: bronze.erp_loc_a101';
           TRUNCATE TABLE bronze.erp_loc_a101

		   PRINT 'Insert Data into : bronze.erp_loc_a101';
           SET @start_time = GETDATE();
           BULK INSERT bronze.erp_loc_a101
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );

		   PRINT 'Data Insertion Done';
           SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);

           PRINT '>> Truncate Table: bronze.erp_cust_az12';
           TRUNCATE TABLE bronze.erp_cust_az12

		   PRINT 'Insert Data into : bronze.erp_cust_az12';
		   SET @start_time = GETDATE();
           BULK INSERT bronze.erp_cust_az12
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );

		   PRINT 'Data Insertion Done';
           SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);

		   PRINT '>> Truncate Table: bronze.erp_px_cat_g1v2';
           TRUNCATE TABLE bronze.erp_px_cat_g1v2

		   PRINT 'Insert Data into : bronze.erp_px_cat_g1v2';
           SET @start_time = GETDATE();
           BULK INSERT bronze.erp_px_cat_g1v2
           FROM 'C:\Users\kaustubh.bakhade\OneDrive - Motifworks Inc\SPARK\data modelling\data warehousing project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
           WITH
           (
              FIRSTROW = 2,
              FIELDTERMINATOR = ',',
              TABLOCK
           );

		   PRINT 'Data Insertion Done';
		   SET @end_time = GETDATE();
		   PRINT '>> Load Duration : ' + CAST(DATEDIFF(Second,@start_time,@end_time) AS NVARCHAR);

		   PRINT 'Task Completed Successfully ';
     
	 END TRY
	 BEGIN CATCH 
	      PRINT '========================================================================================';
		  PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		  PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		  PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		  PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		  PRINT '========================================================================================';
	 END CATCH 
END
