-- Procedure: CreateNewOrder
CREATE PROCEDURE CreateNewOrder
    @customer_id INT,
    @method_id INT,
    @items NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRANSACTION;

    INSERT INTO orders (customer_id, status)
    VALUES (@customer_id, 'Pending');

    DECLARE @order_id INT = SCOPE_IDENTITY();

    INSERT INTO order_items (order_id, product_id, quantity, price)
    SELECT 
        @order_id,
        j.product_id,
        j.quantity,
        p.price
    FROM OPENJSON(@items)
    WITH (
        product_id INT,
        quantity INT
    ) j
    JOIN products p ON j.product_id = p.product_id;

    COMMIT TRANSACTION;
END;