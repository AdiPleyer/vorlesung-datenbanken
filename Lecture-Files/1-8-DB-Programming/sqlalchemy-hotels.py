from sqlalchemy import create_engine, MetaData, Table, Column, String, Integer, insert, select
from MyPassword import MyPassword as pw

# PostgreSQL connection URL
DATABASE_URL = "postgresql://postgres:" + pw + "@localhost:5432/postgres"

# Create engine
engine = create_engine(DATABASE_URL)

# Metadata
metadata = MetaData()

# Define the Hotels table - in this case, the application defines the database structure(s)
HotelsAlch = Table(
    "hotelsalch",
    metadata,
    Column("UniqueName", String(50), primary_key=True),
    Column("HotelName", String(50)),
    Column("City", String(50)),
    Column("Rating", Integer, default=1),
    Column("Country", String(50)),
    Column("WiFi", String(5), default="no"),
)

def main():
    # Create table if it doesn't exist
    metadata.create_all(engine)

    # Insert a record
    with engine.connect() as conn:
        stmt = insert(HotelsAlch).values(
            UniqueName="hotel_008",
            HotelName="Seaside Inn",
            City="Malibu",
            Rating=4,
            Country="USA",
            WiFi="yes"
        )
        try:
            conn.execute(stmt)
            conn.commit()
        except Exception as e:
            print("Insert skipped or failed:", e)

    # Query records
    with engine.connect() as conn:
        stmt = select(HotelsAlch)
        result = conn.execute(stmt)
        for row in result.fetchall():
            print(f"Name: {row.UniqueName}, Hotel: {row.HotelName}, City: {row.City}, Rating: {row.Rating}, WiFi: {row.WiFi}")

if __name__ == "__main__":
    main()
    