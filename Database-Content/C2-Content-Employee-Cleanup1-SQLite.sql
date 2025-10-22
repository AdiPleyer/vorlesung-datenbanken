--- cleanup the date format, SQLite needs the standard YYYY-MM-DD format, insert leaves 

update employees set hiredate = printf(
    '%04d-%02d-%02d',
    substr(hiredate, length(hiredate) - 3, 4),                    -- YEAR (last 4 chars)
    substr(hiredate, 1, instr(hiredate, '/') - 1),                -- MONTH (before first '/')
    substr(                                                      -- DAY (between the two '/')
      hiredate,
      instr(hiredate, '/') + 1,
      (length(hiredate) - 4) - (instr(hiredate, '/') + 1)         -- (pos of 2nd slash) - (start of day)
    )
  );


--- select the different entry dates in MM-DD format
select distinct strftime('%d-%m', hiredate) as entryday
    from employees order by entryday;
