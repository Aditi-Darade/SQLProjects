USE SAMPLEDB
GO

--1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
SELECT *
FROM hcm.employees

ALTER TABLE hcm.employees
ADD termination_date DATE;

--22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
SELECT *
FROM oes.customers

ALTER TABLE oes.customers
ALTER COLUMN first_name NVARCHAR(60);

ALTER TABLE oes.customers
ALTER COLUMN last_name NVARCHAR(60);

--33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
sp_rename 'SAMPLEDB.oes.customers.phone', 'main_phone', 'COLUMN';