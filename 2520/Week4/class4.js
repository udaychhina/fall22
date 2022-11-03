const process = require("process");
const fs = require("fs");
const defaultFolder = "dataPoints";


//if you add recursive true, it will just ignore the case if the folder already exists. 
const processInput = (userInput, dir) => {
    //fs.mkdir('./dataPoints', {recursive: true}, (err) => {
    fs.mkdir(dir, (err) => {
        if (err) {
            if (err.code === "EEXIST") {
                console.log(
                    `The folder called ${dir} already exists. Creating a new folder called temp_${dir}.`
                );
                processInput(userInput, `temp_${dir}`);
            } else {
                console.log(err);
            }
        }
    })
}

const [, , x1, y1, x2, y2] = process.argv;
processInput(`${x1}, ${y1}, ${x2}, ${y2}`, defaultFolder);