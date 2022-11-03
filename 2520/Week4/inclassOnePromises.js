const fs = require("fs")

const readFilePromise = (fileName) => {
    return new Promise((res, rej) => {
        fs.readFile(fileName, "utf-8", (err, data) => {
            if (err) {
                rej(err);
            } else {
                res(data);
            }
        });
    });
}

readFilePromise("file1.txt")
    .then((fileTwo) => readFilePromise(fileTwo, "utf-8"))
    .then((fileThree) => readFilePromise(fileThree, "utf-8"))
    .then((fileFour) => readFilePromise(fileFour, "utf-8"))
    .then((finalResult) => console.log(finalResult))
    .catch((err) => console.log(err));