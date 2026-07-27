PIZZA SALES SQL QUERIES

A.	KPI’s

-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_sales
  	 
-- Average Order Value:
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_value from pizza_sales
 
-- Total Pizza Sold:
SELECT SUM(quantity) AS Total_Pizza_sold from pizza_sales

-- Total Orders:
SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
 
-- Average Pizzas Per Order:
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avg_pizza_per_order from pizza_sales
 

B.	CHARTS REQUIRED

-- Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for Total Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales GROUP BY DATENAME(MONTH, order_date)  ORDER BY Total_orders DESC
 
-- Percentage of Sales by Pizza category
SELECT pizza_category,SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS Percentage from pizza_sales AS Total_Sales WHERE MONTH(order_date) = 1
GROUP BY pizza_category
 
-- Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE DATEPART(quarter, order_date)=1) AS DECIMAL(10,2)) AS Percentage from pizza_sales WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size
ORDER BY Percentage DESC
 
-- Total Pizza Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
 
-- Top 5 Best Seller Pizza By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_revenue DESC
 
-- Bottom 5 Worst Seller Pizza By Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_revenue ASC
 
-- Top 5 Best Seller Pizza By Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Quantity DESC
 
-- Bottom 5 Worst Seller Pizza By Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Quantity ASC
 
-- Top 5 Best Seller Pizza By Total Order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
 
-- Bottom 5 Worst Seller Pizza By Total Order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
 


