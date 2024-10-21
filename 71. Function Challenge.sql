USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
SELECT employee_id, first_name, last_name, CONCAT (first_name + ' ' , last_name) AS employees_name
FROM hcm.employees

--or 

SELECT employee_id, first_name, last_name, first_name + ' ' + last_name AS employees_name
FROM hcm.employees

--222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
SELECT employee_id, first_name, last_name, CONCAT (first_name + ' ' , ISNULL(middle_name + ' ', '') , last_name) AS employees_name
FROM hcm.employees

--3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
SELECT scientific_name, LEFT(scientific_name, CHARINDEX (' ', scientific_name)-1) AS genus_name
FROM bird.antarctic_species;

--4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
SELECT scientific_name, SUBSTRING(scientific_name, CHARINDEX (' ', scientific_name)+ 1, LEN(scientific_name)) AS species_name
FROM bird.antarctic_species;

--5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
SELECT employee_id, first_name, last_name, birth_date, DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) AS employee_age
FROM hcm.employees

--66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
SELECT order_id, order_date, DATEADD(day, 7, order_date) AS estimated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL

--777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
SELECT AVG(DATEDIFF(day, o.order_date, o.shipped_date)) AS days_taken_to_ship_order, s.company_name
FROM oes.orders o LEFT JOIN oes.shippers s
ON o.shipper_id = s.shipper_id
GROUP BY s.company_name;