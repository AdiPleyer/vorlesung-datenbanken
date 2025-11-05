--- example of SELECT ... FOR UPDATE with CTE
--- lock 5 hotels with rating 5 and increase their rating by 10
--- this way we can avoid long transactions and can process the updates in smaller chunks
--- repeat the following until all hotels with rating 5 are updated

SELECT count(*) FROM hotels WHERE rating = 5;
--- while count > 0 ... run the following transaction

    BEGIN WORK;
    WITH myhotels AS (
      SELECT h.ctid FROM hotels AS h
        WHERE h.rating = 5
        FOR UPDATE
        LIMIT 5
    )
    UPDATE hotels h SET rating = rating + 10
      FROM myhotels AS mh
      WHERE mh.ctid = h.ctid;
    COMMIT WORK;

--- end while
