USE [ProjectWeek];


-- Drop Table Before Create It For Ensure Refresh Data
IF OBJECT_ID('dbo.retail_sales', 'U') IS NOT NULL
  DROP TABLE dbo.retail_sales;
GO
CREATE TABLE dbo.retail_sales (
transaction_id    INT,  
date              DATE, 
customer_id       NVARCHAR(8),
gender            NVARCHAR(1),
age               INT,
product_category  NVARCHAR(50),
quantity          INT,
unit_price        FLOAT,
revenue           INT
);