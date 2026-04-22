SET search_path TO public;

SELECT 
	s.seller_id,
	s.seller_state,
	COUNT(DISTINCT o.order_id) AS orders_fulfilled,
	SUM(oi.price) AS total_revenue,
	ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM olist_sellers s
INNER JOIN olist_order_items oi 
	ON oi.seller_id = s.seller_id
INNER JOIN olist_orders o 
	ON o.order_id = oi.order_id
LEFT JOIN olist_order_reviews r 
	ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1, 2
ORDER BY 4 DESC
LIMIT 10;