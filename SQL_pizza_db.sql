SELECT *
FROM pizza_sales;

SELECT ROUND(SUM(total_price), 2) AS Total_Revenue
FROM pizza_sales;

SELECT ROUND(ROUND(SUM(total_price), 2) / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avarage_Pizza
FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/ CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avarage_Pizza
FROM pizza_sales;

USE pizza_db;
SELECT *
FROM dbo.pizza_sales;


/* SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders_per_day
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY 1;

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders_per_day
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY CASE 
           WHEN DATENAME(DW, order_date) = 'Monday' THEN 1
           WHEN DATENAME(DW, order_date) = 'Tuesday' THEN 2
           WHEN DATENAME(DW, order_date) = 'Wednesday' THEN 3
           WHEN DATENAME(DW, order_date) = 'Thursday' THEN 4
           WHEN DATENAME(DW, order_date) = 'Friday' THEN 5
           WHEN DATENAME(DW, order_date) = 'Saturday' THEN 6
           WHEN DATENAME(DW, order_date) = 'Sunday' THEN 7
         END; */

SET DATEFIRST 1;
SELECT DATENAME(DW, order_date) AS Order_day
		,COUNT(DISTINCT order_id) AS Total_orders_per_day
FROM pizza_sales
GROUP BY DATENAME(DW, order_date), DATEPART(DW, order_date)
ORDER BY DATEPART(DW, order_date);

SELECT DATENAME(MONTH, order_date) AS Month
		,COUNT(DISTINCT order_id) AS Total_orders_per_month
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date), DATEPART(MONTH, order_date)
ORDER BY DATEPART(MONTH, order_date);

SELECT DATENAME(MONTH, order_date) AS Month
		,COUNT(DISTINCT order_id) AS Total_orders_per_month
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders_per_month DESC;

SELECT pizza_category
		,SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_Pizza_Category
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_category
		,ROUND(SUM(total_price), 3) AS Total_Sales
		,ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 3) AS '%_Pizza_Category'
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_category
		,ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 3) AS '%_Pizza_Category'
FROM pizza_sales
GROUP BY pizza_category;

/* For Jan */
SELECT pizza_category
		,ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1), 3) AS '%_Pizza_Category'
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

SELECT pizza_size
		,ROUND(SUM(total_price), 2) AS Total_Sales
		,ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS '%_Pizza_size'
FROM pizza_sales
GROUP BY pizza_size
ORDER BY '%_Pizza_size' DESC;


-- 1st QUARTER
SELECT pizza_size
		,ROUND(SUM(total_price), 2) AS Total_Sales
		,ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS '%_Pizza_size'
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY '%_Pizza_size' DESC;

SELECT TOP 5 pizza_name
		,ROUND(SUM(total_price), 2)  AS Total_Sales
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales;

SELECT *
FROM pizza_sales;

SELECT TOP 5 pizza_name
		,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

SELECT TOP 5 pizza_name
		,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity;

SELECT TOP 5 pizza_name
		,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders;

SELECT DATEPART(HOUR, order_time) AS Order_Hours
		,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);