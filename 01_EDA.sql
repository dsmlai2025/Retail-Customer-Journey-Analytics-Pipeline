#
#•	Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:
#•	Data type of all columns in the “customers” table.
#•	Get the time range between which the orders were placed.
#•	Count the Cities & States of customers who ordered during the given period.

#Q1.
SELECT * FROM Target.INFORMATION_SCHEMA.TABLES;

#Q1.1
SELECT
 column_name,
 data_type
FROM
 `sql-scaler-437011.Target.INFORMATION_SCHEMA.COLUMNS`
WHERE
 table_name = 'customers';

#Q1.2
SELECT * FROM `Target.orders` LIMIT 5;
#SELECT * FROM `Target.customers` LIMIT 5;

SELECT
     min(order_purchase_timestamp) as start_date,
     max(order_purchase_timestamp) as end_date,
     min(EXTRACT(YEAR FROM order_purchase_timestamp)) as start_year,
     max(EXTRACT(YEAR FROM order_purchase_timestamp)) as end_year
FROM `Target.orders` ;

#Q1.3 - Count the Cities & States of customers who ordered during the given period.
SELECT * FROM `Target.customers` LIMIT 5;
SELECT * FROM `Target.orders` LIMIT 5;
SELECT c.customer_city,
      c.customer_state,
      count(o.customer_id) as order_cnt
FROM `Target.orders` o
JOIN `Target.customers` c
ON o.customer_id = c.customer_id
GROUP BY c.customer_city, c.customer_state
ORDER BY order_cnt DESC;

