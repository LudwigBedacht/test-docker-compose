const express = require('express');

const MongoClient = require('mongodb').MongoClient;

const app = express();

const url = "mongodb://mongo:27017";

app.get('/', async (req, res, next) => {
    let client;
    try {
        client = await MongoClient.connect(url);
        let db = client.db('test');
        let rand = db.collection('rand');
        const result = await rand.insertOne({
            value: Math.random()
        })
        console.log("Result", result);
        res.status(200).send(result);
    } catch (error) {
        next(error);
    }
    finally{
        client.close();
    }
});

app.listen(3000, () => {
    console.log('Listening to 3000');
    console.log("test");
})