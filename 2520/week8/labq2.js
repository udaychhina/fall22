const readline = require('readline');
const { createReadStream, createWriteStream } = require('fs')
const { Transform } = require('stream');
const { EOL } = require('os');

const ws = createWriteStream("result.ndjson")
// const ws = process.stdout

const parseData = new Transform({
    objectMode: true,
    transform: function (chunk, encoding, callback) {
        try {
            const parsedObj = JSON.parse(chunk);
            callback(null, String(parsedObj.firstName + EOL))
        } catch (error) {
            return callback(null, chunk + EOL)
        }
    },
});

async function processLineByLine() {
    const fileStream = createReadStream('firstNames.ndjson');
    const r1 = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });

    for await (const line of r1) {
        parseData.write(line);
    }
}

processLineByLine();

parseData.pipe(ws)