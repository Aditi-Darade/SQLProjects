USE SAMPLEDB
GO

SELECT *
FROM dbo.emp

UPDATE dbo.emp
SET last_name = 'Greenbank'
WHERE emp_int = 2;