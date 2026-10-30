In this folder, an employees table containing raw and not very consistent data is being prepared for reasonable use. Original data was in a CSV file, no unique IDs and also duplicate names. 

Follow the files from C1... to C5 to understand how it had to be fixed and cleansed, consider it an example of a cleansing process and SQL excercise.


- C1 file depending on the database you use. Currently only PostgresQL and SQLite are tested. Since SQLite is a bit special, you can assume that the PostgreSQL file will work for other databases as well, maybe minor changes might be necessary. It includes some initial clean up
- C2 more cleaup independent of database
- C3 is a command to dum the table from PostgreSQL database into a csv file
- C4 the result of the dump
- C5 a bit optimized file which can be uploaded again into PostgreSQL
