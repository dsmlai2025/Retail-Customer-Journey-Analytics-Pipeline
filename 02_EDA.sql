#In-depth Exploration:
#Is there a growing trend in the no. of orders placed over the past years? 
#Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
#During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)  
#0-6 hrs : Dawn
#7-12 hrs : Mornings
#13-18 hrs : Afternoon
#19-23 hrs : Night

#Q2.1 - Is there a growing trend in the no. of orders placed over the past years?
SELECT
     COUNT(o.order_id) as order_cnt,
     EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year,
     EXTRACT(MONTH FROM o.order_purchase_timestamp) AS order_month
FROM `Target.orders` o
JOIN `Target.customers` c
ON o.customer_id = c.customer_id
WHERE o.order_status <> 'canceled'
GROUP BY 2, 3
ORDER BY order_year, order_month ASC;

#Q2.2 - Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
SELECT
     EXTRACT(MONTH FROM order_purchase_timestamp) AS order_month,
           COUNT(order_id) as order_cnt
FROM `Target.orders`
GROUP BY order_month
ORDER BY order_month ASC;


#Q2.3 - During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night) 
#0-6 hrs : Dawn #7-12 hrs : Mornings
#13-18 hrs : Afternoon #19-23 hrs : Night


SELECT
     COUNT(order_id) AS order_cnt,
     CASE
         WHEN EXTRACT(HOUR FROM order_purchase_timestamp) <=6 THEN 'Dawn'
         WHEN EXTRACT(HOUR FROM order_purchase_timestamp) <=12 THEN 'Mornings'
         WHEN EXTRACT(HOUR FROM order_purchase_timestamp) <=18 THEN 'Afternoon'
         WHEN EXTRACT(HOUR FROM order_purchase_timestamp) <=23 THEN 'Night'
     END AS time_of_day
FROM `Target.orders`
GROUP BY time_of_day
ORDER BY order_cnt DESC;



