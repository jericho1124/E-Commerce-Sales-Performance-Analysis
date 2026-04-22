SET search_path TO public;

-- Credit cards drive most of the sales, mainly because they let people pay in installments
-- Boleto helps bring in extra customers who might not use cards
-- The other methods don’t contribute much to revenue

SELECT 
	payment_type,
	COUNT(DISTINCT order_id) AS order_count,
	ROUND(AVG(payment_installments), 2) AS avg_installments,
	ROUND(AVG(payment_value), 2) AS avg_payment_value,
	ROUND(SUM(payment_value), 2) AS total_payment_value
FROM olist_order_payments
WHERE payment_type != 'not_defined'
GROUP BY 1
ORDER BY 2 DESC