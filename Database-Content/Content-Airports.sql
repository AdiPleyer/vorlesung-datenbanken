
insert into countries values ('Sweden', 'Europe');
insert into countries values ('Cambodia', 'Asia');
insert into countries values ('France', 'Europe');
insert into countries values ('Italia', 'Europe');
insert into countries values ('Turkey', 'Asia');
insert into countries values ('Qatar', 'Asia');
insert into countries values ('Spain', 'Europe');
insert into countries values ('Thailand', 'Asia');
insert into countries values ('USA', 'America');
insert into countries values ('Germany', 'Europe');
insert into countries values ('Costa Rica', 'America');
insert into countries values ('Bulgaria', 'Europe');
insert into countries values ('UK', 'Europe');
insert into countries values ('India', 'Asia');
insert into countries values ('Croatia', 'Europe');

INSERT INTO airports VALUES ('MAD', 'Barajas', 'Madrid', 'Spain', 2);
INSERT INTO airports VALUES ('SOF', 'Vrazhdebna', 'Sofia', 'Bulgaria', 2);
INSERT INTO airports VALUES ('CDG', 'Charles-De-Gaules', 'Paris', 'France', 2);
INSERT INTO airports VALUES ('TLS', 'Toulouse-Blagnac', 'Toulouse', 'France', 2);
INSERT INTO airports VALUES ('FRA', 'Rhein-Main', 'Frankfurt', 'Germany', 2);
INSERT INTO airports VALUES ('IST', 'Attatürk', 'Istanbul', 'Turkey', 2);
INSERT INTO airports VALUES ('SFO', 'International Airport', 'San Francisco', 'USA', 1);
INSERT INTO airports VALUES ('ORD', 'Chicago OHare International', 'Chicago', 'USA', 1);
INSERT INTO airports VALUES ('HNH', 'Frankfurt-Hahn', 'Frankfurt', 'Germany', 1);
INSERT INTO airports VALUES ('BKK', 'Suvarnabhumi', 'Bangkok', 'Thailand', 1);
INSERT INTO airports VALUES ('CNX', 'Chiang Mai', 'Chiang Mai', 'Thailand', 1);
INSERT INTO airports VALUES ('REP', 'Siem Reap', 'Siem Reap', 'Cambodia', 1);
INSERT INTO airports VALUES ('JFK', 'John F. Kennedy', 'New York', 'USA', 5);
INSERT INTO airports VALUES ('ARL', 'Arlanda', 'Stockholm', 'Sweden', 5);
INSERT INTO airports VALUES ('DOH', 'Hamad', 'Doha', 'Qatar', 1);
INSERT INTO airports VALUES ('BLR', 'Kempegowda', 'Bangalore', 'India', 1);
INSERT INTO airports VALUES ('SJO', 'Juan Santamaria', 'San Jose', 'Costa Rica', 1);
INSERT INTO airports VALUES ('SNA', 'John Wayne', 'Santa Ana', 'USA', 1);
INSERT INTO airports VALUES ('LIN', 'Linate', 'Milano', 'Italia', 1);
INSERT INTO airports VALUES ('AGP', 'Costa del Sol', 'Malaga', 'Spain', 1);


select distinct country from airports union select distinct country from hotels except select country from countries;

select * from hotels where country = any (select country from airports);
select * from hotels where city = any (select city from airports);

