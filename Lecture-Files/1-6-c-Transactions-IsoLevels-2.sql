--- Ex 1: parallel work

begin work;  

    SELECT balance FROM account WHERE account.id = "A";

    update account set balance = balance - 100 where id = "A";

    update account set balance = balance + 100 where id = "B";

commit work;


--- Ex 2: dirty read?


BEGIN WORK ISOLATION LEVEL READ UNCOMMITTED;




UPDATE account SET balance = balance - 500 WHERE id = 'A';



ROLLBACK WORK;












--- Ex 3: non-repeatable read

BEGIN WORK;


UPDATE accounts SET balance = balance - 500 WHERE id = 'A';

SELECT balance FROM accounts WHERE id = 'A';

commit work;





--- Ex 4: phantom read


begin work;


INSERT INTO accounts VALUES ('JJJ', 12000000);

SELECT * FROM accounts;

COMMIT WORK;













