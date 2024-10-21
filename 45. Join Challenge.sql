USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111111111111111111111111
SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.departments d INNER JOIN hcm.employees e
ON d.department_id = e.department_id;

--22222222222222222222222222222222222222222222222222222222222222222222
SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
--FROM hcm.departments d LEFT OUTER JOIN hcm.employees e  ??????????????????????????????????????????????
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON d.department_id = e.department_id;

--OR

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.departments d RIGHT OUTER JOIN hcm.employees e 
ON d.department_id = e.department_id;

--333333333333333333333333333333333333333333333333333333333333333333333
SELECT d.department_name, COUNT(*) AS total_number_of_employees
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON d.department_id = e.department_id
GROUP BY d.department_name; --?????????????????????????????????????

SELECT *
FROM hcm.departments d;
