const fs = require("fs");
const path = require("path");

const filter = (dirName, filterName, callback) => {
    if (dirName == null || filterName == null) {
        callback(new Error("Please provide both the directory and the extension."), null);
    } else {
        const fileArray = new Array();
        fs.readdir(dirName, (err, fileNames) => {
            if (err) {
                console.log(err)
            }
            for (i in fileNames) {
                if (path.extname(fileNames[i]).includes(filterName)) {
                    fileArray.push(fileNames[i])
                }
            }
            callback(null, fileArray)
        })
    }
}

module.exports = { filter }