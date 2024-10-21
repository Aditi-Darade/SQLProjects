USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
SELECT *
FROM oes.warehouses;

CREATE NONCLUSTERED INDEX index_location_id
ON oes.warehouses (location_id) INCLUDE (warehouse_name);

--22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
SELECT *
FROM oes.products;

CREATE UNIQUE INDEX unique_index_product_name
ON oes.products (product_name);

--33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
SELECT order_id, order_date
FROM oes.orders
WHERE order_date >= '2019-01-01' AND order_date <= '2019-12-31'

--44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
SELECT *
FROM oes.orders

CREATE NONCLUSTERED INDEX index_shipped_date
ON oes.orders (shipped_date)
WHERE shipped_date IS NULL;

--55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

SELECT customer_id, first_name, last_name, email, street_address
FROM oes.customers
WHERE first_name LIKE 'Vi%' AND last_name = 'Jones'

CREATE NONCLUSTERED INDEX index_first_name_last_name_include_email_street_address
ON oes.customers (first_name, last_name) INCLUDE (email, street_address)