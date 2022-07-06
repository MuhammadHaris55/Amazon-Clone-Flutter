console.log("install dependencies")

const express = require("express");

const PORT = 3000;
const app = express();

app.get("/hello-world", (req, res) => {
    res.send({hi: "hello world"});
});

app.get("/", (req, res) => {
    res.send({"name": "Muhammad Haris"});
})


app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected at port ${PORT}`);
})