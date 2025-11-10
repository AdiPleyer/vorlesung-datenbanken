import sqlite3

# connect to database, no credentials needed since local
con = sqlite3.connect("../../Database-SQLite/DB-WWI24IMBITA-2025.db")

# create a cursor
cur = con.cursor()

res = cur.execute("""
    SELECT * FROM Hotels where country = 'Germany';
""")

columns = cur.description

# access column names
for col in columns:
    print(col[0])  # column name
print('---')

# looping over the result set "consumes" the cursor
for r in res:
    line = ''
    for s in r:
        line += f"| {s}" + ' ' * 3
    print(line)

