--- Solutions for Excercises on Employees table

--- Employees a: Average salaries in China per department
select department, avg(annualsalary) as avgsalary
    from employees
    where country = 'China'
    group by department
    order by avgsalary desc;

--- Employees b: Stats on all employees, how many per country, ethnicity and gender
select country, ethnicity, gender, count(*) 
    from employees
    group by country, ethnicity, gender
    order by country, ethnicity, gender;

--- Employees c: Stats on all employees, how many per country in which function
select country, department, JobTitle, count(*) as empcount
    from employees
    group by country, department, JobTitle
    order by country, department, JobTitle;

--- Employees d: Employees with same full names along with their country average salary and ratio
--- first, only those names that occur more than once
select fullname from employees
    group by fullname
    having count(fullname) > 1;

--- then combine with country average salaries
select eeid, fullname, e.country, annualsalary, cas, annualsalary / cas as salary_ratio
    from employees as e
         join (select country, avg(annualsalary) as cas 
                    from employees 
                    group by country) as countryaverages
            using(country)
    where fullname in (
        select fullname from employees
            group by fullname
            having count(fullname) > 1);

--- alternative solution with CTE
with duplicate_names as (
        select fullname from employees
            group by fullname
            having count(fullname) > 1),
    country_averages as (
        select country, avg(annualsalary) as cas 
            from employees 
            group by country)
select eeid, fullname, e.country, annualsalary, cas, annualsalary / cas as salary_ratio
    from employees as e
        join country_averages using(country)
    where fullname in (select fullname from duplicate_names);

--- Employees e: Employees with same salaries...
select annualsalary, count(annualsalary) as salarycount
    from employees
    group by annualsalary
    having count(annualsalary) > 1;

--- Employees f: Pairs of employees with same job and with salary differing by 2% - avoid duplicate listing
select e1.eeid, e1.fullname, e1.annualsalary, e2.eeid, e2.fullname, e2.annualsalary, e1.JobTitle, e1.department, e1.country
    from employees as e1, employees as e2
        where e1.eeid < e2.eeid
        and e1.JobTitle = e2.JobTitle
        and e1.department = e2.department
        and e1.country = e2.country
        and (e1.annualsalary between e2.annualsalary * 0.98 and e2.annualsalary * 1.02)
    order by e1.eeid, e2.eeid;

--- Employees g: List all active employees, highest salary first.
select fullname, department, jobtitle, annualsalary
    from employees
    where exitdate is null
    order by fullname;

--- Employees h: How many employees are in each department?
select country, department, count(*) as employee_count
    from employees
    group by country, department
    order by country, count(*) desc;

--- Employees i: What’s the average salary per department (active employees only)?
select country, department, avg(annualsalary) as avg_salary
    from employees
    where exitdate is null
    group by country, department
    order by country, avg_salary desc;

--- Employees j: Who are the top 5 highest-paid people in each department?
select e1.country, e1.department, e1.fullname, e1.jobtitle, e1.annualsalary
    from employees e1
    where e1.eeid in (
        select e2.eeid
            from employees as e2
            where e2.country = e1.country
            and e2.department = e1.department
            and e2.exitdate is null
            order by annualsalary desc
            limit 5)
    order by country, department, annualsalary desc;


--- Employees k: Show everyone hired in calendar year 2020.
select fullname, department, jobtitle, annualsalary, hiredate
    from employees
    where hiredate >= '2020-01-01' and hiredate < '2021-01-01'
    order by hiredate, fullname;

--- in PostgreSQL
select fullname, department, jobtitle, annualsalary, extract (year from hiredate) as hireyear
    from employees
    where extract (year from hiredate) = '2020'
    order by hireyear, fullname;


--- Employees l: What’s the gender pay comparison by department (avg M vs F and the gap)?

--- first step: separate averages, then join
select country, department, avg(annualsalary) as avg_salary_male
        from employees
        where exitdate is null
            and gender = 'Male'
        group by country, department;

