
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

insert into accounts values ('E', 1000000);
insert into accounts values ('F', 4444444);
insert into accounts values ('H', 333);
insert into accounts values ('G', 888888);

select * from accounts order by id;


--- updates

begin work;

SELECT balance FROM accounts WHERE accounts.id = 'A' for update;

update accounts set balance = balance - 100 where id = 'A';
update accounts set balance = balance + 100 where id = 'B';

commit work;


update accounts set balance = balance - 10 where id = 'B';
update accounts set balance = balance + 10 where id = 'A';




--- transaction 1

begin work;  
SELECT balance FROM accounts WHERE accounts.id = 'A';
update accounts set balance = balance - 100 where id = 'A';
update accounts set balance = balance + 100 where id = 'B';
commit work;

