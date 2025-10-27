
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






--- Tasks on employees

--- 1) List all active employees, highest salary first.

SELECT FullName, Department, JobTitle, AnnualSalary
FROM Employees
WHERE ExitDate IS NULL
ORDER BY AnnualSalary DESC, FullName;

--- 2) How many employees are in each department?

SELECT Department, COUNT(*) AS employee_count
FROM Employees
GROUP BY Department
ORDER BY employee_count DESC, Department;

--- 3) What’s the average salary per department (active employees only)?

SELECT Department, ROUND(AVG(AnnualSalary)::numeric, 2) AS avg_salary
FROM Employees
WHERE ExitDate IS NULL
GROUP BY Department
ORDER BY avg_salary DESC;

--- 4) Who are the top 5 highest-paid people in each department?

SELECT Department, FullName, JobTitle, AnnualSalary
FROM (
  SELECT e.*,
         DENSE_RANK() OVER (PARTITION BY Department ORDER BY AnnualSalary DESC) AS rnk
  FROM Employees e
) t
WHERE rnk <= 5
ORDER BY Department, AnnualSalary DESC, FullName;

--- 5) Show everyone hired in calendar year 2023.

SELECT EEID, FullName, Department, HireDate
FROM Employees
WHERE HireDate >= DATE '2023-01-01' AND HireDate < DATE '2024-01-01'
ORDER BY HireDate, FullName;

--- 6) What’s the gender pay comparison by department (avg M vs F and the gap)?

SELECT
  Department,
  ROUND(AVG(AnnualSalary) FILTER (WHERE Gender ILIKE 'M%')::numeric, 2) AS avg_male_salary,
  ROUND(AVG(AnnualSalary) FILTER (WHERE Gender ILIKE 'F%')::numeric, 2) AS avg_female_salary,
  ROUND(
    (AVG(AnnualSalary) FILTER (WHERE Gender ILIKE 'M%')
     - AVG(AnnualSalary) FILTER (WHERE Gender ILIKE 'F%'))::numeric, 2
  ) AS gender_gap_m_minus_f
FROM Employees
WHERE ExitDate IS NULL
GROUP BY Department
ORDER BY gender_gap_m_minus_f DESC NULLS LAST, Department;

--- 7) What’s the attrition rate by department (exited ÷ total)?

SELECT
  Department,
  COUNT(*) FILTER (WHERE ExitDate IS NOT NULL) AS exited,
  COUNT(*) AS total,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE ExitDate IS NOT NULL) / NULLIF(COUNT(*), 0),
    2
  ) AS attrition_pct
FROM Employees
GROUP BY Department
ORDER BY attrition_pct DESC NULLS LAST, Department;

--- 8) For each employee, calculate the expected bonus amount from BonusPercent.

SELECT
  FullName,
  AnnualSalary,
  BonusPercent,
  ROUND(
    AnnualSalary * COALESCE(NULLIF(regexp_replace(BonusPercent, '[^0-9\.]', '', 'g'), ''), '0')::numeric / 100.0,
    2
  ) AS bonus_amount
FROM Employees
ORDER BY bonus_amount DESC, FullName;


--- 9) What is the median salary overall and per department?

-- Overall median
SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY AnnualSalary) AS median_salary
FROM Employees;

-- Median by department
SELECT Department,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY AnnualSalary) AS median_salary
FROM Employees
GROUP BY Department
ORDER BY median_salary DESC, Department;


