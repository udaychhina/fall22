const fs = require("fs").promises;
const { createReadStream, createWriteStream } = require("fs")
const { DEFAULT_HEADER, JPEG_IMAGE_HEADER, PNG_IMAGE_HEADER } = require("./util/util");
const path = require("path");
var qs = require("querystring");
const ejs = require("ejs")
const parseURL = require("url").parse;
const formidable = require("formidable");


const controller = {
    getHomepage: async (request, response) => {
        let rawData = await fs.readFile("./database/data.json", "utf-8", (err, data) => {
            if (err) console.log(err)
        })
        let jsonData = JSON.parse(rawData)
        response.writeHead(200, DEFAULT_HEADER);
        ejs.renderFile("./src/views/index.ejs", { jsonData }, (err, str) => {
            if (err) {
                console.log(err)
            } else {
                response.end(str)
            }
        })
    },
    getFormPage: async (request, response) => {
        return response.end(`
        <h1>Hello world</h1> <style> h1 {color:red;}</style>
        <form action="/form" method="post">
        <input type="text" name="username"><br>
        <input type="text" name="password"><br>
        <input type="submit" value="Upload">
        </form>
        `);
    },
    sendFormData: async (request, response) => {
        var body = "";

        request.on("data", function (data) {
            body += data;
        });

        request.on("end", function () {
            var post = qs.parse(body);
            console.log(`testing post`);
        });
    },
    getFeed: async (request, response) => {
        let rawData = await fs.readFile("./database/data.json", "utf-8", (err, data) => {
            if (err) console.log(err)
        })
        let jsonData = JSON.parse(rawData)

        const { username } = parseURL(request.url, true).query;

        jsonData.forEach(user => {
            if (user.username === username) {
                response.writeHead(200, DEFAULT_HEADER);
                ejs.renderFile("./src/views/user.ejs", { user }, (err, str) => {
                    if (err) {
                        console.log(err)
                    } else {
                        response.end(str)
                    }
                })
            }
        });
    },
    uploadImages: async (request, response) => {
        const { username } = parseURL(request.url, true).query;
        let rawData = await fs.readFile("./database/data.json", "utf-8", (err, data) => {
            if (err) console.log(err)
        })
        const form = new formidable.IncomingForm();
        form.parse(request, (err, fields, files) => {
            if (err) {
                console.log(err);
            }
            filename = files.image.originalFilename;
            oldPath = files.image.filepath;
            newPath = path.join(__dirname, "photos", username, filename);
            createReadStream(oldPath).pipe(createWriteStream(newPath));

            let jsonData = JSON.parse(rawData)

            jsonData.forEach(user => {
                if (user.username === username) {
                    user.photos.push(filename)
                }
            });
            mJsonData = JSON.stringify(jsonData)
            fs.writeFile("./database/data.json", mJsonData, (err) => {
                if (err) console.log(err)
                console.log("Photo uploaded")
            })
        });
    },
};

module.exports = controller;