select *, avg_salary_male - avg_salary_female as gap_m_f
    from (select country, department, avg(annualsalary) as avg_salary_male
            from employees
            where exitdate is null
                and gender = 'Male'
            group by country, department) as male_avg
    join (select country, department, avg(annualsalary) as avg_salary_female
            from employees
            where exitdate is null
                and gender = 'Female'
            group by country, department) as female_avg
    using (country, department)
    order by country, department;

--- two more compact alternatives using case or filter
select country, department,
       avg(case when gender = 'Male' then annualsalary end) as avg_male,
       avg(case when gender = 'Female' then annualsalary end) as avg_female,
       avg(case when gender = 'Male' then annualsalary end) - avg(case when gender = 'Female' then annualsalary end) as gap_m_f
    from employees
    where exitdate is null
    group by country, department
    order by country, department;

select country, department,
       avg(annualsalary) filter (where gender = 'Male') as avg_male,
       avg(annualsalary) filter (where gender = 'Female') as avg_female,
       avg(annualsalary) filter (where gender = 'Male') - avg(annualsalary) filter (where gender = 'Female') as gap_m_f
    from employees
    where exitdate is null
    group by country, department
    order by country, department;


--- Employees m: What’s the attrition rate by department (exited ÷ total)?

--- collect all years of hire and exit
select extract(year from hiredate) as theyear
                    from employees
                    union
                select extract(year from exitdate) as theyear 
                    from employees
                    where exitdate is not nulL;

--- collect working and exiting flags per employee per year
with years as (select extract(year from hiredate) as theyear
                    from employees
                    union
                select extract(year from exitdate) as theyear 
                    from employees
                    where exitdate is not nulL),
    emp_years as (select eeid, 
        extract(year from hiredate) as hire_year,
        extract(year from exitdate) as exit_year
        from employees)
select  e.eeid, 
        y.theyear,
        hire_year,
        exit_year,
        case when hire_year <= y.theyear and (exit_year is null or exit_year >= y.theyear) then 1 else 0 end as worked_in_this_year,
        case when exit_year = y.theyear then 1 else 0 end as exited_in_this_year
    from employees e, years y, emp_years ey
    where e.eeid = ey.eeid
    order by e.eeid, y.theyear;

--- put all together
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

--- As counter examples, the following two version have been proposed by AI...

--- AI note: attrition rate is often calculated on yearly basis, here we do a simple overall rate
--- NOT WORKIN PROPERLY
select country, department,
       count(*) as total_employees,
       sum(case when exitdate is not null then 1 else 0 end) as exited_employees,
       sum(case when exitdate is not null then 1 else 0 end)::float / count(*) as attrition_rate
    from employees
    group by country, department
    order by country, department;

--- Attrition rate by year of exit - NOT WORKING PROPERLY
select country, department, extract(year from exitdate) as exit_year,
       count(*) as total_employees,
       sum(case when exitdate is not null then 1 else 0 end) as exited_employees,
       sum(case when exitdate is not null then 1 else 0 end)::float / count(*) as attrition_rate
    from employees
    where exitdate is not null
    group by country, department, extract(year from exitdate)
    order by country, department, exit_year;
--- remember: group by is applied before select clause, therefore we can use exit_year alias in order by clause but not in group by clause :-(


--- Employees n: For each employee, calculate the expected bonus amount from BonusPercent.
select eeid, fullname, annualsalary, BonusPercent,
       annualsalary * (BonusPercent / 100.0) as expected_bonus
    from employees
    order by eeid;

--- Employees o: List all employees whose salary is above the average salary for their department.
select e.eeid, e.fullname, e.department, e.annualsalary, dept_avg.avg_salary
    from employees e
        join (select department, avg(annualsalary) as avg_salary
                from employees
                group by department) as dept_avg
            using(department)
    where e.annualsalary > dept_avg.avg_salary
    order by e.department, e.annualsalary desc;

