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

-- =========================
-- ROOMS (5 je Hotel)
-- 101:1P | 102:2P | 103:2P | 104:3P | 105:4P
-- =========================
INSERT INTO Rooms (UniqueName, RoomNumber, maxPers) VALUES
    ('HDB-HolidayInn',101,1),('HDB-HolidayInn',102,2),('HDB-HolidayInn',103,2),('HDB-HolidayInn',104,3),('HDB-HolidayInn',105,4),
    ('WDF-HollidayInn',101,1),('WDF-HollidayInn',102,2),('WDF-HollidayInn',103,2),('WDF-HollidayInn',104,3),('WDF-HollidayInn',105,4),
    ('HDB-CrownePlaza',101,1),('HDB-CrownePlaza',102,2),('HDB-CrownePlaza',103,2),('HDB-CrownePlaza',104,3),('HDB-CrownePlaza',105,4),
    ('COR-Poste',101,1),('COR-Poste',102,2),('COR-Poste',103,2),('COR-Poste',104,3),('COR-Poste',105,4),
    ('SIS-Poste',101,1),('SIS-Poste',102,2),('SIS-Poste',103,2),('SIS-Poste',104,3),('SIS-Poste',105,4),
    ('WSL-Ifen',101,1),('WSL-Ifen',102,2),('WSL-Ifen',103,2),('WSL-Ifen',104,3),('WSL-Ifen',105,4),
    ('WSL-Palatin',101,1),('WSL-Palatin',102,2),('WSL-Palatin',103,2),('WSL-Palatin',104,3),('WSL-Palatin',105,4),
    ('XON-Auree',101,1),('XON-Auree',102,2),('XON-Auree',103,2),('XON-Auree',104,3),('XON-Auree',105,4),
    ('LON-Travelodge1',101,1),('LON-Travelodge1',102,2),('LON-Travelodge1',103,2),('LON-Travelodge1',104,3),('LON-Travelodge1',105,4),
    ('SFO-Travelodge1',101,1),('SFO-Travelodge1',102,2),('SFO-Travelodge1',103,2),('SFO-Travelodge1',104,3),('SFO-Travelodge1',105,4),
    ('SOF-Downtown',101,1),('SOF-Downtown',102,2),('SOF-Downtown',103,2),('SOF-Downtown',104,3),('SOF-Downtown',105,4),
    ('IST-Angel',101,1),('IST-Angel',102,2),('IST-Angel',103,2),('IST-Angel',104,3),('IST-Angel',105,4),
    ('MAD-Westin',101,1),('MAD-Westin',102,2),('MAD-Westin',103,2),('MAD-Westin',104,3),('MAD-Westin',105,4),
    ('FRA-Sheraton',101,1),('FRA-Sheraton',102,2),('FRA-Sheraton',103,2),('FRA-Sheraton',104,3),('FRA-Sheraton',105,4),
    ('LAI-Travelodge1',101,1),('LAI-Travelodge1',102,2),('LAI-Travelodge1',103,2),('LAI-Travelodge1',104,3),('LAI-Travelodge1',105,4),
    ('BLR-MarriotW',101,1),('BLR-MarriotW',102,2),('BLR-MarriotW',103,2),('BLR-MarriotW',104,3),('BLR-MarriotW',105,4),
    ('BLR-4Seasons',101,1),('BLR-4Seasons',102,2),('BLR-4Seasons',103,2),('BLR-4Seasons',104,3),('BLR-4Seasons',105,4),
    ('LBR-HiltonGI',101,1),('LBR-HiltonGI',102,2),('LBR-HiltonGI',103,2),('LBR-HiltonGI',104,3),('LBR-HiltonGI',105,4),
    ('RIV-ParcFlora',101,1),('RIV-ParcFlora',102,2),('RIV-ParcFlora',103,2),('RIV-ParcFlora',104,3),('RIV-ParcFlora',105,4),
    ('VER-CityCentre',101,1),('VER-CityCentre',102,2),('VER-CityCentre',103,2),('VER-CityCentre',104,3),('VER-CityCentre',105,4),
    ('ROV-BlueLocanda',101,1),('ROV-BlueLocanda',102,2),('ROV-BlueLocanda',103,2),('ROV-BlueLocanda',104,3),('ROV-BlueLocanda',105,4),
    ('THA-BBB',101,1),('THA-BBB',102,2),('THA-BBB',103,2),('THA-BBB',104,3),('THA-BBB',105,4),
    ('THA-RimPai',101,1),('THA-RimPai',102,2),('THA-RimPai',103,2),('THA-RimPai',104,3),('THA-RimPai',105,4),
    ('THA-NightBazaar',101,1),('THA-NightBazaar',102,2),('THA-NightBazaar',103,2),('THA-NightBazaar',104,3),('THA-NightBazaar',105,4);

