import sqlite3

# connect to database, no credentials needed since local
con = sqlite3.connect("../../Database-SQLite/DB-WWI24IMBITA-2025.db")

# get a cursor
cur = con.cursor()

allowed_country = 'Germany'
oncemore = True

while (oncemore):
    print()
    print(f"""Select your hotel (you will see only hotels in {allowed_country})""")
    hotel_input = input()
    if hotel_input.lower() == 'xxx':
        oncemore = False
    else:
        res = cur.execute(f"""
            SELECT hotelName, country, rating FROM Hotels
                WHERE hotelName like '%{hotel_input}%' AND Country = '{allowed_country}';
        """)

        for r in res:
            print(r)
    print()
    print()

# %' or '' <= '
# ' or true or '
# ' or 1 in (update hotels set rating = rating + 1 where rating <=5) or '
# '; update hotels set rating = rating + 1 where rating <=5; 
