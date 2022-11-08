const { fstat } = require("fs");
const http = require("http");
const { createReadStream, createWriteStream } = require("fs")
const qs = require("querystring")

const server = http.createServer((req, res) => {
    if (req.method === "GET") {
        if (req.url === '/contact.html') {
            res.writeHead(200, { "Content-Type": "text/html" })
            createReadStream("contact.html", "utf-8").pipe(res);
        } else {
            res.writeHead(200, { "Content-Type": "text/html" })
            createReadStream("index.html", "utf-8").pipe(res);
        }
    } else {
        let temp = 0
        let data = ""
        req.on('data', (chunk) => {
            data += chunk
        })
        req.on('end', () => {
            const parsedData = qs.parse(data)            
            if ("ctof" in parsedData) {
                temp = (parsedData.num1 * (9/5)) + 32
            } else if ("ftoc" in parsedData) {
                temp = (parsedData.num1 - 32) * (5/9)
            }
            res.writeHead(200, { "Content-Type": "text/html" });
            res.end(`
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">
                <link rel="stylesheet" type="text/css" href="styles.css">
                <title>Index</title>
            </head>

            <body>
                <header>
                    <p>
                        <a href="index.html">Home</a>  <a href="contact.html">Contact
                        Us</a>
                        <br>
                    </p>      
                        <form action="" method="post">
                            <input type="text" name="num1"> <span class="display">${temp}</span>
                            <p>
                                <button type="submit" name="ctof">C -> F</button>
                                <button type="submit" name="ftoc">F -> C</button>
                            </p>
                        </form>
                </header>
                <main>
                </main>
                <footer>
                </footer>
                <script src="scripts.js"></script>
            </body>

            </html>
            `)
        })
    }
})

server.listen(8081, () => {
    console.log("Server is now running.")
})