--- example of a trigger
--- adjust rating based on the wifi availability

CREATE or replace FUNCTION update_rating_from_wifi () RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS $$
    BEGIN
        IF (OLD.wifi <> NEW.wifi or OLD.wifi is null) and NEW.wifi = 'free' and NEW.rating < 5 THEN
            NEW.rating = OLD.rating + 1;
        END IF;
        RETURN NEW;
    END;
    $$;

CREATE or replace TRIGGER check_rating
    BEFORE UPDATE ON hotels
    FOR EACH ROW 
    EXECUTE FUNCTION update_rating_from_wifi();


--- Auditing changes on hotels
--- table to store the changes

DROP TABLE hotels_audits;
CREATE TABLE hotels_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   operation VARCHAR(10),
   UniqueName VARCHAR(50),
   hotelName VARCHAR(50),
   City VARCHAR(50),
   Rating VARCHAR(10),
   Country VARCHAR(50),
   WiFi VARCHAR(5),
   changed_on TIMESTAMP(6) NOT NULL
);

--- function and trigger for updates on the hotels

CREATE OR REPLACE FUNCTION log_hotels_changes()
    RETURNS TRIGGER 
    LANGUAGE PLPGSQL
    AS $$  
    DECLARE
        L_uniquename character(50);
        L_hotelname character (50);
        L_city character (50);
        L_rating character(10);
        L_country character (50);
        L_wifi character (50);
    BEGIN
        if OLD.Uniquename <> NEW.uniquename then L_uniquename := NEW.Uniquename; else L_uniquename := OLD.uniquename; end if;
        if OLD.hotelname <> NEW.hotelname then L_hotelname := NEW.hotelname; else L_hotelname := ''; end if;
        if OLD.city <> NEW.city then L_city := NEW.city; else L_city := ''; end if;
        if OLD.rating <> NEW.rating then L_rating := NEW.rating; else L_rating := ''; end if;
        if OLD.country <> NEW.country then L_country := NEW.country; else L_country := ''; end if;
        if OLD.wifi <> NEW.wifi then L_wifi := NEW.wifi; else L_wifi := ''; end if;
        INSERT INTO hotels_audits(operation, UniqueName, hotelName, City, Rating, Country, WiFi, changed_on)
            VALUES('UPD', L_uniqueName, L_hotelname, L_city, L_rating, L_country, L_WiFi, now());
	RETURN NEW;
    END;
    $$;

CREATE or REPLACE TRIGGER hotels_changes
    BEFORE UPDATE
    ON hotels
    FOR EACH ROW
    EXECUTE PROCEDURE log_hotels_changes();

--- another function and trigger for inserts

CREATE OR REPLACE FUNCTION log_hotels_inserts()
    RETURNS TRIGGER 
    LANGUAGE PLPGSQL
    AS $$  
    BEGIN
        INSERT INTO hotels_audits(operation, UniqueName, hotelName, City, Rating, Country, WiFi, changed_on)
            VALUES('INS', NEW.uniqueName, NEW.hotelName, NEW.City, NEW.Rating, NEW.Country, NEW.WiFi, now());
	RETURN NEW;
    END;
    $$;

CREATE or REPLACE TRIGGER hotels_inserts
    BEFORE INSERT
    ON hotels
    FOR EACH ROW
    EXECUTE PROCEDURE log_hotels_inserts();

--- evaluate the logged changes

DROP VIEW HOTELCHANGES;
CREATE VIEW HOTELCHANGES 
    AS (SELECT 0 as id, 
            '--->>>' as operation, 
            UniqueName, hotelName, City,
            CAST (Rating as Character(10)),
            Country, WiFi, now() 
            FROM hotels 
    union
        SELECT * FROM hotels_audits)
    ORDER BY uniquename, now DESC;


-- view triggers on a table - usage of metadata of the database

SELECT  tgname AS trigger_name,
        tgrelid::regclass AS table_name,
        tgrelid
    FROM pg_trigger
    ORDER BY table_name, trigger_name;

select * 
    from pg_trigger 
    where tgrelid = 'hotels'::regclass;

