--- Copy & paste all into https://dbfiddle.uk and enjoy!

--- create the table
CREATE TABLE Hotels (
  UniqueName VARCHAR(50) PRIMARY KEY,
  HotelName  VARCHAR(50),
  City       VARCHAR(50),
  Rating     INT default 1,
  Country    VARCHAR(50),
  WiFi       VARCHAR(5) default 'no');

--- inssert some data
INSERT INTO hotels VALUES 
    ('HDB-HolidayInn', 'Holliday Inn', 'Heidelberg', '4', 'Germany', 'free'),
    ('WDF-HollidayInn', 'Holliday Inn', 'Walldorf', '4', 'Germany', 'free'),
    ('HDB-CrownePlaza', 'Crowne Plaza', 'Heidelberg', '5', 'Germany', 'free'),
    ('COR-Poste', 'Hotel de la Poste', 'Corps', '3', 'France', 'no'),
    ('SIS-Poste', 'Hotel de la Poste', 'Sisteron', '2', 'France', 'no'),
    ('WSL-Ifen', 'Ifen', 'Wiesloch', '3', 'Germany', 'free'),
    ('WSL-Palatin', 'Palatin', 'Wiesloch', '4', 'Germany', 'free'),
    ('XON-Auree', 'Auree du Bois', 'Xonrupt', '1', 'France', 'no'),
    ('LON-Travelodge1', 'Travelodge', 'London', '3', 'UK', 'free'),
    ('SFO-Travelodge1', 'Travelodge', 'San Francisco', '3', 'USA', 'free'),
    ('SOF-Downtown', 'Downtown', 'Sofia', '4', 'Bulgaria', 'free'),
    ('IST-Angel', 'Angels Home', 'Istanbul', '3', 'Turkey', 'free'),
    ('MAD-Westin', 'Westin Palace', 'Madrid', '5', 'Spain', 'paid'),
    ('FRA-Sheraton', 'Sheraton Airport', 'Frankfurt', '4', 'Germany', 'free'),
    ('LAI-Travelodge1', 'Travelodge 1', 'Los Angeles', 3, 'USA', 'free'),
    ('BLR-MarriotW', 'Marriottt Whitefield', 'Bangalore', 5, 'India', 'free'),
    ('BLR-4Seasons', 'Four Seasons', 'Bangalore', 5, 'India', 'free'),
    ('LBR-HiltonGI', 'Hilton Garden Inn', 'Liberia', 4, 'Costa Rica', 'free'),
    ('RIV-ParcFlora', 'Parc Hotel Flora', 'Riva del Garda', 3, 'Italia', 'free'),
    ('VER-CityCentre', 'City Centre', 'Verona', 2, 'Italia', 'free'),
    ('ROV-BlueLocanda', 'Blu Locanda', 'Rovinj', 3, 'Croatia', 'free'),
    ('THA-BBB', 'Bangbaobeach', 'Koh Chang', 4, 'Thailand', 'free'),
    ('THA-RimPai', 'Rim Pai Cottage', 'Pai', 4, 'Thailand', 'free'),
    ('THA-NightBazaar', 'Night Bazaar Inn', 'Chiang Mai', 3, 'Thailand', 'free');

--- play around and excercise
select * from hotels where country = 'Germany';

