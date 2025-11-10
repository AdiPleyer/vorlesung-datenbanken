const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config();

const connectDb = async () => {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        })
        await client.connect()

        const var_country = 'Thailand';
        const res = await client.query(`SELECT name, city, rating FROM hotels WHERE country = '${var_country}' ORDER BY name;`);
        
        console.log(res.rows);
        console.log("==========================");
        // res.fields.forEach(f => console.log(f.name));

        res.rows.forEach(function (r) {
            for (const key in r) {
                console.log(`${key}: ${r[key]}`);
            }
            console.log("------------------------");
        });

        console.log(`Number of records selected: ${res.rowCount}`);

        await client.end()
    } catch (error) {
        console.log(error)
    }
}

connectDb();
