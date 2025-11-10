CREATE VIEW attritionrates AS
    with years as (select extract(year from hiredate) as theyear
                        from employees
                        union
                    select extract(year from exitdate) as theyear 
                        from employees
                        where exitdate is not nulL),
        emp_years as (select eeid, 
                        extract(year from hiredate) as hire_year,
                        extract(year from exitdate) as exit_year
                        from employees),
        details as (select e.eeid, 
                    y.theyear,
                    hire_year,
                    exit_year,
                    case when hire_year <= y.theyear and (exit_year is null or exit_year >= y.theyear) then 1 else 0 end as worked_in_this_year,
                    case when exit_year = y.theyear then 1 else 0 end as exited_in_this_year
                from employees e, years y, emp_years ey
                where e.eeid = ey.eeid)
    select  theyear, 
            sum(worked_in_this_year) as workers, 
            sum(exited_in_this_year) as leavers, 
            sum(exited_in_this_year)::float / nullif(sum(worked_in_this_year),0)::float as attrition_rate,
            round(cast (sum(exited_in_this_year)::float / nullif(sum(worked_in_this_year),0) * 100 as numeric), 1) as attrition_rate_percent
        from details
        group by theyear
        order by theyear;
        