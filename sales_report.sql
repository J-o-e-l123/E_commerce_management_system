-- Monthly Sales Report
SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(oi.quantity * oi.price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

-- Top Customers by Total Spending
SELECT TOP 10
    c.customer_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- Best-Selling Categories
SELECT 
    cat.category_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM categories cat
JOIN products p ON cat.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY cat.category_name
ORDER BY total_quantity_sold DESC;