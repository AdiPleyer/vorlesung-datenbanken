--- Solution for exercise 2 Hotels

--- Hotels a: List all hotel names and their cities from the Hotels table.

select hotelname, city
    from hotels h1;

--- Hotels b: Find all hotels located in the city of ‘Bangalore’.

select *
    from hotels
    where city = 'Bangalore';

--- Hotels c: Retrieve the names of hotels that have a rating greater than 3.

select hotelname
    from hotels
    where rating > 3;

--- Hotels d: Show all hotels that offer WiFi (‘free’).

select *
    from hotels
    where wifi = 'free';

--- Hotels e: Display the hotel name, city, and rating of all hotels sorted by rating in descending order.

select hotelname, city, rating
    from hotels
    order by rating desc;

--- Hotels f: Find the number of hotels in each city.

select city, count(*) as hotel_count
    from hotels
    group by city;

--- Hotels g: Increase the rating of all hotels in ‘Wiesloch’ by 1, but only if their current rating is less than 5.

update hotels
    set rating = rating + 1
    where city = 'Wiesloch' and rating < 5;

--- Hotels h: Add a new hotel record named 'BlueSkyHotel' located in 'London', 'UK', with a rating of 4 and WiFi ‘free’.

insert into hotels (uniqueName, hotelname, city, country, rating, wifi)
    values ('UK-BlueSkyHotel', 'BlueSkyHotel', 'London', 'UK', 4, 'free');

--- Hotels i: Delete all hotels with a rating less than 2.

delete from hotels
    where rating < 2;

--- Hotels j: Find all countries that have hotels offering WiFi, without duplicates.

select distinct country
    from hotels
    where wifi = 'free';

--- Hotels k: List all hotels in countries with only hotels with rating >= 4

select hotelName, Country, Rating
    from Hotels h1
    where Country in (
        select Country
            from Hotels h2
            group by Country
            having min(Rating) >= 4
    );

--- Hotel k alternative: hotels in countries with only hotels with rating >= 4, cover null values
SELECT hotelName, Country, Rating FROM Hotels as h1
    WHERE NOT EXISTS
        (SELECT * FROM Hotels as h2
            WHERE h2.Country = h1.Country
            and (h2.Rating < 4 or h2.rating is null))
        and h1.country is not null;
 