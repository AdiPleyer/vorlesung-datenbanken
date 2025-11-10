--- #76 demo on null values

--- backup original table to save the ratings
drop table if exists HotelsBackup;
create table HotelsBackup as (select * from Hotels) with data;

select * from Hotels;

--- set some ratings to null and zero
update hotels set rating = null
    where hotelName like '%Hotel%' or hotelName like '%Inn'
    returning *;
update hotels set rating = 0 
    where not (hotelName like '%Hotel%' or hotelName like '%Inn')
          and not (hotelName like '%a%')
    returning *;

select * from Hotels;

--- play with nulls and zeros

select avg(rating) from Hotels;
select avg(rating) from Hotels where rating is not null;
select avg(rating) from Hotels where rating > 0;

--- 1
SELECT * FROM hotels;

--- 2 – equivalent to 1
SELECT * FROM hotels WHERE (Rating = 5) OR NOT (Rating = 5) OR Rating IS NULL;

--- 3
SELECT * FROM hotels WHERE (Rating = 5) OR NOT (Rating = 5);

--- 4 – equivalent to 3
SELECT * FROM hotels WHERE Rating IS NOT NULL;


SELECT Count(Rating) FROM hotels;
SELECT Count(DISTINCT Rating) FROM hotels;

--- Expressions with NULL in data
SELECT *, 10 * Rating FROM hotels;
SELECT *, hotelName || ' - a ' || Rating || '-star hotel' FROM hotels;


--- Aggregate functions with NULL in data
SELECT Count(Rating) FROM hotels;
SELECT Count(*) FROM hotels;
SELECT AVG(Rating) FROM hotels;
SELECT AVG(Rating) FROM hotels where Rating IS NOT NULL;

--- Comparisons with NULL in data
SELECT hotelName, Rating FROM hotels WHERE Rating > 0;


--- restore original Ratings
update Hotels h
    set rating = (select rating from HotelsBackup hb where hb.uniquename = h.uniquename)
    returning *;
