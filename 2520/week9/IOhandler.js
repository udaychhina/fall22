/*
 * Project: Milestone 1
 * File Name: IOhandler.js
 * Description: Collection of functions for files input/output related operations
 *
 * Created Date:
 * Author:
 *
 */

const unzipper = require("unzipper"),
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
const unzip = (pathIn, pathOut) => {};

/**
 * Description: read all the png files from given directory and return Promise containing array of each png file path
 *
 * @param {string} path
 * @return {promise}
 */
const readDir = (dir) => {};

/**
 * Description: Read in png file by given pathIn,
 * convert to grayscale and write to given pathOut
 *
 * @param {string} filePath
 * @param {string} pathProcessed
 * @return {promise}
 */
const grayScale = (pathIn, pathOut) => {};

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

IOhandler.unzip("pathin","pathout")
.then(() => IOhandler.readDir())
.then((arr) => IOhandler.grayScale())
.catch((err) => console.log(err))


// unzipping works like a transform stream. This is gonna be the challenge for
// us. SOmehow we have to wrap the stream code into a promise. Stream have
// events that they emit. One of the events is onFinish. We can listen for
// those events. Another one is called the close event. We can use this to
// resolve the promise. Resolve when this event is heard. 

// read the unzip library. They have a shortcut for you to use promises with
// the unzip streams. 