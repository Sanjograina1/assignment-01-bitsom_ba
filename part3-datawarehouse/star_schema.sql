CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

CREATE TABLE dim_store(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(100) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    base_unit_price DECIMAL(10, 2)
);

CREATE TABLE fact_sales (
    transaction_id VARCHAR(50) PRIMARY KEY, 
    date_key INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL, 

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune');

INSERT INTO dim_product (product_id, product_name, category, base_unit_price) VALUES
(1, 'Speaker', 'Electronics', 49262.78),
(2, 'Tablet', 'Electronics', 23226.12),
(3, 'Phone', 'Electronics', 48703.39),
(4, 'Smartwatch', 'Electronics', 58851.01),
(5, 'Atta 10kg', 'Groceries', 52464.00),
(6, 'Jeans', 'Clothing', 2317.47),
(7, 'Biscuits', 'Groceries', 27469.99);

INSERT INTO dim_date (date_key, full_date, day, month, year, quarter) VALUES
(20230829, '2023-08-29', 29, 8, 2023, 3),
(20231212, '2023-12-12', 12, 12, 2023, 4),
(20230205, '2023-02-05', 5, 2, 2023, 1),
(20230220, '2023-02-20', 20, 2, 2023, 1),
(20230115, '2023-01-15', 15, 1, 2023, 1),
(20230908, '2023-09-08', 8, 9, 2023, 3),
(20230331, '2023-03-31', 31, 3, 2023, 1),
(20231026, '2023-10-26', 26, 10, 2023, 4),
(20231208, '2023-12-08', 8, 12, 2023, 4),
(20230815, '2023-08-15', 15, 8, 2023, 3);

INSERT INTO fact_sales (transaction_id, date_key, store_id, product_id, units_sold, unit_price, total_amount) VALUES
('TXN5000', 20230829, 1, 1, 3, 49262.78, 147788.34),
('TXN5001', 20231212, 1, 2, 11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
('TXN5003', 20230220, 2, 2, 14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
('TXN5005', 20230908, 3, 5, 12, 52464.00, 629568.00),
('TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
('TXN5007', 20231026, 4, 6, 16, 2317.47, 37079.52),
('TXN5008', 20231208, 3, 7, 9, 27469.99, 247229.91),
('TXN5009', 20230815, 3, 4, 3, 58851.01, 176553.03);