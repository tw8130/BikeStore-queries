-- Write a query to retrieve the list of orders along with the customer name and staff name for each order.
SELECT o.order_id, c.first_name, s.first_name
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.staffs s ON o.staff_id = s.staff_id;

-- Create a view that returns the total quantity and sales amount for each product.
-- CREATE VIEW production.products.product_sales AS
-- SELECT p.product_id, p.product_name, SUM(od.quantity) AS total_quantity, SUM(od.quantity * od.unit_price) AS sales_amount
-- FROM production.products p,sales.orders od,production.stocks 
-- JOIN order_status od ON p.product_id = od.product_id
-- GROUP BY p.product_id, p.product_name;

-- Write a stored procedure that accepts a customer ID and returns the total number of orders placed by that customer.
-- CREATE PROCEDURE GetTotalOrdersForCustomer (IN customer_id INT, OUT total_orders INT)
-- BEGIN
--   SELECT COUNT(*) INTO total_orders
--   FROM sales.orders
--   WHERE customer_id = customer_id;
-- END;


-- Write a query to find the top 5 customers who have placed the most orders.
SELECT c.customer_id, c.first_name, COUNT(*) AS total_orders
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_orders DESC
LIMIT 5

-- Create a view that shows the product details along with the total sales quantity and revenue for each product.
CREATE VIEW product_revenue AS
SELECT p.product_id, p.product_name, p.list_price, SUM(od.quantity) AS total_quantity, SUM(od.quantity * od.list_price) AS total_revenue
FROM production.products p,sales.order_items od
JOIN sales.order_items ods ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name, p.list_price;

