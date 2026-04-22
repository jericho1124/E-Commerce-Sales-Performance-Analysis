SET search_path TO public;

/* Top 15 Product Categories */
-- Health Beauty category generated the most revenue $1.24M
-- Office furniture is the lowest with $270K
-- Bed Bath Table category has the most orders while having the 3rd highest revenue with $1.03M
-- Perfumery has the highest avg score with 4.2
-- Office furniture has the lowest avg score with 3.52
-- the rating scores in each category is consistent

SELECT 
	pt.product_category_name_english,
	COUNT(DISTINCT o.order_id) AS total_orders,	
	SUM(oi.price) AS total_revenue,
	ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM olist_orders o
INNER JOIN olist_order_items oi 
	ON o.order_id = oi.order_id
INNER JOIN olist_products p 
	ON p.product_id = oi.product_id
INNER JOIN product_category_translation pt
	ON pt.product_category_name = p.product_category_name
LEFT JOIN olist_order_reviews r
	ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY pt.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 15;