/*
* Project: Milestone 1
* File Name: main.js
* Description:
*
* Created Date: November 13, 2022
* Author: Uday Chhina
*
*/

const path = require("path");
const IOhandler = require("./IOhandler");
const zipFilePath = path.join(__dirname, "myfile.zip");
const pathUnzipped = path.join(__dirname, "unzipped");
const pathProcessed = path.join(__dirname, "grayscaled");


IOhandler.unzip(zipFilePath, pathUnzipped)
    .then(() => IOhandler.readDir(pathUnzipped))
    .then((arr) => {
        arr.forEach(file => {
            let baseIn = path.basename(file)
            let baseOut = baseIn.replace("in", "out")
            console.log(pathProcessed + "/" + baseOut)
            IOhandler.grayScale(file, pathProcessed + "/" + baseOut)
        });
    })
    .then(() => console.log("Done"))
    .catch((err) => console.log(err))
