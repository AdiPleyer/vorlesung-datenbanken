---
--- the following statements are explained in 1-3
--- they partly differ in detail 
---

--- List of reservations for hotel X
SELECT * FROM Hotels h
	JOIN Reservations r ON h.UniqueName = r.UniqueName
    WHERE HotelName = 'Travelodge';

--- other approach
SELECT * FROM Reservations r
	JOIN Hotels h ON h.UniqueName = r.UniqueName
	WHERE HotelName = 'Travelodge';

--- which ratings has Mr X reserved?
SELECT GuestName, Rating FROM Hotels h
	JOIN Reservations r ON h.UniqueName = r.UniqueName
	JOIN Guests g ON g.Email = r.Email
	WHERE GuestName like 'Eva %';

--- which rooms are booked in hotel X on day D
SELECT b.UniqueName, b.RoomNumber 
    FROM Booking b
	JOIN Rooms r ON b.UniqueName = r.UniqueName 
              AND b.RoomNumber = r.RoomNumber
	JOIN Hotels h ON h.UniqueName  = r.UniqueName 
	WHERE h.HotelName = 'Travelodge' 
        AND b.fromDate <= '2025-06-02' AND '2025-06-02' <= b.toDate;

--- which rooms are booked in hotel X on day D
SELECT UniqueName, RoomNumber FROM Booking b
    NATURAL JOIN Rooms r 
    NATURAL JOIN Hotels h
    WHERE h.HotelName = 'Travelodge'  
        AND b.fromDate <= '2025-06-02' AND '2025-06-02' <= b.toDate;
