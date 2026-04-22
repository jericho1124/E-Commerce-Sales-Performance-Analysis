SET search_path TO public;

-- Sao Paulo has the highest total revenue since its the biggest city in brazil
-- with 39,156 unique customers
-- with 40.5K total orders
-- and with a total revenue of $5.067 Million


SELECT
	c.customer_state,
	SUM(oi.price) AS total_revenue,
	COUNT(DISTINCT o.order_id) AS total_orders,
	COUNT(DISTINCT c.customer_unique_id) AS unique_customers
FROM olist_customers c
INNER JOIN olist_orders o
	ON c.customer_id = o.customer_id
INNER JOIN olist_order_items oi 
	ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 2 DESC;
	
