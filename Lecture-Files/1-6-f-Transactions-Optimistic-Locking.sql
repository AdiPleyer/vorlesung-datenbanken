--- demo for optimistic locking
--- add timestamp to every record

CREATE TABLE accounts_opt (
    id            INT PRIMARY KEY,
    owner         VARCHAR(200) NOT NULL,
    balance       DEC(10,2) NOT NULL,
    last_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into accounts_opt (id, owner, balance) values (12, 'A', 1000);
insert into accounts_opt (id, owner, balance) values (14, 'B', 0);
insert into accounts_opt (id, owner, balance) values (16, 'C', 500);
insert into accounts_opt (id, owner, balance) values (18, 'D', 20000);

--- do not lock the record to be updated. Instead, read the timestamp
--- when updating, check the timestamp and update it as well

SELECT * FROM accounts_opt WHERE id = 12;
--- remember the timestamp

BEGIN WORK;
    WITH diff AS (SELECT -4500 as amount)
    UPDATE accounts_opt
        SET balance = balance + (select amount from diff),
            last_modified = CURRENT_TIMESTAMP
            WHERE id = 12
            AND balance + (select amount from diff) > 0
            AND last_modified = '2025-11-05 18:19:17.229608'
            returning *;
COMMIT WORK;


SELECT * FROM accounts_opt WHERE id = 12 
--- remember the timestamp

BEGIN WORK;
    UPDATE accounts_opt
        SET balance = balance + (-100),
            last_modified = CURRENT_TIMESTAMP
            WHERE id = 12
            AND balance + (-100) >= 0
            AND last_modified = '2025-11-06 12:15:08.004901'
            returning *;
COMMIT WORK;
--- if nothing returned, resolve the problem
