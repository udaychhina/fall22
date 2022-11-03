const { EOL } = require("os");
const { Transform } = require("stream");

let profit = 0;
const sumProfit = () => {
    return new Transform({
        objectMode: true,
        transform: function (chunk, enc, push) {
            const obj = JSON.parse(chunk);
            profit += parseFloat(obj.profit);
            push(null);
        },
        flush: function (push) {
            push(null, "$" + String(Math.floor(profit)) + EOL);
        },
    });
};

module.exports = { sumProfit };