--- multiple steps to handle duplicate full names - determin and add -Smith to the last name 
--- 1. determine duplicate fullnames

select fullname from employees
    group by fullname
    having count(fullname) > 1
    order by fullname;

--- 2. determine employees with duplicate fullnames

select id, fullname, firstname, lastname
    from employees
    where fullname in (
        select fullname from employees
            group by fullname
            having count(fullname) > 1)
    order by fullname;

--- 3. separate one of the duplicates, the one with higher id

select id, fullname, firstname, lastname
    from employees as e
    where fullname in (
        select fullname from employees
            group by fullname
            having count(fullname) > 1)
        and id = (select max(id) from (select id from employees e3 where e3.fullname = e.fullname) as eid)
    order by fullname;

--- 4. update lastname

update employees set lastname = lastname || '-Smith'
    where id in (
        select id
            from employees as e
            where fullname in (
                select fullname from employees
                    group by fullname
                    having count(fullname) > 1)
                and id = (select max(id) from (select id from employees e3 where e3.fullname = e.fullname) as eid)
    );


--- namesplit in PostgreSQL
select fullname, substr(fullname,1,strpos(fullname,' ')) as fn, substr(fullname,strpos(fullname,' ')+1) as ln 
    from Employees;

--- namesplit in SQLite
select fullname, substr(fullname,1,instr(fullname,' ')) as fn, substr(fullname,instr(fullname,' ')+1) as ln 
    from Employees;



--- duplicate and tripple EEIDs
select eeid, count(eeid) from employees
    group by eeid
    having count(eeid) > 1;

--- identify the employees with highest eeid duplicates
select fullname, eeid from employees e
    where eeid in (
        select eeid from (
            select eeid, count(eeid) from employees
                group by eeid
                having count(eeid) > 1) a1)
        and id = (select max(id) from (select id from employees e3 where e3.eeid = e.eeid) as eid)
    order by eeid;

--- add a suffix to duplicate eeids - run twice with A for the doubles and B for the tripples
update employees as e1 
    set eeid = eeid || 'A'
    where eeid in (
        select eeid from (
            select eeid, count(eeid) from employees
                group by eeid
                having count(eeid) > 1) a1)
        and id = (select max(id) from (select id from employees e3 where e3.eeid = e1.eeid) as eid);

update employees as e1 
    set eeid = eeid || 'B'
    where eeid in (
        select eeid from (
            select eeid, count(eeid) from employees
                group by eeid
                having count(eeid) > 1) a1)
        and id = (select max(id) from (select id from employees e3 where e3.eeid = e1.eeid) as eid);

