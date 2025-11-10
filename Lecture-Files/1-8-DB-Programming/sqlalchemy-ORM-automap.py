from sqlalchemy import create_engine, select
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from MyPassword import MyPassword as pw

# PostgreSQL connection URL
DATABASE_URL = "postgresql://postgres:" + pw + "@localhost:5432/postgres"
engine = create_engine(DATABASE_URL, echo=False)

Base = automap_base()
Base.prepare(autoload_with=engine)

# tables and attributes are by default lowwer case in PostgreSQL
Hotel = Base.classes.hotels
Airport = Base.classes.airports

with Session(engine) as session:
    stmt = (
        select(
            Hotel.uniquename,
            Hotel.hotelname,
            Hotel.city,
            Airport.airport,
            Airport.name.label("AirportName"),
        )
        .join(Airport, Hotel.city == Airport.city, isouter=True)
    )
    for row in session.execute(stmt):
        print(row)