const fs = require("fs").promises;
const { createReadStream } = require("fs")
const { DEFAULT_HEADER } = require("./util/util");
const path = require("path");
var qs = require("querystring");
const ejs = require("ejs")

const controller = {
    getHomepage: async (request, response) => {
        let rawData = await fs.readFile("./database/data.json", "utf-8", (err, data) => {
            if (err) console.log(err)
        })
        jsonData = JSON.parse(rawData)
        response.writeHead(200, DEFAULT_HEADER);
        ejs.renderFile("./src/views/index.ejs", { jsonData }, (err, str) => {
            if (err) {
                console.log(err)
            } else {
                response.end(str)
            }
        })
    },
    getFormPage: (request, response) => {
        return response.end(`
    <h1>Hello world</h1> <style> h1 {color:red;}</style>
    <form action="/form" method="post">
    <input type="text" name="username"><br>
    <input type="text" name="password"><br>
    <input type="submit" value="Upload">
    </form>
    `);
    },
    sendFormData: (request, response) => {
        var body = "";

        request.on("data", function (data) {
            body += data;
        });

        request.on("end", function () {
            var post = qs.parse(body);
            console.log(post);
        });
    },
    getFeed: (request, response) => {
        // console.log(request.url); try: http://localhost:3000/feed?username=john123
        response.write(`    `);
        response.end();
    },
    uploadImages: (request, response) => { },
};

module.exports = controller;
