# Dump the table to a file
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dump -U postgres -d postgres \
  -t public.employees \
  --column-inserts \
  --no-owner \
  --no-privileges \
  -f C4-Employees-dump.sql


# reload the table
psql -h localhost -U postgres -d mydatabase -f C4-Employees-dump.sql

