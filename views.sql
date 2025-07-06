USE ecommerce;

-- 1. View: Basic customer and order summary
CREATE VIEW customer_orders AS
SELECT c.customer_id, c.name, o.order_id, o.order_date, o.status
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id;

-- Usage example
SELECT * FROM customer_orders;

-- 2. View: Product with category name
CREATE VIEW product_with_category AS
SELECT p.product_id, p.product_name, p.price, c.category_name
FROM Product p
LEFT JOIN Category c ON p.category_id = c.category_id;

-- Usage example
SELECT * FROM product_with_category;

-- 3. View: Payment summary per customer
CREATE VIEW customer_payment_summary AS
SELECT c.customer_id, c.name, SUM(p.amount) AS total_paid
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id
JOIN Payment p ON o.order_id = p.order_id
GROUP BY c.customer_id;

-- Usage example
SELECT * FROM customer_payment_summary;

-- 4. View with WHERE clause
CREATE VIEW shipped_orders AS
SELECT * FROM OrderTable
WHERE status = 'Shipped';

-- Usage example
SELECT * FROM shipped_orders;

-- 5. Drop a view (if needed)
-- DROP VIEW shipped_orders;

-- 6. View with WITH CHECK OPTION
CREATE VIEW active_customers_view AS
SELECT * FROM Customer
WHERE address IS NOT NULL
WITH CHECK OPTION;
