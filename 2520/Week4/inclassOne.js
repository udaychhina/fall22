const { readFile, readFileSync, fstat } = require("fs");

const fileOne = 'file1.txt'

readFile(fileOne, "utf-8", (err, fileTwo) => {
    if (err) {
        return console.log(err);
    }
    readFile(fileTwo, "utf-8", (err, fileThree) => {
        if (err) {
            return console.log(err);
        }
        readFile(fileThree, "utf-8", (err, fileFour) => {
            if (err) {
                return console.log(err);
            }
            readFile(fileFour, "utf-8", (err, finalResult) => {
                if (err) {
                    return console.log(err);
                }
                console.log(finalResult)
            });
        });
    });
});

// There ar two problems with the asynchronous callback-based code:
// Difficult to reason about (ugly)
// Don't know where the error is coming from. 
// (1) It is also difficult to read and debug.
// (2) There is no centralized error handling.


// console.log(err) is when oyu print out an error. throw new Error() means that
// i don't want to handle the error here and i want someone else to handle it. 
function subtract(n1, n2) {
    if (typeof n1 != "number" || typeof n2 != "number") {
        throw new Error(("You must pass in a number thothis function."))
    } else {
        return n1 - n2;
    }
}

// we can't have this during callback hell. This is centralized error handling.
// So this would be nice in a perfect world because we woudn't have to write all
// the errors again and again. 
try {
    sum(5, 4);
    subtract(5, 4);
} catch (error) {
    console.log(error)
}


// we can do this:
try {
    const fileTwo = readFileSync("file1.txt", "utf-8");
    const fileThree = readFileSync("file2.txt", "utf-8");
    const fileFour = readFileSync("file3.txt", "utf-8");
    console.log(fileFour);
} catch (error) {
    console.log()
}

// The problem with this code is that we have performance drawbacks. We need to
// find a solution that marries both of the approaches. 

// promises are a solution to this problem. 
// to make a basic promise, you have to pass an empty callback into it
new Promise(() => {})


//To use the practise one question and writ eit with promises, we would need to
//promisify it. This means that we would have to WRAP our readFIle funciton
//inside of a promise because readFile doesn't return anything. For promises we
//need a return file. SO this is our solution

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
    .then((fileTwo) => {
        readFilePromise(fileTwo);
    })
    .then((fileThree) => {
        readFilePromise(fileThree);
    })
    .then((fileFourData) => {
        console.log(fileFourData);
    })
    .catch((err) => {
        console.log(err);
    });

// This way we have acheived centralized error handling. 