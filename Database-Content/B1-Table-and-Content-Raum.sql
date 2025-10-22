--- table definitions and sample data for RAUM, SITZ, PREIS ---
--- for SQLite remove "cascade" in drop table statements

drop table RAUM cascade;
create table RAUM (
	RaumNr VARCHAR(10) PRIMARY KEY,
	RaumName VARCHAR(50)
	);

drop table SITZ cascade;
create table SITZ (
	RaumNr VARCHAR(10),
	Block VARCHAR(10), 
	Reihe INT, 
	SitzNr INT, 
	Belegung BOOLEAN, 
	PreisKat INT,	
	PRIMARY KEY (RaumNr, Block, Reihe, SitzNr),
	FOREIGN KEY (RaumNr) REFERENCES Raum (RaumNr)
	);

drop table PREIS cascade;
create table PREIS (
	RaumNr VARCHAR(10),
	PreisKat INT, 
	SitzPreis DECIMAL(10,2),
	PRIMARY KEY (RaumNr, PreisKat),
	FOREIGN KEY (RaumNr) REFERENCES Raum (RaumNr)
	);

--- sample data	

INSERT INTO RAUM VALUES ('01', 'Mozart');
INSERT INTO RAUM VALUES ('02', 'Beethoven');
INSERT INTO RAUM VALUES ('03', 'Debusy');

insert into SITZ values ('01', 'A', 1, 1, false, '3');
insert into SITZ values ('01', 'A', 1, 2, false, '3');
insert into SITZ values ('01', 'A', 1, 3, false, '3');
insert into SITZ values ('01', 'A', 1, 4, false, '3');
insert into SITZ values ('01', 'A', 2, 1, false, '2');
insert into SITZ values ('01', 'A', 2, 2, false, '2');
insert into SITZ values ('01', 'A', 2, 3, false, '2');
insert into SITZ values ('01', 'A', 2, 4, false, '2');
insert into SITZ values ('01', 'A', 3, 1, false, '1');
insert into SITZ values ('01', 'A', 3, 2, false, '1');
insert into SITZ values ('01', 'A', 3, 3, false, '1');
insert into SITZ values ('01', 'A', 3, 4, false, '1');

insert into SITZ values ('01', 'B', 1, 1, false, '4');
insert into SITZ values ('01', 'B', 1, 2, false, '4');
insert into SITZ values ('01', 'B', 1, 3, false, '4');
insert into SITZ values ('01', 'B', 1, 4, false, '4');
insert into SITZ values ('01', 'B', 2, 1, false, '3');
insert into SITZ values ('01', 'B', 2, 2, false, '3');
insert into SITZ values ('01', 'B', 2, 3, false, '3');
insert into SITZ values ('01', 'B', 2, 4, false, '3');
insert into SITZ values ('01', 'B', 3, 1, false, '2');
insert into SITZ values ('01', 'B', 3, 2, false, '2');
insert into SITZ values ('01', 'B', 3, 3, false, '2');
insert into SITZ values ('01', 'B', 3, 4, false, '2');
insert into SITZ values ('01', 'B', 4, 1, false, '1');
insert into SITZ values ('01', 'B', 4, 2, false, '1');
insert into SITZ values ('01', 'B', 4, 3, false, '1');
insert into SITZ values ('01', 'B', 4, 4, false, '1');
insert into SITZ values ('01', 'B', 5, 1, false, '1');
insert into SITZ values ('01', 'B', 5, 2, false, '1');
insert into SITZ values ('01', 'B', 5, 3, false, '1');
insert into SITZ values ('01', 'B', 5, 4, false, '1');

insert into SITZ values ('01', 'C', 1, 1, false, '3');
insert into SITZ values ('01', 'C', 1, 2, false, '3');
insert into SITZ values ('01', 'C', 1, 3, false, '3');
insert into SITZ values ('01', 'C', 1, 4, false, '3');
insert into SITZ values ('01', 'C', 2, 1, false, '2');
insert into SITZ values ('01', 'C', 2, 2, false, '2');
insert into SITZ values ('01', 'C', 2, 3, false, '2');
insert into SITZ values ('01', 'C', 2, 4, false, '2');
insert into SITZ values ('01', 'C', 3, 1, false, '1');
insert into SITZ values ('01', 'C', 3, 2, false, '1');
insert into SITZ values ('01', 'C', 3, 3, false, '1');
insert into SITZ values ('01', 'C', 3, 4, false, '1');
insert into SITZ values ('01', 'C', 4, 4, false, '5');

insert into SITZ values ('01', 'D', 1, 1, false, '4');
insert into SITZ values ('01', 'D', 1, 2, false, '4');
insert into SITZ values ('01', 'D', 1, 3, false, '4');
insert into SITZ values ('01', 'D', 1, 4, false, '4');
insert into SITZ values ('01', 'D', 2, 1, false, '3');
insert into SITZ values ('01', 'D', 2, 2, false, '3');
insert into SITZ values ('01', 'D', 2, 3, false, '3');
insert into SITZ values ('01', 'D', 2, 4, false, '3');
insert into SITZ values ('01', 'D', 3, 1, false, '2');
insert into SITZ values ('01', 'D', 3, 2, false, '2');
insert into SITZ values ('01', 'D', 3, 3, false, '2');
insert into SITZ values ('01', 'D', 3, 4, false, '2');
insert into SITZ values ('01', 'D', 4, 1, false, '1');
insert into SITZ values ('01', 'D', 4, 2, false, '1');
insert into SITZ values ('01', 'D', 4, 3, false, '1');
insert into SITZ values ('01', 'D', 4, 4, false, '1');
insert into SITZ values ('01', 'D', 5, 1, false, '1');
insert into SITZ values ('01', 'D', 5, 2, false, '1');
insert into SITZ values ('01', 'D', 5, 3, false, '1');
insert into SITZ values ('01', 'D', 5, 4, false, '1');
insert into SITZ values ('01', 'D', 6, 1, false, '5');
insert into SITZ values ('01', 'D', 6, 2, false, '5');
insert into SITZ values ('01', 'D', 6, 3, false, '5');
insert into SITZ values ('01', 'D', 6, 4, false, '5');


insert into PREIS values ('01', 1, 20);
insert into PREIS values ('01', 2, 25);
insert into PREIS values ('01', 3, 28);
insert into PREIS values ('01', 4, 35);
insert into PREIS values ('01', 5, 50);







