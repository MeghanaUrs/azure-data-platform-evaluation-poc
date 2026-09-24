-- SQL Server / Azure SQL compatible
CREATE TABLE dbo.StgCustomer (
    customer_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NULL,
    province VARCHAR(50) NULL
);

CREATE TABLE dbo.StgProduct (
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL
);

CREATE TABLE dbo.StgOrder (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    discount_pct DECIMAL(5,2) NULL
);

CREATE TABLE dbo.DimCustomer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NULL,
    province VARCHAR(50) NULL
);

CREATE TABLE dbo.DimProduct (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL UNIQUE,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL
);

CREATE TABLE dbo.DimDate (
    date_key INT PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    calendar_year INT NOT NULL,
    calendar_month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

CREATE TABLE dbo.FactOrder (
    order_key INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    date_key INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    discount_pct DECIMAL(5,2) NOT NULL,
    gross_amount DECIMAL(14,2) NOT NULL,
    net_amount DECIMAL(14,2) NOT NULL,
    FOREIGN KEY (customer_key) REFERENCES dbo.DimCustomer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dbo.DimProduct(product_key),
    FOREIGN KEY (date_key) REFERENCES dbo.DimDate(date_key)
);
