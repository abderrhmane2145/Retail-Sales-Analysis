USE [ProjectWeek];

BULK INSERT dbo.retail_sales
FROM 'C:\Users\LENOVO\Desktop\Projects\Projects_One\Script\retail_sales.csv'
WITH 
(
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
)
