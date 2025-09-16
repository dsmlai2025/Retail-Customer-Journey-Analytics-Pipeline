🛍️ Target Retail Business Case Study – SQL Analytics

**Context**

    Target is a globally renowned brand and a prominent retailer in the United States. 
    Target makes itself a preferred shopping destination by offering outstanding value, 
    inspiration, innovation and an exceptional guest experience that no other retailer can deliver. 
    This particular business case focuses on the operations of Target in Brazil 
    and provides insightful information about 100,000 orders placed between 2016 and 2018.  
    The dataset offers a comprehensive view of various dimensions including 
    the order status, price, payment and freight performance, customer location, product attributes, and customer reviews.
    By analyzing this extensive dataset, it becomes possible to gain valuable insights into Target's operations in Brazil. 
    The information can shed light on various aspects of the business, such as order processing, 
    pricing strategies, payment and shipping efficiency, customer demographics, product characteristics, 
    and customer satisfaction levels.

**Dataset:** https://drive.google.com/drive/folders/1TGEc66YKbD443nslRi1bWgVd238gJCnb?usp=sharing

The data is available in 8 different csv files:
customers.csv
geolocation.csv
order_items.csv
payments.csv
reviews.csv
orders.csv
products.csv
sellers.csv

The column description for these csv files is given below.
customers.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| customer_id               | Unique customer identifier       |
| customer_unique_id        | Unique customer (anonymized)     |
| customer_zip_code_prefix  | First five digits of zip code    |
| customer_city             | Customer city                    |

geolocation.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| geolocation_zip_code_prefix | Zip code prefix |
| geolocation_lat | Latitude |
| geolocation_lng | Longitude |
| geolocation_city | City name |
| geolocation_state | State (Acronym) |

order_items.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| order_id | Unique order identifier |
| order_item_id | Line item number within each order |
| product_id | Product identifier |
| seller_id | Seller identifier |
| shipping_limit_date | Deadline to ship order item (UTC) |
| price | Price paid for product |
| freight_value | Shipping fee paid |

order_payments.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| order_id | Unique order identifier |
| payment_sequential | Payment lot number for order |
| payment_type | Payment method |
| payment_installments | Number of installments |
| payment_value | Payment value |

order_reviews.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| review_id | Unique review identifier |
| order_id | Related order |
| review_score | Rating score (1-5) |
| review_comment_title | Title/summary of review |
| review_comment_message | Full review text |
| review_creation_date | Date review was written |
| review_answer_timestamp | Date/time of review reply |

orders.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| order_id | Unique order identifier |
| customer_id | Linked customer |
| order_status | Order status |
| order_purchase_timestamp | Purchase date (UTC) |
| order_approved_at | Payment approval date (UTC) |
| order_delivered_carrier_date | Carrier pickup date (UTC) |
| order_delivered_customer_date | Delivery date to customer (UTC) |
| order_estimated_delivery_date | Estimated delivery (UTC) |

products.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| product_id | Unique product identifier |
| product_category_name | Category (in Portuguese) |
| product_name_length | Product name length |
| product_description_length | Product description length |
| product_photos_qty | Number of product photos |
| product_weight_g | Product weight (grams) |
| product_length_cm | Product length (cm) |
| product_height_cm | Product height (cm) |
| product_width_cm | Product width (cm) |

sellers.csv
| Column Name               | Description                      |
|---------------------------|----------------------------------|
| seller_id | Unique seller identifier |
| seller_zip_code_prefix | First five digits of seller zip code |
| seller_city | City |
| seller_state | State (Acronym) |

<img width="2045" height="1232" alt="image" src="https://github.com/user-attachments/assets/b2ee8610-f6fb-440d-9fa3-19a5ee128455" />

🚀 **Welcome to the Target Data Analysis project!** 🎉

**Problem Statement:**
  
    Assuming you are a data analyst/ scientist at Target, you have been assigned the task of analyzing 
    the given dataset to extract valuable insights and provide actionable recommendations. 

**Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:**  

    A) Data type of all columns in the “customers” table.  

    B) Get the time range between which the orders were placed.  

    C) Count the Cities & States of customers who ordered during the given period.  

**In-depth Exploration:**  

    A) Is there a growing trend in the no. of orders placed over the past years?  

    B) Can we see some kind of monthly seasonality in terms of the no. of orders being placed?  

    C) During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)  
    | hours | timings |
    |--------|-------|
    | 0-6 hrs :| Dawn |
    | 7-12 hrs :| Mornings |
    | 13-18 hrs :| Afternoon |
    | 19-23 hrs :| Night |

**Evolution of E-commerce orders in the Brazil region:**  

    A. Get the month on month no. of orders placed in each state.  

    B. How are the customers distributed across all the states?  

**Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.**  

    A. Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).  

    B. You can use the “payment_value” column in the payments table to get the cost of orders.  

    C. Calculate the Total & Average value of order price for each state.  

    D. Calculate the Total & Average value of order freight for each state.  

**Analysis based on sales, freight and delivery time.**  

    A) Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.  
    Also, calculate the difference (in days) between the estimated & actual delivery date of an order.  
    Do this in a single query.  
    You can calculate the delivery time and the difference between the estimated 
    & actual delivery date using the given formula:  
   
    => time_to_deliver = order_delivered_customer_date - order_purchase_timestamp  
    => diff_estimated_delivery = order_estimated_delivery_date - order_delivered_customer_date  

    B) Find out the top 5 states with the highest & lowest average freight value.  

    C) Find out the top 5 states with the highest & lowest average delivery time.  

    D) Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.  

    E) You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.  

**Analysis based on the payments:**  

    A) Find the month on month no. of orders placed using different payment types.  

    B) Find the no. of orders placed on the basis of the payment installments that have been paid.  

