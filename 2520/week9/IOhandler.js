/*
 * Project: Milestone 1
 * File Name: IOhandler.js
 * Description: Collection of functions for files input/output related operations
 *
 * Created Date: November 13, 2022
 * Author: Uday Chhina
 *
 */

const unzipper = require("unzipper"),
    { createReadStream, createWriteStream } = require("fs"),
    fs = require("fs"),
    PNG = require("pngjs").PNG,
    path = require("path");

/**
 * Description: decompress file from given pathIn, write to given pathOut
 *
 * @param {string} pathIn
 * @param {string} pathOut
 * @return {promise}
 */
const unzip = (pathIn, pathOut) => {
    return createReadStream(pathIn)
        .pipe(unzipper.Extract({ path: pathOut }))
        .promise()
        .then(() => console.log("Extraction operation complete."))
};

/**
 * Description: read all the png files from given directory and return Promise containing array of each png file path
 *
 * @param {string} path
 * @return {promise}
 */
const readDir = (dir) => {
    return new Promise((res, rej) => {
        fs.readdir(dir, (err, files) => {
            if (err) {
                rej(err)
            } else {
                let photos = []
                for (const file of files) {
                    const ext = path.parse(file).ext
                    if (ext === ".png") {
                        photos.push(path.join(dir, file))
                    }
                }
                return res(photos)
            }
        })
    })
};


/**
 * Description: Read in png file by given pathIn,
 * convert to grayscale and write to given pathOut
 *
 * @param {string} filePath
 * @param {string} pathProcessed
 * @return {promise}
 */
const grayScale = (pathIn, pathOut) => {
    return new Promise((res, rej) => {
        createReadStream(pathIn)
            .pipe(
                new PNG({
                    filterType: 4,
                })
            )
            .on("parsed", function () {
                for (var y = 0; y < this.height; y++) {
                    for (var x = 0; x < this.width; x++) {
                        var idx = (this.width * y + x) << 2;
                        let grey = (this.data[idx] + this.data[idx + 1] + this.data[idx + 2]) / 3
                        this.data[idx] = grey
                        this.data[idx + 1] = grey
                        this.data[idx + 2] = grey
                    }
                }

                this.pack().pipe(createWriteStream(pathOut))
                    .on("finish", res);
            });
    })
};


module.exports = {
    unzip,
    readDir,
    grayScale,
};

// The funcitons are returning promises because we don't wanna greyscale the
// images before the have been unzipped. readDir will only run after we have
// gotten all the stuff from the unzip function. The code below is probably
// the way we should be doing it. 

// This code should probably go in the main.js file. This is the main.js file
// underneath. We should properly export and import from IOhandler and into
// the main.js file. 

// IOhandler.unzip("pathin","pathout")
// .then(() => IOhandler.readDir())
// .then((arr) => IOhandler.grayScale())
// .catch((err) => console.log(err))


// unzipping works like a transform stream. This is gonna be the challenge for
// us. SOmehow we have to wrap the stream code into a promise. Stream have
// events that they emit. One of the events is onFinish. We can listen for
// those events. Another one is called the close event. We can use this to
// resolve the promise. Resolve when this event is heard. 

// read the unzip library. They have a shortcut for you to use promises with
// the unzip streams. 