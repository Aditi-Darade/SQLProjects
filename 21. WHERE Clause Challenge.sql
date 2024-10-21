USE SAMPLEDB
GO

--11111111111111111111111111111111111111111111111111111111111
SELECT *
FROM oes.products
WHERE list_price > 100;

--222222222222222222222222222222222222222222222222222222222222
SELECT *
FROM oes.orders
WHERE shipped_date IS NULL;

--33333333333333333333333333333333333333333333333333333333333
SELECT *
FROM oes.orders
WHERE order_date = '2020-02-26';

--OR

SELECT *
FROM oes.orders
WHERE order_date = '20200226';

--4444444444444444444444444444444444444444444444444444444444444
SELECT *
FROM oes.orders
WHERE order_date >= '2020-01-01';
