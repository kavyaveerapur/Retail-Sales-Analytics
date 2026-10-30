-- Retail Sales Analytics
-- Database: retail_analytics
-- Purpose: Explore sales, profit, quantity, regional/category performance,
--          loss-making transactions, and example regional sales targets.
-- Note: region_targets contains illustrative sample targets, not actual company targets.

CREATE DATABASE retail_analytics;

USE retail_analytics;

SELECT COUNT(*) AS total_rows
FROM sales_data;

SELECT *
FROM sales_data
LIMIT 10;
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
    `Category`,
    SUM(`Sales`) AS Total_Sales
FROM sales_data
GROUP BY `Category`
ORDER BY Total_Sales DESC;


SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales_data;
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;


DESCRIBE sales_data;

SELECT
    COUNT(*) AS total_rows,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales_data;
SELECT
    region,
    category,
    sales,
    profit
FROM sales_data
WHERE profit < 0
ORDER BY profit ASC
LIMIT 20;

SELECT
    region,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY region
HAVING SUM(sales) > 500000
ORDER BY total_sales DESC;

CREATE TABLE IF NOT EXISTS region_targets (
    region VARCHAR(50) PRIMARY KEY,
    sales_target DECIMAL(12,2)
);
INSERT INTO region_targets (region, sales_target)
VALUES
    ('West', 750000),
    ('East', 650000),
    ('Central', 550000),
    ('South', 400000);
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales_data;
