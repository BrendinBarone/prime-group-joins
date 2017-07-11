-- Get all customers and their addresses.
SELECT * FROM "addresses" JOIN "customers"
ON "customers"."id" = "addresses"."customer_id";
-- Get all orders and their line items.
SELECT * FROM "orders" JOIN "line_items"
ON "orders"."id" = "line_items"."order_id";
-- Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 5;
-- Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 6;
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", count(*) FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "customers"."id" = "orders"."address_id"
GROUP BY "customers"."id", "customers"."first_name", "customers"."last_name";
-- How many customers do we have?
Select count(*) FROM "customers";
-- How many products do we carry?
Select count(*) FROM "products";
-- What is the total available on-hand quantity of diet pepsi?
SELECT sum("on_hand") FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "warehouse_product"."product_id" = 6;
