const { MongoClient } = require('mongodb');

const { myMongoUri } = require('./mongoUri.js');
// I store the MongoDB URI in a separate file, for productive use you should use environment variables or a config file that is not shared via git
// const myMongoUri = "mongodb+srv://Cluster79620:MYOWNPASSWORD@cluster79620.vqi5ewg.mongodb.net/?appName=Cluster79620"


async function listDatabases(client) {
    databasesList = await client.db().admin().listDatabases();

    console.log("Databases:");
    databasesList.databases.forEach(function (db) {
        console.log(` - ${db.name}`);
        console.log(db);
    })
};

async function listRegistrations1(client) {
    regCol = await client.db("test").collection("regs");
    cursor = await regCol.find({"team.name": "TSG Dossenheim"});

    const results = await cursor.toArray();
    results.forEach(r => console.log('1: ' + r._id + ' ' + r.team.name));
}

async function listRegistrations2(client) {
    regCol = await client.db("test").collection("regs");
    cursor = await regCol.find({"team.name": "TSG Dossenheim"});

    await cursor.forEach(doc => console.log('2: ' + doc._id + ' ' + doc.team.name));
}

async function listRegistrations3(client) {
    regCol = await client.db("test").collection("regs");
    cursor = await regCol.find({"team.name": "TSG Dossenheim"});

    for await (const doc of cursor) {
        console.log('3: ' + doc._id + ' ' + doc.team.name);
    }
}


async function main() {
    const client = new MongoClient(myMongoUri);

    try {
        // Connect to the MongoDB
        await client.connect();

        await listDatabases(client);
        await listRegistrations1(client);
        await listRegistrations2(client);
        await listRegistrations3(client);

    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}

main().catch(console.error);
