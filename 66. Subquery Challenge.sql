USE SAMPLEDB
GO

--11111111111111111111111111111111111111111111111111111111111111111111111111111

SELECT product_id, product_name, list_price, category_id
FROM oes.products 
WHERE list_price = ( 
						SELECT MIN (list_price)
						FROM oes.products 
					)

--or

SELECT TOP (1) WITH TIES product_id, product_name, list_price, category_id
FROM oes.products 
ORDER BY list_price ASC;

--22222222222222222222222222222222222222222222222222222222222222222222222222
SELECT product_id, product_name, list_price, category_id
FROM oes.products p1
WHERE list_price = (
						SELECT MIN (list_price)
						FROM oes.products p2
						WHERE p2.category_id = p1.category_id
					);

--3333333333333333333333333333333333333333333333333333333333333333333333333333333333
SELECT *
FROM oes.products

SELECT p1.product_id, p1.product_name, p1.list_price, p1.category_id
FROM oes.products p1 
INNER JOIN (
			SELECT MIN(list_price) AS list_price, category_id
			FROM oes.products 
			GROUP BY category_id
			) p2
ON p1.category_id = p2.category_id
AND p1.list_price = p2.list_price;

--4444444444444444444444444444444444444444444444444444444444444444444444
WITH p1 
AS
(
	SELECT MIN(list_price) AS list_price, category_id
	FROM oes.products p
	GROUP BY category_id
)
SELECT p2.product_id, p2.product_name, p1.list_price, p1.category_id
FROM p1 LEFT JOIN oes.products p2 
ON p1.category_id = p2.category_id
AND p1.list_price = p2.list_price;


WITH p1 
AS
(
	SELECT MIN(list_price) AS list_price, category_id
	FROM oes.products p
	GROUP BY category_id
),
p2 AS 
(
	SELECT product_id, product_name, list_price, category_id
	FROM oes.products p
)
SELECT p2.product_id, p2.product_name, p1.list_price, p1.category_id
FROM p1 INNER JOIN p2 
ON p1.category_id = p2.category_id
AND p1.list_price = p2.list_price;

--55555555555555555555555555555555555555555555555555555555555555555555555555555
WITH p1 
AS
(
	SELECT MIN(list_price) AS list_price, category_id
	FROM oes.products p
	GROUP BY category_id
)
SELECT p2.product_id, p2.product_name, p1.list_price, p1.category_id, c.category_name
FROM p1 INNER JOIN oes.products p2 
ON p1.category_id = p2.category_id
AND p1.list_price = p2.list_price
INNER JOIN oes.product_categories c
ON p1.category_id = c.category_id

--66666666666666666666666666666666666666666666666666666666666666

SELECT employee_id, first_name, last_name
FROM hcm.employees 
WHERE employee_id NOT IN (
							SELECT employee_id
							FROM oes.orders	
							WHERE employee_id IS NOT NULL -- OR "employee_id <> NULL"
						 )

--777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777

SELECT employee_id, first_name, last_name
FROM hcm.employees e
WHERE NOT EXISTS (
						SELECT o.employee_id
						FROM oes.orders	o
						WHERE  o.employee_id = e.employee_id
				  )

--888888888888888888888888888888888888888888888888888888888888888888888888888

SELECT *
FROM oes.orders
SELECT *
FROM oes.order_items
SELECT *
FROM oes.products

SELECT customer_id, first_name, last_name, email
FROM oes.customers
WHERE customer_id IN (
						SELECT customer_id
						FROM oes.orders o LEFT JOIN oes.order_items i
						ON o.order_id = i.order_id
						LEFT JOIN oes.products p
						ON i.product_id = p.product_id
						WHERE p.product_name = 'PBX Smart Watch 4'						
					 )