--- no date cleanup necessary
--- when inserting the US forma, it is automatically trnslated into standard YYYY-MM-DD format

--- select the different entry dates in MM-DD format
select distinct cast(extract(month from hiredate) as varchar) || '-' || cast(extract(day from hiredate) as varchar) as entryday 
    from employees order by entryday;

