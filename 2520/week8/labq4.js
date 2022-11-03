const { createReadStream, createWriteStream } = require("fs");
const { createGunzip } = require("zlib");
const { pipeline, Transform } = require("stream");
const ndjson = require("ndjson")
const gunzip = createGunzip()
const afinnJSON = require("./AFINN.json")
const sort = require("sort-stream2");

const filterSpam = () => {
    return new Transform({
        objectMode: true,
        transform: function (chunk, enc, push) {
            if (chunk.class == 0) {
                push(null, chunk)
            } else {
                push(null)
            }
        }
    })
}

const checkPositivity = () => {
    return new Transform({
        objectMode: true,
        transfrom: function (chunk, enc, push) {
            let reviewText = chunk.reviewText.split(" ");
            for(word in reviewText) {
                if (afinnJSON.includes(word)) {
                    chunk.score += afinnJSON[word];
                } else {
                    chunk.score += 0;
                }
            }
            push(null, JSON.stringify(chunk))
        }
    })
}

pipeline(
    createReadStream("test.ndjson"),
    // .on('data', (data) => console.log(data.toString())),
    // gunzip,
    ndjson.parse(),
    // .on("data", (data) => console.log(data.toString())),
    filterSpam(),
    checkPositivity(),
    sort(function (a, b) { return JSON.parse(a).score - JSON.parse(b).score }),
    createWriteStream("filteredData.ndjson"),
    function(err) {
        console.log(err);
    }
)