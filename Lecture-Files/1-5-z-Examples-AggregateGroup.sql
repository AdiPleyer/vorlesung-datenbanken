--- overall statistics of hotel ratings
select count(*), min(rating), max(rating), avg(rating), sum(rating) from hotels;

--- statistics of hotel ratings per country (only countries with at least 2 hotels)
select * 
       from (select country, count(*) as anzahl, min(rating) as minr, max(rating) as maxr, 
                             avg(rating) as avgr, sum(rating) from hotels group by country) as stats
       where stats.anzahl >= 2;
       
--- alternative solution
select country, count(*), min(rating), max(rating), avg(rating), sum(rating) 
       from hotels 
       group by country
       having count(*) >= 2;
       
       

--- find the country (countries) with the highest average hotel rating
select * 
       from (select country, avg(rating) as avgr from hotels group by country) as stats
       where stats.avgr >= (select max(avgr) from (select country, avg(rating) as avgr from hotels group by country) foo);

--- alternative solution using CTE
with country_avg as (
    select country, avg(rating) as avgr 
    from hotels 
    group by country
)
select * 
       from country_avg
       where avgr >= (select max(avgr) from country_avg);

--- alternative solution with subquery in HAVING     
select country, avg(rating) as avgr 
       from hotels 
       group by country
       having avg(rating) >= (select max(avgr) from (select country, avg(rating) as avgr from hotels group by country) foo);
       
       