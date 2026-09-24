-- Duplicate customer business keys
SELECT customer_id, COUNT(*) AS duplicate_count
FROM dbo.StgCustomer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Duplicate product business keys
SELECT product_id, COUNT(*) AS duplicate_count
FROM dbo.StgProduct
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Mandatory customer fields
SELECT * FROM dbo.StgCustomer
WHERE customer_id IS NULL OR customer_name IS NULL;

-- Invalid product values
SELECT * FROM dbo.StgProduct
WHERE unit_price < 0 OR product_name IS NULL OR category IS NULL;

-- Invalid orders
SELECT * FROM dbo.StgOrder
WHERE quantity <= 0 OR order_date IS NULL
   OR customer_id IS NULL OR product_id IS NULL;

-- Orphan customer references
SELECT o.*
FROM dbo.StgOrder o
LEFT JOIN dbo.DimCustomer c ON c.customer_id = o.customer_id
WHERE c.customer_key IS NULL;

-- Orphan product references
SELECT o.*
FROM dbo.StgOrder o
LEFT JOIN dbo.DimProduct p ON p.product_id = o.product_id
WHERE p.product_key IS NULL;

-- Source-to-target row count
SELECT
    (SELECT COUNT(*) FROM dbo.StgOrder) AS source_order_rows,
    (SELECT COUNT(*) FROM dbo.FactOrder) AS target_order_rows;

-- Source-to-target revenue reconciliation
SELECT
    SUM(o.quantity * p.unit_price *
        (1 - COALESCE(o.discount_pct, 0) / 100.0)) AS source_net_amount,
    (SELECT SUM(net_amount) FROM dbo.FactOrder) AS target_net_amount
FROM dbo.StgOrder o
JOIN dbo.DimProduct p ON p.product_id = o.product_id;
