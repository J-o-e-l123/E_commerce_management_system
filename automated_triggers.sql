-- Trigger: AdjustStockInsteadOfInsert
CREATE TRIGGER AdjustStockInsteadOfInsert
ON order_items
INSTEAD OF INSERT
AS
BEGIN
    BEGIN TRANSACTION;

    -- Insert into order_items
    INSERT INTO order_items (order_id, product_id, quantity, price)
    SELECT order_id, product_id, quantity, price FROM inserted;

    -- Update stock accordingly
    UPDATE p
    SET p.stock = p.stock - i.quantity
    FROM products p
    JOIN inserted i ON p.product_id = i.product_id;

    COMMIT TRANSACTION;
END;