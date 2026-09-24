-- Monthly revenue
SELECT d.calendar_year, d.calendar_month, d.month_name,
       SUM(f.net_amount) AS net_revenue
FROM dbo.FactOrder f
JOIN dbo.DimDate d ON d.date_key = f.date_key
GROUP BY d.calendar_year, d.calendar_month, d.month_name
ORDER BY d.calendar_year, d.calendar_month;

-- Revenue by category
SELECT p.category, SUM(f.net_amount) AS net_revenue
FROM dbo.FactOrder f
JOIN dbo.DimProduct p ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY net_revenue DESC;

-- Top customers
SELECT TOP (10) c.customer_id, c.customer_name,
       SUM(f.net_amount) AS customer_revenue
FROM dbo.FactOrder f
JOIN dbo.DimCustomer c ON c.customer_key = f.customer_key
GROUP BY c.customer_id, c.customer_name
ORDER BY customer_revenue DESC;

-- Top products
SELECT TOP (10) p.product_id, p.product_name,
       SUM(f.quantity) AS units_sold,
       SUM(f.net_amount) AS net_revenue
FROM dbo.FactOrder f
JOIN dbo.DimProduct p ON p.product_key = f.product_key
GROUP BY p.product_id, p.product_name
ORDER BY net_revenue DESC;

-- Running revenue
SELECT d.calendar_date,
       SUM(f.net_amount) AS daily_revenue,
       SUM(SUM(f.net_amount)) OVER (
           ORDER BY d.calendar_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_revenue
FROM dbo.FactOrder f
JOIN dbo.DimDate d ON d.date_key = f.date_key
GROUP BY d.calendar_date
ORDER BY d.calendar_date;
