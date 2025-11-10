--- Examples of Views and Procedures

--- define a view joining hotels and airports
DROP VIEW AIRPORTHOTELS;
CREATE VIEW "AirportHotels" 
    AS SELECT hotels.hotelname, rating, city, hotels.country FROM hotels
        JOIN airports USING (City);

--- use it like a table
select * from airporthotels;

--- re-define the view - might be not exactly compatible
DROP VIEW AIRPORTHOTELS;
CREATE VIEW AIRPORTHOTELS 
    AS SELECT * FROM hotels
        where city in (SELECT city FROM airports);


--- examples of procedures

CREATE or replace PROCEDURE INCREASE_ALL_RATINGS (DELTA INTEGER = 1)
LANGUAGE SQL
BEGIN ATOMIC
     update hotels set rating = rating + delta;
END;

CALL INCREASE_ALL_RATINGS (1);


CREATE or replace PROCEDURE CLEANS_RATINGS ()
LANGUAGE SQL
BEGIN ATOMIC
    update hotels set rating = 1 
        where rating is null;
    update hotels set rating = 1 
        where rating < 1;
    update hotels set rating = 5 
        where rating > 5;
END;

CALL CLEANS_RATINGS ();



-- use procedures to implement a backup mechanism - copy the hotels table and be able to restore it anytime 

CREATE TABLE hotels_backup as select * from hotels WITH NO DATA;

CREATE or replace PROCEDURE BACKUP_HOTELS ()
LANGUAGE SQL
BEGIN ATOMIC
     delete from hotels_backup;
     insert into hotels_backup select * from hotels;
END;

CREATE or replace PROCEDURE RESTORE_HOTELS ()
LANGUAGE SQL
BEGIN ATOMIC
     delete from hotels;
     insert into hotels select * from hotels_backup;
END;

CREATE or replace PROCEDURE RESTORE_HOTEL_RATINGS ()
LANGUAGE SQL
BEGIN ATOMIC
     update hotels 
        set rating = (select rating 
                                from hotels_backup hb 
                                where hb.uniquename = hotels.uniquename);
END;

