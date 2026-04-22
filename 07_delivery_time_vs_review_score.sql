SET search_path TO public;


-- Yes, late deliveries does cause low review score
-- 92% of orders are delivered on time
-- Late deliveries are only 8%, but:
	-- they have much worse customer ratings
	-- and ~3x longer delivery time
-- Delivery speed is one of the strongest drivers of customer satisfaction in your dataset

SELECT 
	CASE
		WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 'On-Time'
		ELSE 'Late'
		END AS delivery_status,
	COUNT(DISTINCT o.order_id) AS order_count,
	ROUND(COUNT(DISTINCT o.order_id) * 100.0 / SUM(COUNT(DISTINCT o.order_id)) OVER(), 2) AS order_pct,
	ROUND(AVG(r.review_score), 2) AS avg_review_score,
	ROUND(AVG(o.order_delivered_customer_date::date - order_purchase_timestamp::date), 2) AS avg_delivery_days
FROM olist_orders o
INNER JOIN olist_order_reviews r 
	ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;


