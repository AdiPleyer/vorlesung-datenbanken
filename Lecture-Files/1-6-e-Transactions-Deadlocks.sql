--- preparations

DROP TABLE accounts;
CREATE TABLE accounts (
  ID varchar(3) primary key,
  balance int
  );

insert into accounts values ('A', 100);
insert into accounts values ('B', 11);
insert into accounts values ('C', 13);
insert into accounts values ('D', 17);

select * from accounts order by id;


--- Transaction 1 - transfer 100 from A to B

begin work;

SELECT balance FROM accounts WHERE accounts.id = 'A' for update;

update accounts set balance = balance - 100 where id = 'A';

update accounts set balance = balance + 100 where id = 'B';

commit work;

--- Transaction 2 - transfer 50 from B to A

begin work;

SELECT balance FROM accounts WHERE accounts.id = 'B' for update;

update accounts set balance = balance - 50 where id = 'B';

update accounts set balance = balance + 50 where id = 'A';

commit work;



