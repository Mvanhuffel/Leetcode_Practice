-- Write a solution to find the ids of products that are both low fat and recyclable.
select product_id from products
where low_fats = 'Y' and recyclable = 'Y' ; -- low_fats and recyclable are enum Type.

-- Find the names of the customer that are not referred by the customer with id = 2.
select name from customer
where referee_id != 2 or referee_id is null;

-- A country is big if: it has an area of at least three million (i.e., 3000000 km2), or it has a population of at least twenty-five million (i.e., 25000000).
-- Write a solution to find the name, population, and area of the big countries.
select name, population, area
from world
where area >= 3000000 
union
select name, population, area
from world
where population >= 25000000;

-- Write a solution to find all the authors that viewed at least one of their own articles. Order by ascending.
Return the result table sorted by id in ascending order.
select distinct author_id as id
from views
where author_id = viewer_id
order by id asc;

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
select tweet_id
from Tweets
where length(content) > 15;

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
select emp.name, uni.unique_id
from employees AS emp
left join EmployeeUNI AS uni
on emp.id = uni.id;

-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
select P.product_name, S.year, S.price
from sales S
inner join product P
on S.product_id = P.product_id;

-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
select V.customer_id, COUNT(V.visit_id) as count_no_trans
from Visits V
left join Transactions T on V.visit_id = T.visit_id
where T.transaction_id is null
group by V.customer_id;

-- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
select w1.id
from weather w1, weather w2
where datediff(w1.recordDate, w2.recordDate) = 1
and w1.temperature > w2.temperature;
