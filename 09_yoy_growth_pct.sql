SET search_path TO public;

WITH CTE AS (
SELECT
	EXTRACT(YEAR FROM o.order_purchase_timestamp) AS years,
	SUM(oi.price) AS current_revenue
FROM olist_orders o
INNER JOIN olist_order_items oi 
	ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'

GROUP BY 1
),
CTE2 AS (
SELECT 
	years,
	current_revenue,
	LAG(current_revenue) OVER(ORDER BY years) AS previous_revenue
FROM CTE
)

SELECT 
	years,
	current_revenue,
	previous_revenue,
	CASE
		WHEN previous_revenue IS NULL OR previous_revenue < 100000 THEN NULL
		ELSE ROUND(
				(current_revenue - previous_revenue) / NULLIF(previous_revenue, 0) * 100.0, 2
		) END AS yoy_growth_pct
FROM cte2
ORDER BY years ASC;

	