const fs = require("fs")

let getSpacedData = (fileName) => {
    return new Promise((resolve, reject) => {
        if(typeof fileName != "string") {
            reject(new Error("The file name should be a string."))
        } else {
            fs.readFile(fileName, "utf-8", (err, data) => {
                if(err) {
                    reject(err);
                } else {
                    resolve(data.split(" "));
                }
            });
        }
    });
}


let filterEvens = (arr) => {
    return arr.filter((eachNum) => eachNum % 2 === 0)
}

getSpacedData("numbers.txt")
    .then((arrayOfNums) => filterEvens(arrayOfNums))
    .then((filteredNums) => console.log(filteredNums))
    .catch((err) => console.log(err))

// this works because the first .then wraps the result of the filterEvens in a
// new promise for use in the background. It looks like this:

// new Promise((resolve, reject) => resolve([2, 4, 6, 8, 10, 12, 14])). This is
// what javascript does for us in the background for the ,then to be daisy
// chained and for it to work. But we shouldn't rely on this trick and we should
// always write our new promises for all asynchronous code. Using this trick
// where it wraps it for you is fine as long as the thing being wrapped is a
// simple calculation. 
