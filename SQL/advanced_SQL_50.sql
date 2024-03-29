-- CUSTOMERS WHO BOUGHT PRODUCTS A AND B BUT NOT C
/* Table: Customers
+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
customer_id is the column with unique values for this table.
customer_name is the name of the customer.

Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+
order_id is the column with unique values for this table.
customer_id is the id of the customer who bought the product "product_name".

Write a solution to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them to purchase this product.
Return the result table ordered by customer_id. */

SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN (
   SELECT customer_id 
   FROM Orders
   GROUP BY customer_id
   HAVING SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
      AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0
      AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
)
ORDER BY customer_id;

-- HIGHEST GRADE FOR EACH STUDENT
/* Table: Enrollments
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| course_id     | int     |
| grade         | int     |
+---------------+---------+
(student_id, course_id) is the primary key (combination of columns with unique values) of this table.
grade is never NULL.

Write a solution to find the highest grade with its corresponding course for each student. In case of a tie, you should find the course with the smallest course_id.
Return the result table ordered by student_id in ascending order. */

SELECT 
  student_id, 
  course_id, 
  grade 
FROM 
  (
    SELECT 
      student_id, 
      course_id, 
      grade, 
      DENSE_RANK() OVER (
        PARTITION BY student_id 
        ORDER BY 
          grade DESC, 
          course_id ASC
      ) AS rnk 
    FROM 
      Enrollments
  ) AS ranked 
WHERE 
  rnk = 1 
ORDER BY 
  student_id;

-- COMBINE TWO TABLES
/* Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.

Table: Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.

Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.*/

Select 
 p.firstname, 
 p.lastname, 
 a.city, 
 a.state 
from 
 person p 
 left join address a on p.personid = a.personid;

-- SELLERS WITH NO SALES

/*Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+
customer_id is the column with unique values for this table.
Each row of this table contains the information of each customer in the WebStore.

Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| sale_date     | date    |
| order_cost    | int     |
| customer_id   | int     |
| seller_id     | int     |
+---------------+---------+
order_id is the column with unique values for this table.
Each row of this table contains all orders made in the webstore.
sale_date is the date when the transaction was made between the customer (customer_id) and the seller (seller_id).

 Table: Seller
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| seller_id     | int     |
| seller_name   | varchar |
+---------------+---------+
seller_id is the column with unique values for this table.
Each row of this table contains the information of each seller.

Write a solution to report the names of all sellers who did not make any sales in 2020.
Return the result table ordered by seller_name in ascending order.*/

SELECT seller_name 
FROM seller 
WHERE seller_id NOT IN (
    SELECT DISTINCT seller_id 
    FROM orders 
    WHERE EXTRACT(YEAR FROM sale_date) = 2020
)
ORDER BY seller_name ASC;

