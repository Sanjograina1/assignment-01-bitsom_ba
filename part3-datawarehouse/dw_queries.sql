#Q1: Total sales revenue by product category for each month
SELECT
    p.category,
    d.year,
    d.month,
    SUM(f.total_amount) AS total_revenue
FROM fact_sales f 
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY p.category, d.year, d.month
ORDER BY d.year, d.month, total_revenue DESC;

#Q2: Top 2 performaing stores by total revenue
SELECT
    s.store_name,
    s.store_city,
    SUM(f.total_amount) AS total_store_revenue
    FROM fact_sales f 
    JOIN dim_store s ON f.store_id = s.store_id
    GROUP BY s.store_name, s.store_city
    ORDER BY total_store_revenue DESC
    LIMIT 2;

#Q3: Month-over-month sales trend across all stores 
WITH MonthlySales AS (
    SELECT
        d.year,
        d.month,
        SUM(f.total_amount) AS current_month_sales
        FROM fact_sales f 
        JOIN dim_date d ON f.date_key = d.date_key
        GROUP BY d.year, d.month
)
SELECT
    year,
    month,
    current_month_sales,
    LAG(current_month_sales) OVER (ORDER BY year, month) AS previous_month_sales,
    (current_month_sales - LAG(current_month_sales) OVER (ORDER BY year, month)) AS monthly_growth
FROM MonthlySales
ORDER BY year, month;
