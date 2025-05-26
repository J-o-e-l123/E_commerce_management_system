-- Test: Check if stock decreases after order insertion
DECLARE @prod_id INT = 1;
DECLARE @initial_stock INT;

SELECT @initial_stock = stock FROM products WHERE product_id = @prod_id;

-- Insert a new order manually
INSERT INTO orders (customer_id, status) VALUES (1, 'Pending');
DECLARE @new_order_id INT = SCOPE_IDENTITY();

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (@new_order_id, @prod_id, 2, 799.99);

-- Verify updated stock
SELECT stock FROM products WHERE product_id = @prod_id;
-- Should be @initial_stock - 2

-- Test: Ensure unique email constraint
BEGIN TRY
    INSERT INTO customers (first_name, last_name, email, password_hash, phone, role_id)
    VALUES ('John', 'Doe', 'ava@example.com', 'hash123', '1234567890', 1);
    PRINT 'Test Failed: Duplicate email should not be allowed';
END TRY
BEGIN CATCH
    PRINT 'Test Passed: Duplicate email blocked as expected';
END CATCH;