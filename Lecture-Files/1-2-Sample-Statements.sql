---
--- the following statements are explained in 1-2
--- they partly differ in detail 
---

SELECT * FROM hotels;

SELECT HotelName, Country 
	FROM Hotels;

SELECT DISTINCT HotelName, Country FROM hotels;

SELECT * FROM Hotels 
	WHERE Country = 'Germany';

SELECT * FROM Hotels 
	WHERE (Country = 'Germany' AND
					Rating = 4)
			OR (Country = 'France' AND 
					Rating = 2);
                    
SELECT * FROM hotels 
	WHERE Country = 'Germany'
	ORDER BY City;

SELECT HotelName, City as Stadt 
	FROM Hotels 
	WHERE Country = 'Germany';

SELECT h.HotelName, h.City, a.Airport
	FROM Hotels h, Airports a 
	WHERE h.City = a.City;

SELECT h.HotelName, h.City, a.Airport
	FROM Hotels h 
	JOIN Airports a ON h.City = a.City;

SELECT h.HotelName, h.City, a.Airport
	FROM Hotels h 
	JOIN Airports a USING(City);

// which ratings in which countries
SELECT  Rating, Country, count(*) 
	FROM hotels 
	GROUP BY Rating, Country
	ORDER BY Country, Rating;

// which rankings in which countries
SELECT  Rating, Country, count(*) 
	FROM hotels 
	GROUP BY Rating, Country
    HAVING count(*) > 1
	ORDER BY count(*) DESC;
