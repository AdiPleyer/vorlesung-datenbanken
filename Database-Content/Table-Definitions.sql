--- table definitions for Hotel Booking System ---
--- drops are in a separate file ---

CREATE TABLE Hotels (
  UniqueName VARCHAR(50) PRIMARY KEY,
  HotelName  VARCHAR(50),
  City       VARCHAR(50),
  Rating     INT default 1,
  Country    VARCHAR(50),
  WiFi       VARCHAR(5) default 'no');

CREATE TABLE Rooms (
   UniqueName   VARCHAR(50),
   RoomNumber   INT,
   maxPers      INT,
   PRIMARY KEY (UniqueName, RoomNumber),
   FOREIGN KEY (UniqueName) REFERENCES Hotels (UniqueName) 
   );

CREATE TABLE Booking (
   UniqueName   VARCHAR(50),
   RoomNumber   INT,
   fromDate     DATE,
   toDate       DATE,
   persCount    INT,
   PRIMARY KEY (UniqueName, RoomNumber, fromDate),
   FOREIGN KEY (UniqueName, RoomNumber) REFERENCES Rooms (UniqueName, RoomNumber)
   );

CREATE TABLE Guests (
   Email      VARCHAR(50) PRIMARY KEY,
   GuestName  VARCHAR(50),
   Address    VARCHAR(50),
   PersCount  INT DEFAULT 1);
   
   
CREATE TABLE Reservations (
   Email        VARCHAR(50), 
   UniqueName   VARCHAR(50),
   fromDate     DATE,
   toDate       DATE,
   PRIMARY KEY (Email, UniqueName, fromDate),
   FOREIGN KEY (Email) REFERENCES Guests (Email),
   FOREIGN KEY (UniqueName) REFERENCES Hotels (UniqueName)
);

CREATE TABLE Countries (
   Country VARCHAR(30) PRIMARY KEY,
   Continent VARCHAR(30)
   );

CREATE TABLE Airports (
   Airport      VARCHAR(5) PRIMARY KEY,
   Name         VARCHAR(50),
   City         VARCHAR(50),
   Country      VARCHAR(50),
   Terminals    INT,
   FOREIGN KEY (Country) REFERENCES Countries (Country)
   );

CREATE TABLE BigAirports (
   AirportName VARCHAR(100),
   City  		VARCHAR(30),
   Country  	VARCHAR(30),
   Pax2016 		INT,
   Freight2016 INT,
   Moves2016 	INT,
   AreaHA  		INT,
   Code 			VARCHAR(30),
   CodeICAO 	VARCHAR(30),
   SLB 			INT,
   Height 		INT,
   OpeningYear INT,
   PRIMARY KEY (AirportName, City)
   );
