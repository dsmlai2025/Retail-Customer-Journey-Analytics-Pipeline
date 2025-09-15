#Evolution of E-commerce orders in the Brazil region: 
#Get the month on month no. of orders placed in each state.
#How are the customers distributed across all the states?


## Get the month on month no. of orders placed in each state.

SELECT
 c.customer_state,
 EXTRACT(month FROM o.order_purchase_timestamp) AS month,
 COUNT(o.order_purchase_timestamp) AS order_cnt
FROM
 Target.orders o
JOIN
 Target.customers c
ON
 o.customer_id = c.customer_id
GROUP BY
 c.customer_state, month
ORDER BY
 c.customer_state, month;


##How are the customers distributed across all the states?

SELECT
 c.customer_state,
 COUNT(DISTINCT c.customer_unique_id) AS cust_cnt
FROM
 Target.customers c
GROUP BY c.customer_state
ORDER BY cust_cnt DESC;




# Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.
# Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only). You can use the “payment_value” column in the payments table to get the cost of orders.
# Calculate the Total & Average value of order price for each state.
# Calculate the Total & Average value of order freight for each state.

SELECT distinct(payment_type) FROM `Target.payments`;

SELECT t1.*, ROUND((t1.order_cost-t1.prev_cost)*100/t1.prev_cost,2) ||"%" as percentage_change
FROM (SELECT t.*,lag(t.order_cost) OVER (ORDER BY t.order_year) as prev_cost
FROM (
       SELECT format_date("%Y", o.order_purchase_timestamp) as order_year, 
         ROUND(SUM(p.payment_value)) as order_cost,
         FROM `Target.orders` o
         JOIN `Target.payments` p
         ON o.order_id = p.order_id
         WHERE o.order_purchase_timestamp between "2017-01-01" and "2017-08-31" OR
               o.order_purchase_timestamp between "2018-01-01" and "2018-08-31"
         GROUP BY 1
         ORDER BY 1) t
           ) t1
ORDER BY t1.order_year

## Calculate the Total & Average value of order price for each state.
SELECT
 c.customer_state,
 ROUND(AVG(i.price), 2) AS mean_price,
 ROUND(SUM(i.price), 2) AS total_price,
 ROUND(AVG(i.freight_value), 2) AS mean_freight_value,
 ROUND(SUM(i.freight_value), 2) AS total_freight_value
FROM
 `Target.orders` o
JOIN
 `Target.order_items` i ON o.order_id = i.order_id
JOIN
 `Target.customers` c ON o.customer_id = c.customer_id
GROUP BY
 c.customer_state;