-- =========================
-- GUESTS (10)
-- =========================
INSERT INTO Guests (Email, GuestName, Address, PersCount) VALUES
    ('eva.mueller@example.com','Eva Müller','Schillerstr. 10, Heidelberg',1),
    ('jan.keller@example.com','Jan Keller','Bahnhofstr. 22, Mannheim',2),
    ('sara.yilmaz@example.com','Sara Yilmaz','Istiklal Cd. 50, Istanbul',2),
    ('li.wei@example.com','Li Wei','Chaoyang Rd 8, Beijing',1),
    ('maria.rodriguez@example.com','María Rodriguez','Calle Mayor 12, Madrid',3),
    ('john.smith@example.com','John Smith','221B Baker St, London',1),
    ('elena.ivanova@example.com','Elena Ivanova','Nevsky 100, St. Petersburg',2),
    ('pierre.dupont@example.com','Pierre Dupont','Rue Victor Hugo 5, Lyon',1),
    ('chiara.rossi@example.com','Chiara Rossi','Via Milano 7, Verona',2),
    ('fatima.alsayed@example.com','Fatima Al-Sayed','Zamalek 3, Cairo',1);

-- =========================
-- RESERVATIONS (15)
-- (dürfen in der Zukunft liegen, FK nur auf Hotel/Gast)
-- =========================
INSERT INTO Reservations (Email, UniqueName, fromDate, toDate) VALUES
    ('eva.mueller@example.com','FRA-Sheraton','2025-11-20','2025-11-22'),
    ('jan.keller@example.com','HDB-CrownePlaza','2025-12-05','2025-12-10'),
    ('sara.yilmaz@example.com','IST-Angel','2026-03-12','2026-03-15'),
    ('li.wei@example.com','SOF-Downtown','2025-10-20','2025-10-23'),
    ('maria.rodriguez@example.com','MAD-Westin','2025-12-28','2026-01-02'),
    ('john.smith@example.com','LON-Travelodge1','2025-11-01','2025-11-03'),
    ('elena.ivanova@example.com','SIS-Poste','2026-04-18','2026-04-20'),
    ('pierre.dupont@example.com','COR-Poste','2025-10-25','2025-10-27'),
    ('chiara.rossi@example.com','VER-CityCentre','2025-11-15','2025-11-16'),
    ('fatima.alsayed@example.com','THA-RimPai','2026-02-10','2026-02-14'),
    ('eva.mueller@example.com','WSL-Palatin','2026-05-05','2026-05-08'),
    ('jan.keller@example.com','WDF-HollidayInn','2026-01-12','2026-01-14'),
    ('sara.yilmaz@example.com','BLR-4Seasons','2026-02-25','2026-03-01'),
    ('li.wei@example.com','RIV-ParcFlora','2026-06-10','2026-06-12'),
    ('john.smith@example.com','SFO-Travelodge1','2025-12-12','2025-12-15');

-- =========================
-- BOOKING (25, alle in der Vergangenheit
--   relativ zu 2025-10-09; beachten: persCount <= maxPers des Zimmers)
-- =========================
INSERT INTO Booking (UniqueName, RoomNumber, fromDate, toDate, persCount) VALUES
    ('HDB-HolidayInn',101,'2024-04-10','2024-04-12',1),
    ('HDB-HolidayInn',105,'2025-05-01','2025-05-05',4),
    ('WDF-HollidayInn',104,'2023-09-01','2023-09-04',3),
    ('HDB-CrownePlaza',102,'2025-03-15','2025-03-18',2),
    ('COR-Poste',103,'2024-07-20','2024-07-22',2),
    ('SIS-Poste',101,'2025-01-05','2025-01-07',1),
    ('WSL-Ifen',105,'2024-12-10','2024-12-15',4),
    ('WSL-Palatin',104,'2023-12-23','2023-12-27',3),
    ('XON-Auree',102,'2024-02-10','2024-02-12',2),
    ('LON-Travelodge1',103,'2025-06-01','2025-06-03',2),
    ('SFO-Travelodge1',105,'2023-05-05','2023-05-10',4),
    ('SOF-Downtown',101,'2024-09-01','2024-09-02',1),
    ('IST-Angel',104,'2025-02-14','2025-02-17',3),
    ('MAD-Westin',105,'2024-03-20','2024-03-24',4),
    ('FRA-Sheraton',102,'2024-11-11','2024-11-13',2),
    ('LAI-Travelodge1',103,'2025-07-10','2025-07-12',2),
    ('BLR-MarriotW',104,'2025-04-01','2025-04-05',3),
    ('BLR-4Seasons',105,'2025-05-20','2025-05-25',4),
    ('LBR-HiltonGI',102,'2024-08-08','2024-08-12',2),
    ('RIV-ParcFlora',101,'2023-10-09','2023-10-10',1),
    ('VER-CityCentre',104,'2024-04-30','2024-05-02',3),
    ('ROV-BlueLocanda',103,'2025-09-01','2025-09-04',2),
    ('THA-BBB',105,'2023-12-01','2023-12-05',4),
    ('THA-RimPai',102,'2024-01-15','2024-01-17',2),
    ('THA-NightBazaar',101,'2025-08-05','2025-08-07',1);