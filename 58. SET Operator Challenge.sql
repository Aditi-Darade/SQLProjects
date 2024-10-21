USE SAMPLEDB
GO

--11111111111111111111111111111111111111111111111111111111111111111111
SELECT *
FROM bird.california_sightings
UNION ALL
SELECT *
FROM bird.arizona_sightings;

--OR

SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date
FROM bird.california_sightings
UNION ALL
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date
FROM bird.arizona_sightings;

--2222222222222222222222222222222222222222222222222222222222222222222222222222222222222

SELECT scientific_name
FROM bird.california_sightings
UNION 
SELECT scientific_name
FROM bird.arizona_sightings;

--333333333333333333333333333333333333333333333333333333333333333333333333333333333333333

SELECT scientific_name, 'California' AS state_name
FROM bird.california_sightings
UNION 
SELECT scientific_name, 'Arizona' AS state_name
FROM bird.arizona_sightings
ORDER BY state_name ASC , scientific_name ASC;

--4444444444444444444444444444444444444444444444444444444444444444444444444444444
SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date, 'California' AS state_name
FROM bird.california_sightings
UNION ALL
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date, 'Arizona' AS state_name
FROM bird.arizona_sightings
UNION ALL
SELECT observation_id, NULL AS common_name, scientific_name, locality, CAST (sighting_datetime AS DATE), 'Florida' AS state_name
FROM bird.florida_sightings;

--5555555555555555555555555555555555555555555555555555555555555555555555555555555555555
SELECT customer_id
FROM oes.orders
INTERSECT 
SELECT customer_id
FROM oes.customers;

--6666666666666666666666666666666666666666666666666666666666666666666666666666666666666
SELECT product_id
FROM oes.products
EXCEPT
SELECT product_id
FROM oes.inventories;
 

