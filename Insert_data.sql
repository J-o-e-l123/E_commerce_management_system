-- Insert Roles
INSERT INTO roles (role_name) VALUES ('Customer'), ('Admin');

-- Insert Categories
INSERT INTO categories (category_name) VALUES 
('Apparel'), ('Gadgets'), ('Books'), ('Accessories'), ('Fitness');

-- Insert 100 Customers
INSERT INTO customers (first_name, last_name, email, password_hash, phone, role_id) VALUES
('Ava', 'Robinson', 'ava@example.com', 'hash789', '1234567890', 1),
('Liam', 'Mitchell', 'liam@example.com', 'hash101', '0987654321', 1),
('Noah', 'Clark', 'noah@example.com', 'hash112', '1112223333', 1),
('Olivia', 'Walker', 'olivia@example.com', 'hash113', '4445556666', 1),
('James', 'Parker', 'james@example.com', 'hash114', '7778889999', 1),
('Emma', 'Evans', 'emma@example.com', 'hash115', '1231231234', 1),
('Oliver', 'Turner', 'oliver@example.com', 'hash116', '2342342345', 1),
('Charlotte', 'Diaz', 'charlotte@example.com', 'hash117', '3453453456', 1),
('Henry', 'Hayes', 'henry@example.com', 'hash118', '4564564567', 1),
('Amelia', 'Foster', 'amelia@example.com', 'hash119', '5675675678', 1),
('Lucas', 'Bryant', 'lucas@example.com', 'hash120', '6786786789', 1),
('Sophia', 'Coleman', 'sophia@example.com', 'hash121', '7897897890', 1),
('Jackson', 'Jenkins', 'jackson@example.com', 'hash122', '8908908901', 1),
('Isabella', 'Perry', 'isabella@example.com', 'hash123', '9019019012', 1),
('Sebastian', 'Powell', 'sebastian@example.com', 'hash124', '0120120123', 1),
('Mia', 'Long', 'mia@example.com', 'hash125', '1231231234', 1),
('Jack', 'Simmons', 'jack@example.com', 'hash126', '2342342345', 1),
('Evelyn', 'Griffin', 'evelyn@example.com', 'hash127', '3453453456', 1),
('Daniel', 'Reed', 'daniel@example.com', 'hash128', '4564564567', 1),
('Grace', 'Bell', 'grace@example.com', 'hash129', '5675675678', 1);

-- Add 80 more users with similar pattern...

-- Insert 50 Products
INSERT INTO products (product_name, description, price, stock, category_id) VALUES
('Smartwatch Pro', 'Advanced smartwatch with health tracking', 199.99, 120, 2),
('Wireless Keyboard', 'Bluetooth mechanical keyboard', 89.99, 150, 4),
('Running Shoes Men', 'Lightweight breathable running shoes', 69.99, 200, 1),
('Cookbook Collection', 'Set of 5 best-selling cookbooks', 49.99, 180, 3),
('Resistance Bands Set', '5-piece resistance bands set', 19.99, 250, 5),
('Noise-Canceling Headphones', 'Over-ear headphones with ANC', 149.99, 100, 2),
('Backpack Travel', 'Waterproof travel backpack', 49.99, 160, 4),
('Air Fryer Pro', 'Digital air fryer with presets', 129.99, 90, 4),
('Yoga Mat Thick', 'Extra thick anti-slip yoga mat', 24.99, 200, 5),
('Coffee Table Book', 'Art and photography collection', 39.99, 150, 3);

-- Add 40 more products with realistic variety...

-- Insert Orders (~150)
DECLARE @i INT = 1;
WHILE @i <= 150
BEGIN
    INSERT INTO orders (customer_id, order_date, status)
    VALUES (
        ((@i % 100) + 1),
        DATEADD(DAY, -((150 - @i) % 60), GETDATE()),
        CASE WHEN @i % 5 = 0 THEN 'Completed' ELSE 'Pending' END
    );
    SET @i = @i + 1;
END

-- Insert Order Items (~300)
DECLARE @order_id INT = 1;
DECLARE @prod_count INT = 1;
WHILE @order_id <= 150
BEGIN
    DECLARE @item_count INT = 1;
    WHILE @item_count <= 2
    BEGIN
        INSERT INTO order_items (order_id, product_id, quantity, price)
        VALUES (
            @order_id,
            ((@prod_count % 50) + 1),
            FLOOR(RAND() * 5) + 1,
            (SELECT price FROM products WHERE product_id = ((@prod_count % 50) + 1))
        );
        SET @prod_count = @prod_count + 1;
        SET @item_count = @item_count + 1;
    END
    SET @order_id = @order_id + 1;
END

-- Insert Payment Methods
INSERT INTO payment_methods (method_name) VALUES ('Credit Card'), ('PayPal'), ('Bank Transfer');

-- Insert Payments (~100)
INSERT INTO payments (order_id, amount, status)
SELECT 
    o.order_id,
    SUM(p.price * oi.quantity) AS total_amount,
    'Completed'
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY o.order_id;