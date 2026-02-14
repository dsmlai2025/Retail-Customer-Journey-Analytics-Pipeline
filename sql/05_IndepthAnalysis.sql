# Analysis based on the payments:
# Find the month on month no. of orders placed using different payment types.
# Find the no. of orders placed on the basis of the payment installments that have been paid.

SELECT
 p.payment_type,
 EXTRACT(MONTH FROM o.order_purchase_timestamp) AS month,
 COUNT(DISTINCT o.order_id) AS order_count
FROM
 `Target.orders` o
JOIN
 `Target.payments` p
ON
 o.order_id = p.order_id
GROUP BY
 1, 2
ORDER BY
 1, 2;


SELECT
 p.payment_installments,
 COUNT(o.order_id) AS order_count
FROM
 `Target.orders` o
JOIN
 `Target.payments` p
ON
 o.order_id = p.order_id
WHERE
 o.order_status != 'canceled'
GROUP BY
 1
ORDER BY
 2 DESC;
