/* 
================================
EXPLORATORY DATA ANALYSIS
================================
We Focus On :
	- Total Revenue(by year, month, gender, product_category, age_groups)
	- Total Customer(by gender, product_category, age_groups)
*/

/*
===============
I - Revenue 
===============
*/
-- 1) Revenue By Year

SELECT 
	YEAR(date) as year,
	SUM(revenue)AS total_revenue 
FROM dbo.retail_sales 
GROUP BY YEAR(date);
-- 2) Revenue By Year, Months
SELECT 
    YEAR(date)  AS year,
	MONTH(date) AS month,
	SUM(revenue) AS total_revenue
FROM dbo.retail_sales
GROUP BY YEAR(date), MONTH(date)
ORDER BY YEAR(date), MONTH(date);

WITH CTE_aggregate as (
SELECT 
    SUBSTRING(CAST(YEAR(date) AS NVARCHAR), 3, 2)  AS year,
	MONTH(date) AS month,
	SUM(revenue) AS total_revenue
FROM dbo.retail_sales
GROUP BY YEAR(date), MONTH(date)
)
SELECT 
   CONCAT(year, '-', month) AS date,
   year,
   month,
   total_revenue
FROM CTE_aggregate
ORDER BY year, month;

-- 3) Total Revenue for each category
SELECT 
    product_category,
	SUM(revenue) AS total_revenue
FROM dbo.retail_sales
GROUP BY product_category
ORDER BY SUM(revenue) DESC;

-- 4) Total Revenue By Gender
SELECT 
    gender,
	SUM(revenue) AS total_revenue
FROM dbo.retail_sales
GROUP BY gender
ORDER BY SUM(revenue) DESC;

-- 5) Total Reveue Depeding On Group Age
WITH CTE_Segment AS (
SELECT
	*,

	CASE WHEN age < 18 THEN 'Under 18'
		 WHEN age BETWEEN 18 AND 25 THEN '18 - 25'
		 WHEN age BETWEEN 26 AND 50 THEN '26 - 50'
		 ELSE 'Above 50'
	END AS age_group 
FROM dbo.retail_sales
)
SELECT 
	age_group,
	SUM(revenue) AS total_revenue
FROM CTE_Segment 
GROUP BY age_group;

/*
===============
II - Customers 
===============
*/


-- 1) By Gender
SELECT 
	gender, 
	COUNT(DISTINCT customer_id) AS total_customer
FROM dbo.retail_sales
GROUP BY gender;

-- 2) By Product_Category
SELECT 
    product_category,
	COUNT(DISTINCT customer_id) AS total_customer
FROM dbo.retail_sales
GROUP BY product_category;

-- 3) By Age Groups
WITH CTE_Segment AS (
SELECT
	*,

	CASE WHEN age < 18 THEN 'Under 18'
		 WHEN age BETWEEN 18 AND 25 THEN '18 - 25'
		 WHEN age BETWEEN 26 AND 50 THEN '26 - 50'
		 ELSE 'Above 50'
	END AS age_group 
FROM dbo.retail_sales
)
SELECT 
	age_group,
	COUNT(DISTINCT customer_id) AS total_customer
FROM CTE_Segment 
GROUP BY age_group;

WITH CTE_Segment AS (
SELECT
	*,

	CASE WHEN age < 18 THEN 'Under 18'
		 WHEN age BETWEEN 18 AND 25 THEN '18 - 25'
		 WHEN age BETWEEN 26 AND 50 THEN '26 - 50'
		 ELSE 'Above 50'
	END AS age_group 
FROM dbo.retail_sales
),
CTE_Secondary AS 
(
SELECT 
	age_group,
	COUNT(DISTINCT customer_id) AS total_customer,
	SUM(revenue) AS total_revenue
FROM CTE_Segment 
GROUP BY age_group
)
SELECT 
   age_group,
   total_revenue,
   total_customer
FROM CTE_Secondary;
WITH CTE_first AS
(
SELECT

	CASE WHEN age < 18 THEN 'Under 18'
		 WHEN age BETWEEN 18 AND 25 THEN '18 - 25'
		 WHEN age BETWEEN 26 AND 50 THEN '26 - 50'
		 ELSE 'Above 50'
	END AS age_group,
	product_category
FROM dbo.retail_sales
)
SELECT 
   age_group,
   product_category,
   COUNT(product_category) AS Total
FROM CTE_first
GROUP BY age_group, product_category

ORDER BY age_group, product_category;
