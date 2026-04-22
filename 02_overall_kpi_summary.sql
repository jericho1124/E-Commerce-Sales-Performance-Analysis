SET search_path TO public;

/* Overall KPI Summary */
-- Total Orders: 96,478
-- Total Revenue: $13.2 Million (delivered)
-- Total Freight Value $2.2 Million
-- Average Order Value $137.04
-- Average Review Score 4.16
WITH CTE AS (
SELECT 
	COUNT(DISTINCT o.order_id) AS total_orders,
	ROUND(SUM(oi.price), 2) AS total_revenue,
	ROUND(SUM(oi.freight_value), 2) AS total_freight,
	ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM olist_orders o 
LEFT JOIN olist_order_items oi 
	ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
),
CTE2 AS (
SELECT ROUND(AVG(r.review_score), 2) avg_review_score
FROM olist_order_reviews r
INNER JOIN olist_orders o
	ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
)
SELECT *
FROM cte, cte2;











