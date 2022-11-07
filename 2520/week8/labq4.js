const { createReadStream, createWriteStream } = require("fs");
const { pipeline, Transform } = require("stream");
const ndjson = require("ndjson")
const { checkPositivity } = require("./checkPositivity")
const sort = require("sort-stream2");


const filterSpam = () => {
    return new Transform({
        objectMode: true,
        transform: (chunk, enc, push) => {
            if (chunk.class == 0) {
                push(null, chunk)
            } else {
                push()
            }
        }
    })
}

pipeline(
    createReadStream("cellphone.ndjson"),
    ndjson.parse(),
    filterSpam(),
    checkPositivity(),
    sort(function (a, b) { return JSON.parse(a).score - JSON.parse(b).score }),
    createWriteStream("filteredData.ndjson"),
    function (err) {
        console.log(err);
    }
)