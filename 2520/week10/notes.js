/*****************************************************************************/
// How the frameworks for servers work (like Flask):
// We want to build a web server. What is a difference between a web server
// and a server? 
// Web servers are of two types:

    // STATIC: Not as capabale as applicatoin web servers. Just send the file
    // requested back to the node that requested the data. Apache, Nginx. They
    // just have one task: Look for a file and send it back. The server knows
    // what the file is based on the URL that the request sends. Three things
    // happen when the data is sent back.  (Apache)
    // 1. The HTML code
    // 2. The type of the file
    // 3. The status code for the response. 

    // APPLICATION: They are web servers that are made by a programming
    // language. If we make the server ourselves, we got total control over
    // what is being server to the request. This is a framework and it is very
    // difficult to make servers ourselves without these. 

/*****************************************************************************/
// Stuff we've looked at so far:
// process -> process.argv
// fs -> readFile, writeFile, mkdir
// os -> os.EOL, os.cpus()
// stream -> Transform(), pipeline

// We have a few options in Nodejs
// Option 1: const net = require("net"); create a tcp server.
// Option 2: const http = require("http"); it sits on top of the tcp server
// and it does a little bit of the tcp stuff for you. (middle ground)
// Option 3: Install a framework that sits on top of the http and does a lot
// the stuff for you. 
/*****************************************************************************/

const { fstat } = require("fs");
const http = require("http");
const { createReadStream, createWriteStream } = require("fs")
const qs = require("querystring")

const server = http.createServer((req, res) => {
    // this matches our understanding of http: gets a requrest and sends a
    // response back to the source.
    // GET case
    if (req.method === "GET") {
        // Step 1: We need to tell the server what kind of data we are sending
        // back to it. 
        // Step 2: Specify the status code of the response. 200, 404, etc.
        res.writeHead(200, {"Content-Type": "text/html"})
        // Step 3: Look for the file on the hard drive, and read it, and send
        // it back to the browser in the form of the response.
        // the req and res are the soclet connection. They are combined
        // together into one single stream, called the duplex stream.
        createReadStream("index.html", "utf-8").pipe(res);
    } else {// POST case
        // Step 1: get access to whatever the user typed in the HTML form ->
        // using a stream
        // listen for the data event for the stream
        let data = ""
        //req is a readable stream. 
        req.on('data', (chunk) => {
            data += chunk;
            console.log(data)
        })
        // and the listen to the end event. We want to take the data from the
        // body, give it to the qs module (qs.parse()), and then do something with it.
        // qs.parse()
        // body="username=user123password=user123"
        // send it back to the browser html that says <p> Hello john123</p>

        // req is a readable stream. 
        req.on('end', () => {
            const parsedBOdy = qs.parse(data)
            res.writeHead(200, {"Content-Type": "text/html"});
            res.end(`<h1>Thanks ${parsedBOdy.username} ${parsedBOdy.password} </h1>`)      
        })
    }
})

// what is the port number? the specific instance of the framework server that
// is running on the server IP address. 
server.listen(8081, () => {
    console.log("Server is now running.")
})