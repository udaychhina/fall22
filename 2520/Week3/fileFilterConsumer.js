const process = require("process");
const { filter } = require('./fileFilter');

const [, , dir, filterName] = process.argv

const filterFiles = (dir, filterName) => {
    filter(dir, filterName, (err, fileNames) => {
        if (err) {
            console.log(err)
        } else if (fileNames.length == 0) {
            console.log("No files for that extension found.")
        } else {
            fileNames.forEach(file => {
                console.log(file)
            });
        }
    })
}

filterFiles(dir, filterName)