--- table definitions and sample data for RAUM, SITZ, PREIS ---
--- Copy & paste all into https://dbfiddle.uk and enjoy!
--- Do it in two parts for better visibility in DBFiddle

--- ---------------------------------------------------
--- Initial part
--- ---------------------------------------------------


--- table definitions
create table RAUM (
	RaumNr VARCHAR(10) PRIMARY KEY,
	RaumName VARCHAR(50)
	);

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

create table PREIS (
	RaumNr VARCHAR(10),
	PreisKat INT, 
	SitzPreis DECIMAL(10,2),
	PRIMARY KEY (RaumNr, PreisKat),
	FOREIGN KEY (RaumNr) REFERENCES Raum (RaumNr)
	);

--- sample data	

INSERT INTO RAUM VALUES ('01', 'Mozart'),
                        ('02', 'Beethoven'),
                        ('03', 'Debusy');

insert into SITZ values ('01', 'A', 1, 1, false, '3'),
                        ('01', 'A', 1, 2, false, '3'),
                        ('01', 'A', 1, 3, false, '3'),
                        ('01', 'A', 1, 4, false, '3'),
                        ('01', 'A', 2, 1, false, '2'),
                        ('01', 'A', 2, 2, false, '2'),
                        ('01', 'A', 2, 3, false, '2'),
                        ('01', 'A', 2, 4, false, '2'),
                        ('01', 'A', 3, 1, false, '1'),
                        ('01', 'A', 3, 2, false, '1'),
                        ('01', 'A', 3, 3, false, '1'),
                        ('01', 'A', 3, 4, false, '1');

insert into SITZ values ('01', 'B', 1, 1, false, '4'),
                        ('01', 'B', 1, 2, false, '4'),
                        ('01', 'B', 1, 3, false, '4'),
                        ('01', 'B', 1, 4, false, '4'),
                        ('01', 'B', 2, 1, false, '3'),
                        ('01', 'B', 2, 2, false, '3'),
                        ('01', 'B', 2, 3, false, '3'),
                        ('01', 'B', 2, 4, false, '3'),
                        ('01', 'B', 3, 1, false, '2'),
                        ('01', 'B', 3, 2, false, '2'),
                        ('01', 'B', 3, 3, false, '2'),
                        ('01', 'B', 3, 4, false, '2'),
                        ('01', 'B', 4, 1, false, '1'),
                        ('01', 'B', 4, 2, false, '1'),
                        ('01', 'B', 4, 3, false, '1'),
                        ('01', 'B', 4, 4, false, '1'),
                        ('01', 'B', 5, 1, false, '1'),
                        ('01', 'B', 5, 2, false, '1'),
                        ('01', 'B', 5, 3, false, '1'),
                        ('01', 'B', 5, 4, false, '1');

insert into SITZ values ('01', 'C', 1, 1, false, '3'),
                        ('01', 'C', 1, 2, false, '3'),
                        ('01', 'C', 1, 3, false, '3'),
                        ('01', 'C', 1, 4, false, '3'),
                        ('01', 'C', 2, 1, false, '2'),
                        ('01', 'C', 2, 2, false, '2'),
                        ('01', 'C', 2, 3, false, '2'),
                        ('01', 'C', 2, 4, false, '2'),
                        ('01', 'C', 3, 1, false, '1'),
                        ('01', 'C', 3, 2, false, '1'),
                        ('01', 'C', 3, 3, false, '1'),
                        ('01', 'C', 3, 4, false, '1'),
                        ('01', 'C', 4, 4, false, '5');

insert into SITZ values ('01', 'D', 1, 1, false, '4'),
                        ('01', 'D', 1, 2, false, '4'),
                        ('01', 'D', 1, 3, false, '4'),
                        ('01', 'D', 1, 4, false, '4'),
                        ('01', 'D', 2, 1, false, '3'),
                        ('01', 'D', 2, 2, false, '3'),
                        ('01', 'D', 2, 3, false, '3'),
                        ('01', 'D', 2, 4, false, '3'),
                        ('01', 'D', 3, 1, false, '2'),
                        ('01', 'D', 3, 2, false, '2'),
                        ('01', 'D', 3, 3, false, '2'),
                        ('01', 'D', 3, 4, false, '2'),
                        ('01', 'D', 4, 1, false, '1'),
                        ('01', 'D', 4, 2, false, '1'),
                        ('01', 'D', 4, 3, false, '1'),
                        ('01', 'D', 4, 4, false, '1'),
                        ('01', 'D', 5, 1, false, '1'),
                        ('01', 'D', 5, 2, false, '1'),
                        ('01', 'D', 5, 3, false, '1'),
                        ('01', 'D', 5, 4, false, '1'),
                        ('01', 'D', 6, 1, false, '5'),
                        ('01', 'D', 6, 2, false, '5'),
                        ('01', 'D', 6, 3, false, '5'),
                        ('01', 'D', 6, 4, false, '5');


insert into PREIS values ('01', 1, 20),
                         ('01', 2, 25),
                         ('01', 3, 28),
                         ('01', 4, 35),
                         ('01', 5, 50);
insert into PREIS values ('02', 1, 22),
                         ('02', 2, 27),
                         ('02', 3, 31),
                         ('02', 4, 42),
                         ('02', 5, 60);
insert into PREIS values ('03', 1, 40),
                         ('03', 2, 50),
                         ('03', 3, 70),
                         ('03', 4, 90),
                         ('03', 5, 150);

--- copy raum 01 into 02 and 03

insert into sitz 
    select '02', Block, Reihe, SitzNr, Belegung, PreisKat 
        from sitz 
        where RaumNr = '01';

insert into sitz 
    select '03', Block, Reihe, SitzNr, Belegung, PreisKat 
        from sitz 
        where RaumNr = '01';

--- sitze belegen, so dass es ein wenig zufällig aussieht aber trotzdem reproduzierbar ist

update sitz set Belegung = true
    where Reihe * SitzNr % 7 in (0,1)
        or (Reihe + SitzNr) % 7 in (0,1,2);


--- ---------------------------------------------------
--- Your own part, paste separately
--- ---------------------------------------------------

select RaumNr, Block, count(*) 
    from sitz
    where Belegung = false
    group by RaumNr, Block
    order by RaumNr, Block;

