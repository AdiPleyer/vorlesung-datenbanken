
--- a. hotels in countries with only hotels with rating >= 4
SELECT hotelName, Country, Rating FROM Hotels as h1
    WHERE NOT EXISTS
        (SELECT * FROM Hotels as h2
            WHERE h2.Country = h1.Country
            and (h2.Rating < 4 or h2.rating is null))
        and h1.country is not null;
 