#This will join customers to orders and products to calculate total order price
Select c.customer_name,
SUM(o.quantity * p.unit_price) as total_order_value
from customers c
join orders o on c.customer_id = o.customer_id
join products p on o.product_id = p.product_id
where c.customer_city = 'Mumbai'
group by c.customer_id, c.customer_name;

#This aggregates total quantity per product and picks the 3 highest value orders

SELECT p.product_name,
SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;

#Lists out all sales represntatives and total unique customers they have
SELECT sr.salesrep_name,
COUNT(DISTINCT o.customer_id) AS unique_customers_handled
FROM salesreps sr
LEFT JOIN orders o ON sr.salesrep_id = o.salesrep_id
GROUP BY sr.salesrep_id, sr.salesrep_name;

#This filters out orders above 10,000 sorted in descending order. 
SELECT o.order_id,
(o.quantity * p.unit_price) AS order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE (o.quantity * p.unit_price) > 10000
ORDER BY order_value DESC;

#Using LEFT JOIN to show all products and filter the ones never ordered. 
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;
