USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111
SELECT department_id,
	COUNT(*) AS total_number_of_employees
FROM hcm.employees
GROUP BY department_id;

--22222222222222222222222222222222222222222222222
SELECT department_id,
	AVG(salary) AS average_salary_in_each_department 
FROM hcm.employees
GROUP BY department_id
ORDER BY average_salary_in_each_department DESC;

--33333333333333333333333333333333333333333333333
SELECT warehouse_id,
	SUM(quantity_on_hand) AS quantity_on_hand_at_each_warehouse 
FROM oes.inventories
GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000;

--4444444444444444444444444444444444444444444444444444444444444444444444
SELECT locality,
	MAX(date_of_count) AS most_recent_populations_date_of_count
FROM bird.antarctic_populations
GROUP BY locality;

--5555555555555555555555555555555555555555555555555555555555555555555555
SELECT locality,
	species_id,	
	MAX(date_of_count) AS most_recent_populations_date_of_count
FROM bird.antarctic_populations
GROUP BY locality, species_id;
