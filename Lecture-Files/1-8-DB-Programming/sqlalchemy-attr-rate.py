from sqlalchemy import create_engine, MetaData, Table, select
from MyPassword import MyPassword as pw
import matplotlib.pyplot as plt

# prepare the database access
# never share the password, but there are more solid ways to handle it ...
DATABASE_URL = "postgresql://postgres:" + pw + "@localhost:5432/postgres"

engine = create_engine(DATABASE_URL)
metadata = MetaData()

# Reflect only the attritionrates table (which is actually a view ...)
# no need to specify the table structure in the code
Attritions = Table("attritionrates", metadata, autoload_with=engine)

def main():
    # Query the Hotels table
    with engine.connect() as conn:
        stmt = select(Attritions)
        rows = conn.execute(stmt).fetchall()

        for row in rows:
            print(row)

        # move the selected values into arrays for plotting
        year_values = []
        attr_values = []
        empl_values = []
        for row in rows:
            year_values.append(row[0])
            attr_values.append(row[4] * 100)
            empl_values.append(row[1])
        print("Years", year_values)
        print("Attrition %", attr_values)
        print("Employees", empl_values)

        # do the plotting
        plt.plot(year_values, attr_values)
        plt.plot(year_values, empl_values)
        plt.title("Attrition Rates and Employees")
        plt.show()

if __name__ == "__main__":
    main()