--- Start a transaction
BEGIN WORK;

--- Start a transaction with specific isolation level
BEGIN WORK ISOLATION LEVEL READ UNCOMMITTED;
BEGIN WORK ISOLATION LEVEL READ COMMITTED;
BEGIN WORK ISOLATION LEVEL REPEATABLE READ;
BEGIN WORK ISOLATION LEVEL SERIALIZABLE;

--- Set the isolation level for the current transaction
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--- Set the isolation level for all subsequent transactions
SET GLOBAL TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET GLOBAL TRANSACTION ISOLATION LEVEL REPEATABLE READ
SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE



--- examples of a transactions

--- Create a new hotel with rooms
BEGIN WORK;
	INSERT INTO Hotels VALUES ('BER-Travelodge', 'Travelodge', 'Berlin', NULL, 'Germany', 'free');
	INSERT INTO Rooms (UniqueName, RoomNumber, maxPers) VALUES ('BER-Travelodge', 101, 2);
	INSERT INTO Rooms (UniqueName, RoomNumber, maxPers) VALUES ('BER-Travelodge', 102, 3);
	INSERT INTO Rooms (UniqueName, RoomNumber, maxPers) VALUES ('BER-Travelodge', 201, 2);
	INSERT INTO Rooms (UniqueName, RoomNumber, maxPers) VALUES ('BER-Travelodge', 202, 4);
	UPDATE Hotels SET Rating = 5 
		WHERE UniqueName = 'BER-Travelodge';
COMMIT WORK;

--- reserve two rooms for G.G.
BEGIN WORK;
	INSERT INTO guests VALUES ('grass@literatz.org', 'Guenther Grass', 'Trommelgasse 2, Oskarstadt', 1);
	INSERT INTO reservations VALUES ('grass@literatz.org', 'BER-Travelodge', '2025-12-23', '2025-12-26');
	INSERT INTO reservations VALUES ('grass@literatz.org', 'BER-Travelodge', '2025-12-31', '2026-01-02');
COMMIT WORK;

ROLLBACK WORK;



--- clean up transaction
BEGIN WORK;
	DELETE FROM Reservations WHERE Email = 'grass@literatz.org';
	DELETE FROM Guests WHERE Email = 'grass@literatz.org';
	DELETE FROM Rooms WHERE UniqueName = 'BER-Travelodge';
	DELETE FROM Hotels WHERE UniqueName = 'BER-Travelodge';
COMMIT WORK;