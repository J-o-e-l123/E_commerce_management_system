-- Indexes for performance improvement
CREATE NONCLUSTERED INDEX IX_customers_customer_id ON customers(customer_id);
CREATE NONCLUSTERED INDEX IX_orders_customer_id ON orders(customer_id);
CREATE NONCLUSTERED INDEX IX_order_items_order_id ON order_items(order_id);
CREATE NONCLUSTERED INDEX IX_products_category_id ON products(category_id);
CREATE NONCLUSTERED INDEX IX_payments_order_id ON payments(order_id);
CREATE NONCLUSTERED INDEX IX_orders_order_date ON orders(order_date);