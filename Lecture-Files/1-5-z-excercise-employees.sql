
--- a. select employees with duplicate full names along with their country average salary and ratio

select id, fullname, e.country, annualsalary, cas, annualsalary / cas
    from employees as e, (select country, avg(annualsalary) as cas from employees group by country) as countryaverages
    where fullname in (
        select fullname from employees
            group by fullname
            having count(fullname) > 1)
        and e.country = countryaverages.country;

--- b. employees with duplicate salaries...

select annualsalary, count(annualsalary) from employees
    group by annualsalary
    having count(annualsalary) > 1;

select id, fullname, annualsalary from employees
    where annualsalary in (
        select annualsalary from employees
            group by annualsalary
            having count(annualsalary) > 1)
    order by annualsalary;

--- c. stats on employees

select country, ethnicity, gender, count(*)
    from employees
    group by country, ethnicity, gender
    order by country, ethnicity, gender;

--- d. pairs of empoloyees with same job and with salary differing by 2% - avoid duplicate listing

select e1.eeid, e1.fullname, e1.annualsalary, e2.eeid, e2.fullname, e2.annualsalary, e1.JobTitle, e1.department, e1.country
    from employees as e1, employees as e2
        where e1.eeid < e2.eeid
        and e1.JobTitle = e2.JobTitle
        and e1.department = e2.department
        and e1.country = e2.country
        and (e1.annualsalary between e2.annualsalary * 0.98 and e2.annualsalary * 1.02)
    order by e1.eeid, e2.eeid;

