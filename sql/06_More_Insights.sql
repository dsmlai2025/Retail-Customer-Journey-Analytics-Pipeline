# More Insights

select count(*) as no_of_wrong_products_delivered 
from `target_data.order_reviews`
where review_comment_title like "%wrong%" 
     or review_comment_title like "%incorrect%" 
     or review_comment_title like "%Wrong%"
     or review_comment_title like "%ifferent%" ;


select count(*) as defective_product 
from `Target.order_reviews`
where lower(review_comment_title) like "%broke%" 
     or lower(review_comment_title) like "%defect%";


select count(*) as delayed_delivery 
from `Target.order_reviews`
where LOWER(review_comment_title) like "%delay%"
     or LOWER(review_comment_title) like "%late%"

# Get states with 1 star reviews and calculate its percentage.

select T.customer_state,T.review_score,T.number_of_reviews, T.total_reviews, 
ROUND((T.number_of_reviews*100/T.total_reviews),2) as perc_reviews
from(
select cust.customer_state, 
 rev.review_score, count(*) number_of_reviews,
   SUM(count(*)) over (partition by cust.customer_state) as total_reviews
from `Target.order_reviews` rev
inner join `Target.orders` ord
on rev.order_id = ord.order_id
inner join `Target.customers` cust
on cust.customer_id = ord.customer_id
group by 1, 2)T
where T.review_score = 1
order by 5 desc;


# Get states with 5 star reviews and calculate its percentage.

select T.customer_state,T.review_score,T.number_of_reviews, T.total_reviews, 
ROUND((T.number_of_reviews*100/T.total_reviews),2) as perc_reviews
from(
select cust.customer_state, 
 rev.review_score, count(*) number_of_reviews,
 SUM(count(*)) over (partition by cust.customer_state) as total_reviews
from `Target.order_reviews` rev
inner join `Target.orders` ord
on rev.order_id = ord.order_id
inner join `Target.customers` cust
on cust.customer_id = ord.customer_id
group by 1, 2)T
where T.review_score = 5
order by 5 desc;


# Get states with top Avg reviews.

select cust.customer_state, ROUND(AVG(rev.review_score),2) as avg_rating
from `Target.order_reviews` rev
inner join `Target.orders` ord
on rev.order_id = ord.order_id
inner join `Target.customers` cust
on cust.customer_id = ord.customer_id
group by cust.customer_state
order by 2 desc;


