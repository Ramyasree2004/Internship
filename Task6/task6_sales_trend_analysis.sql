
-- TASK 6: Sales Trend Analysis Using Aggregations
-- Dataset: online_sales (table: orders)

-- 1. Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;

-- 2. Top 3 Months by Revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    monthly_revenue DESC
LIMIT 3;

-- 3. Revenue including handling of NULLs
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(COALESCE(amount, 0)) AS revenue_with_null_handling
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;
