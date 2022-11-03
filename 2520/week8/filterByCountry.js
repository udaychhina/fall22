const { Transform } = require("stream");

const filterByCountry = (country) => {
    return new Transform({
        objectMode: true,
        transform: function (chunk, enc, push) {
            const obj = JSON.parse(chunk);
            if (obj.country === country) {
                push(null, chunk);
            } else {
                push(null);
            }
        },
    });
};

module.exports = { filterByCountry };