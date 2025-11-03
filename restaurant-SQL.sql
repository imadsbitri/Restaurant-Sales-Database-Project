-- view the menu_items table

select* from menu_items;

-- find the number of items on the menu

select count(*) from menu_items;

-- what are the least and most expensive items on the menu?

select * from menu_items
ORDER BY price;

-- How many italian dishes are on the menu ?

select count(*) from menu_items
where category= "Italian";

-- What are the least and most expensive italian dishes on the menu ?

select * from menu_items
where category= "Italian"
ORDER BY price desc;

-- How many dishes are in each category ?
select category, count(category) from menu_items
group by category;

-- What is the average dishh price within each category ?
select category , avg(price) AS Averrage_price
from menu_items
group by category
order by avg(price) desc;

-- view the order_details table

select * from order_details ;

-- What is the date range of the table?

select min(order_date),max(order_date) from order_details;

-- how many orders were made within this date range ?

Select count(distinct order_id) from order_details;

-- how many items were ordered withi this date range ? 

Select count(*) from order_details;

-- which orders had the most number of items ? 

Select order_id, count(order_id) AS "num_items" from order_details
group by order_id
order by count(order_id) desc;

-- how many orders had more than 12 items ? 

Select count(*) from 

(Select order_id, count(order_id) AS "num_items" 
from order_details
group by order_id
having count(order_id) >12) AS num_orders ;

-- combining the menu_items and order_details tablesinto a single table.

select* from order_details od
left Join menu_items mi on od.item_id= mi.menu_item_id ;

-- what are the least and most ordered items ? what categories were they in ?

select item_name , category ,count( item_name) AS number_of_items_ordered 
from order_details od
left Join menu_items mi on od.item_id= mi.menu_item_id
group by item_name , category;


-- what wee the top 5 orders that spent the most money ?

select order_id, sum(price) AS total_spend
from order_details od
left Join menu_items mi on od.item_id= mi.menu_item_id 
group by order_id
order by total_spend desc
limit 5;

-- view the details of the highest spend order ?

select category ,count(item_id) AS num_items
from order_details od
left Join menu_items mi on od.item_id= mi.menu_item_id 
where order_id=440 
group by category ;

-- view the details of the top 5 highst spend orders 

select category ,count(item_id) AS num_items
from order_details od
left Join menu_items mi on od.item_id= mi.menu_item_id 
where order_id in(440,2075,1957,330,2675)
group by category ;