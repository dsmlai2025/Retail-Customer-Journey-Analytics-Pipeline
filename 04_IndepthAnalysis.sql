# Analysis based on sales, freight and delivery time.
# Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
# Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
# Do this in a single query.
# You can calculate the delivery time and the difference between the estimated & actual delivery date using the given formula:
# time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
#diff_estimated_delivery = order_estimated_delivery_date - order_delivered_customer_date
# Find out the top 5 states with the highest & lowest average freight value.
# Find out the top 5 states with the highest & lowest average delivery time.
# Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
# You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state. 

SELECT * FROM `Target.orders` LIMIT 4;

SELECT
 order_id,
 DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)
 AS delivered_in_days,
 DATE_DIFF(order_estimated_delivery_date, order_purchase_timestamp, DAY)
 AS estimated_delivery_in_days,
 DATE_DIFF(order_estimated_delivery_date, order_delivered_customer_date, DAY)
 AS estimated_minus_actual_delivery_days
FROM
 `Target.orders`
WHERE
 DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY) IS NOT NULL
ORDER BY
 delivered_in_days;

SELECT
 c.customer_state,
 ROUND(AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)), 2)
 AS avg_time_to_delivery,
 ROUND(AVG(DATE_DIFF(order_estimated_delivery_date, order_delivered_customer_date, DAY)), 2)
 AS avg_diff_estimated_delivery
FROM
 `Target.orders` o
JOIN
 `Target.customers` c ON o.customer_id = c.customer_id
WHERE
 DATE_DIFF(order_purchase_timestamp, order_delivered_customer_date, DAY) IS NOT NULL
 AND
 DATE_DIFF(order_estimated_delivery_date, order_delivered_customer_date, DAY) IS NOT NULL
GROUP BY
 c.customer_state
ORDER BY
 avg_time_to_delivery;


SELECT
 c.customer_state,
 ROUND(AVG(i.freight_value), 2) AS mean_freight_value,
 ROUND(AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)), 2)
 AS time_to_delivery,
 ROUND(AVG(DATE_DIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date, DAY)), 2)
 AS diff_estimated_delivery
FROM
 `Target.orders` o
JOIN
 `Target.order_items` i ON o.order_id = i.order_id
JOIN
 `Target.customers` c ON o.customer_id = c.customer_id
GROUP BY
 c.customer_state
ORDER BY mean_freight_value;

select T.state,ROUND(AVG(time_to_delivery-estimated_time_to_delivery),2) avg_days_delivery_delay
FROM(
     select ord.order_id, cust.customer_state as state,
     TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp, DAY)as time_to_delivery,
     TIMESTAMP_DIFF(order_estimated_delivery_date,order_purchase_timestamp, DAY) as estimated_time_to_delivery
     from `Target.orders` ord
     inner join `Target.order_items` oi
     on ord.order_id = oi.order_id
     inner join `Target.customers` cust
     on ord.customer_id = cust.customer_id) T
where (time_to_delivery>estimated_time_to_delivery)
GROUP BY 1
ORDER BY 2 desc
Limit 5;


select T.state,
 ROUND(AVG(estimated_time_to_delivery-time_to_delivery),2) avg_fast_delivery_days
FROM(
     select ord.order_id, cust.customer_state as state,
     TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp, DAY)as time_to_delivery,
     TIMESTAMP_DIFF(order_estimated_delivery_date,order_purchase_timestamp, DAY) as estimated_time_to_delivery
     from `Target.orders` ord
     inner join `Target.order_items` oi
     on ord.order_id = oi.order_id
     inner join `Target.customers` cust
     on ord.customer_id = cust.customer_id)T
where estimated_time_to_delivery>time_to_delivery
GROUP BY 1
ORDER BY 2 desc
Limit 5;


