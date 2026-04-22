SET search_path TO public;

-- November 2017 has the highest revenue and order count
-- As time goes on, sales goes higher and consistent

SELECT
	TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS year_month,
	COUNT(DISTINCT o.order_id) AS order_count,
	SUM(oi.price) AS revenue
FROM olist_orders o
INNER JOIN olist_order_items oi 
	ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;





	