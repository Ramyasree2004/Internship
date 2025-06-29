
-- 1. Total Sales per Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2. Top 5 Products by Profit
SELECT [Product Name], SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY [Product Name]
ORDER BY Total_Profit DESC
LIMIT 5;

-- 3. Sales by Category and Sub-Category
SELECT Category, [Sub-Category], SUM(Sales) AS Sales
FROM superstore
GROUP BY Category, [Sub-Category]
ORDER BY Category, Sales DESC;

-- 4. Average Discount by Segment
SELECT Segment, AVG(Discount) AS Avg_Discount
FROM superstore
GROUP BY Segment;

-- 5. Monthly Sales Trend (SQLite syntax)
SELECT 
  STRFTIME('%Y-%m', [Order Date]) AS Order_Month,
  SUM(Sales) AS Monthly_Sales
FROM superstore
GROUP BY Order_Month
ORDER BY Order_Month;

-- 6. Create a View for Order Summary
CREATE VIEW Order_Summary AS
SELECT 
  [Order ID],
  [Customer Name],
  [Order Date],
  Sales,
  Profit,
  [Shipping Cost]
FROM superstore;

-- 7. Total Profit by Country (Top 10)
SELECT Country, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Country
ORDER BY Total_Profit DESC
LIMIT 10;
