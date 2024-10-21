USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111111111111111111111111111111111111
SELECT product_id, product_name,
CASE WHEN discontinued = 0 THEN 'No'
	 WHEN discontinued = 1 THEN 'Yes'
	 ELSE 'Unknown'
	 END AS discontinued
FROM oes.products

--2222222222222222222222222222222222222222222222222222222222222222222222222222222
SELECT product_id, product_name, list_price,
CASE WHEN list_price < 50 THEN 'Low'
	 WHEN list_price >= 50 AND list_price < 250 THEN 'Medium'
	 WHEN list_price >= 250 THEN 'High'
	 ELSE 'Unknown'
	 END AS price_grade
FROM oes.products

--3333333333333333333333333333333333333333333333333333333333333333333333333333333
SELECT order_id, order_date, shipped_date,
CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
	 WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
	 WHEN shipped_date IS NULL THEN 'Not yet shipped'
	 ELSE 'Unknown'
	 END AS shipping_status
	 FROM oes.orders
	 
--4444444444444444444444444444444444444444444444444444444444444444444444444444444
SELECT shipping_status, COUNT(shipping_status) AS  shipping_status_count
FROM  (
				SELECT 
				CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
				WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
				WHEN shipped_date IS NULL THEN 'Not yet shipped'
				ELSE 'Unknown'
				END AS shipping_status
				FROM oes.orders 
		) new_table
GROUP BY shipping_status;

--or

WITH new_table
AS
(
	SELECT 
	CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
	WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
	WHEN shipped_date IS NULL THEN 'Not yet shipped'
	ELSE 'Unknown'
	END AS shipping_status
	FROM oes.orders 
)
SELECT shipping_status, COUNT(shipping_status) AS shipping_status_count
FROM new_table
GROUP BY shipping_status;
