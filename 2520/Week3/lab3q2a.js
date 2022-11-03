const fs = require("fs");
const process = require("process");
const path = require("path");

const [, , dir, filter] = process.argv

filterFiles = (dir, filter) => {
    console.log(dir, filter)
    fs.readdir(dir, (err, fileNames) => {
        if (err) {
            console.log(err)
        }
        for (i in fileNames) {
            if (path.extname(fileNames[i]).includes(filter)) {
                console.log(fileNames[i])
            }
        }
    })
}
    
filterFiles(dir, filter);

