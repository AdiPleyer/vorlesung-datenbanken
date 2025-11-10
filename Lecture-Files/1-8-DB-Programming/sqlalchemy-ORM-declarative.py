from sqlalchemy import create_engine, String, Integer, select
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, Session
from MyPassword import MyPassword as pw

# PostgreSQL connection URL
DATABASE_URL = "postgresql://postgres:" + pw + "@localhost:5432/postgres"
engine = create_engine(DATABASE_URL, echo=False)

class Base(DeclarativeBase):
    pass

# tables and attributes are by default lowwer case in PostgreSQL
class Hotel(Base):
    __tablename__ = "hotels"
    uniquename: Mapped[str] = mapped_column(String(50), primary_key=True)
    hotelname:  Mapped[str] = mapped_column(String(50))
    city:       Mapped[str] = mapped_column(String(50))
    rating:     Mapped[int] = mapped_column(Integer, default=1)
    country:    Mapped[str] = mapped_column(String(50))
    wifi:       Mapped[str] = mapped_column(String(5), default="no")

class Airport(Base):
    __tablename__ = "airports"
    airport:   Mapped[str] = mapped_column(String(5), primary_key=True)
    name:      Mapped[str] = mapped_column(String(50))
    city:      Mapped[str] = mapped_column(String(50))
    country:   Mapped[str] = mapped_column(String(50))
    Terminals: Mapped[int] = mapped_column(Integer)

def main():
    with Session(engine) as session:
        stmt = (
            select(
                Hotel.uniquename,
                Hotel.hotelname,
                Hotel.city,
                Airport.airport,
                Airport.name.label("AirportName"),
            )
            .join(Airport, Hotel.city == Airport.city)   # inner join on City
        )
        for row in session.execute(stmt):
            print(row)

        print('---')

        # Example: LEFT OUTER JOIN (all hotels, airport if any)
        left_stmt = (
            select(Hotel.hotelname, Hotel.city, Airport.airport, Airport.name)
            .join(Airport, Hotel.city == Airport.city, isouter=True)
        )
        for row in session.execute(left_stmt):
            print(row)

if __name__ == "__main__":
    main()