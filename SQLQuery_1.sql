-- Write a query to retrieve the list of orders along with the customer name and staff name for each order.
-- SELECT o.order_id, c.first_name, s.first_name
-- FROM sales.orders o
-- JOIN sales.customers c ON o.customer_id = c.customer_id
-- JOIN sales.staffs s ON o.staff_id = s.staff_id;

-- Create a view that returns the total quantity and sales amount for each product.
-- CREATE VIEW sales.total_sales_quantity 
-- AS
--     SELECT product_id,SUM(quantity) AS total_quantity, SUM((1-discount) * list_price) AS sales_amount
--     FROM sales.order_items 
--     GROUP BY product_id;

-- Write a stored procedure that accepts a customer ID and returns the total number of orders placed by that customer.
-- CREATE PROCEDURE sales.get_total_orders (@customer_id INT )
-- AS
-- BEGIN
--   SELECT customer_id,SUM(quantity) AS total_orders
--   FROM sales.orders o INNER JOIN  sales.order_items i ON o.order_id=i.order_id
--   WHERE customer_id = @customer_id
--   GROUP BY customer_id
-- END;
-- EXEC sales.get_total_orders 259
-- DROP PROCEDURE sales.get_total_orders

-- Write a query to find the top 5 customers who have placed the most orders.
SELECT TOP 5 c.customer_id, c.first_name, SUM(quantity) AS total_orders
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items t ON t.order_id=o.order_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_orders DESC;


-- Create a view that shows the product details along with the total sales quantity and revenue for each product.

-- CREATE VIEW product_details_revenue AS
-- CREATE VIEW product_details_with_sales_quantity_and_revenue
-- AS
-- SELECT
 
--   p.product_name,
--   od.product_id,SUM(quantity) AS total_quantity, SUM((1-discount) * od.list_price) AS sales_amount
-- FROM
--   production.products p
-- INNER JOIN
--   sales.order_items od ON p.product_id = od.product_id
--   GROUP BY
--  od.product_id,p.product_name;
