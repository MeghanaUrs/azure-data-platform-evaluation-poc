-- Import data/orders.csv, data/customers.csv and data/products.csv into staging tables first.

INSERT INTO dbo.DimCustomer (customer_id, customer_name, city, province)
SELECT customer_id, customer_name, city, province FROM dbo.StgCustomer;

INSERT INTO dbo.DimProduct (product_id, product_name, category, unit_price)
SELECT product_id, product_name, category, unit_price FROM dbo.StgProduct;

DECLARE @MinDate DATE = (SELECT MIN(order_date) FROM dbo.StgOrder);
DECLARE @MaxDate DATE = (SELECT MAX(order_date) FROM dbo.StgOrder);

;WITH Dates AS (
    SELECT @MinDate AS calendar_date
    UNION ALL
    SELECT DATEADD(DAY, 1, calendar_date)
    FROM Dates
    WHERE calendar_date < @MaxDate
)
INSERT INTO dbo.DimDate
(date_key, calendar_date, calendar_year, calendar_month, month_name)
SELECT
    CONVERT(INT, CONVERT(CHAR(8), calendar_date, 112)),
    calendar_date,
    YEAR(calendar_date),
    MONTH(calendar_date),
    DATENAME(MONTH, calendar_date)
FROM Dates
OPTION (MAXRECURSION 1000);

INSERT INTO dbo.FactOrder
(order_id, customer_key, product_key, date_key, quantity, unit_price,
 discount_pct, gross_amount, net_amount)
SELECT
    o.order_id,
    c.customer_key,
    p.product_key,
    d.date_key,
    o.quantity,
    p.unit_price,
    COALESCE(o.discount_pct, 0),
    o.quantity * p.unit_price,
    o.quantity * p.unit_price *
        (1 - COALESCE(o.discount_pct, 0) / 100.0)
FROM dbo.StgOrder o
JOIN dbo.DimCustomer c ON c.customer_id = o.customer_id
JOIN dbo.DimProduct p ON p.product_id = o.product_id
JOIN dbo.DimDate d ON d.calendar_date = o.order_date;
