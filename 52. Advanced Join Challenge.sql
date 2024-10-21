USE SAMPLEDB
GO 

--11111111111111111111111111111111111111111111111111
SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM hcm.employees e LEFT JOIN hcm.employees m
ON e.manager_id = m.employee_id; 
--ON e.employee_id =  m.manager_id; 

SELECT *
FROM hcm.employees ;

--22222222222222222222222222222222222222222222222222222222 return all products at each warehouse
SELECT p.product_id, p.product_name, w.warehouse_id, w.warehouse_name, i.quantity_on_hand
FROM oes.products p INNER JOIN oes.inventories i 
ON p.product_id = i.product_id  
INNER JOIN oes.warehouses w
ON  i.warehouse_id = w.warehouse_id;  

SELECT *
FROM oes.products;
SELECT *
FROM oes.inventories;
SELECT *
FROM oes.warehouses;

--333333333333333333333333333333333333333333333333333333333333333
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title, e.state_province
FROM hcm.employees e LEFT JOIN hcm.countries c
ON e.country_id = c.country_id
LEFT JOIN hcm.departments d
ON e.department_id = d.department_id
LEFT JOIN hcm.jobs j
ON e.job_id = j.job_id
WHERE c.country_name = 'Australia';

SELECT *
FROM hcm.employees 
SELECT *
FROM hcm.departments
SELECT *
FROM hcm.countries 
SELECT *
FROM hcm.jobs

--4444444444444444444444444444444444444444444444444444444444444444 total quantity ordered of each product in each category
SELECT c.category_name, p.product_name, SUM (i.quantity) AS quantity --i.quantity
FROM oes.order_items i JOIN oes.products p
ON i.product_id = p.product_id
JOIN oes.product_categories c
ON p.category_id = c.category_id
GROUP BY i.product_id, c.category_name, p.product_name 
ORDER BY c.category_name ASC, p.product_name ASC;

SELECT *
FROM oes.orders
SELECT *
FROM oes.order_items
SELECT *
FROM oes.products
SELECT *
FROM oes.product_categories

--5555555555555555555555555555555555555555555555555555555555555555555555 total quantity ordered of each product in each category
SELECT c.category_name, p.product_name, ISNULL(SUM (i.quantity), 0) AS quantity --i.quantity
FROM oes.products p LEFT JOIN oes.order_items i
ON i.product_id = p.product_id
LEFT JOIN oes.product_categories c
ON p.category_id = c.category_id
GROUP BY i.product_id, c.category_name, p.product_name 
ORDER BY c.category_name ASC, p.product_name ASC;