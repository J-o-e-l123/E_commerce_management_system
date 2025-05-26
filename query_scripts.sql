-- Customer Purchase History
SELECT 
    c.customer_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.price) AS total_amount,
    o.status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.status
ORDER BY o.order_date DESC;

-- Top Selling Products
SELECT TOP 10
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;