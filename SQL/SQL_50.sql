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
