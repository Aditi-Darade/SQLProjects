USE SAMPLEDB
GO
--1111111111111111111111111111111111111111111111
SELECT 
	first_name,
	last_name
FROM hcm.employees;

--222222222222222222222222222222222222222222222222
SELECT
	last_name AS customer_last_name,
	city
FROM oes.customers;

--333333333333333333333333333333333333333333333333333
SELECT *
FROM oes.order_items;
