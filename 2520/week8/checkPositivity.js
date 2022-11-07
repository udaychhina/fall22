const { Transform } = require("stream");
const afinnJSON = require("./AFINN.json");
const { EOL } = require("os");


const checkPositivity = () => {
    let count = 0
    return new Transform({
        objectMode: true,
        transform: (chunk, enc, push) => {
            const reviewText = chunk.reviewText.split(" ");
            chunk.score = 0
            for (word of reviewText) {
                if (Object.keys(afinnJSON).includes(word)) {
                    chunk.score += parseInt(afinnJSON[word]);
                } else {
                    chunk.score += 0;
                }
            }
            console.log(`${count} lines written...`)
            count += 1
            push(null, JSON.stringify(chunk) + EOL)
        }
    })
}

module.exports = { checkPositivity }