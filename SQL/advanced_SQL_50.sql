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
