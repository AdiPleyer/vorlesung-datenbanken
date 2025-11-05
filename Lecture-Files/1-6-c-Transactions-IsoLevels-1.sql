--- Ex 1: parallel work

begin work;  

    SELECT balance FROM account WHERE account.id = "A";

    update account set balance = balance - 100 where id = "A";

    update account set balance = balance + 100 where id = "B";

commit work;


--- Ex 2: dirty read?


BEGIN WORK ISOLATION LEVEL READ UNCOMMITTED;


SELECT balance FROM account WHERE id = 'A';




SELECT balance FROM account WHERE id = 'A';


COMMIT WORK;

SELECT balance FROM account WHERE id = 'A';










--- Ex 3: read committed vs. non-repeatable read

BEGIN WORK;
BEGIN WORK ISOLATION LEVEL READ COMMITTED;
BEGIN WORK ISOLATION LEVEL REPEATABLE READ;

SELECT balance FROM accounts WHERE id = 'A';





SELECT balance FROM accounts WHERE id = 'A';


COMMIT WORK;


--- Ex 4: phantom read

begin work;
BEGIN WORK ISOLATION LEVEL REPEATABLE READ;
BEGIN WORK ISOLATION LEVEL SERIALIZABLE;


SELECT * FROM accounts WHERE id BETWEEN 'A' AND 'L';


SELECT * FROM accounts WHERE id BETWEEN 'A' AND 'L';



