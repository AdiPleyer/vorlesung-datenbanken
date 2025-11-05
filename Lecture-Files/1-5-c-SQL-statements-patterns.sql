--- Pattern matching
--- LIKE operator with % and _ wildcards

SELECT eeid, fullname, jobTitle FROM employees
    WHERE jobTitle LIKE 'Admin';

SELECT eeid, fullname, jobTitle FROM employees
    WHERE jobTitle LIKE '%Admin%';

SELECT * FROM hotels
    WHERE hotelName LIKE '%Inn%';


--- simple pattern matching with wildcards
SELECT eeid, fullname FROM employees
    WHERE fullname LIKE '_%D%a%';
SELECT eeid, fullname FROM employees
    WHERE fullname LIKE '_%d%a%';

SELECT eeid, fullname FROM employees
    WHERE upper(fullname) LIKE '_% %D%A%';

--- LIKE and escaping special characters
INSERT INTO hotels VALUES 
    ('WSL-HolidayInn', 'Holliday_Inn', 'Wiesloch', '2', 'Germany', 'free');
SELECT * FROM hotels
    WHERE hotelName LIKE '%_%';  
SELECT * FROM hotels
    WHERE hotelName LIKE '%\_%' ESCAPE '\';  
DELETE FROM hotels
    WHERE UniqueName = 'WSL-HolidayInn';


--- SIMILAR TO operator with patterns
SELECT eeid, fullname FROM employees
    WHERE fullname SIMILAR TO '_% %(D|d)%a%';

select * from (
    select eeid, fullname, substring(fullname similar '_% #"%(D|d)%a%#"' escape '#') as partialname
        FROM employees) as x
    WHERE partialname > '';

select * from (
    select *, substring(hotelName similar '#"%#" Inn%' escape '#') as partialname
        FROM hotels) as x
    WHERE partialname > '';
