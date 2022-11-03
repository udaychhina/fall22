const { createReadStream } = require("fs");
const csv = require("csvtojson");
const { createGunzip } = require("zlib");
const { pipeline } = require("stream");
const csvParser = csv();
const gunzip = createGunzip();
const { sumProfit } = require("./sumProfit");
const { filterByCountry } = require("./filterByCountry");

//anything that goes in the pipeline will have to be a stream. 
pipeline(
    //the data in this file would not be readable for us. So we are reading one
    //chunk of data out of the zip file. It is sent it to the built in gunzip function.
    createReadStream("data.csv.gz"),
    gunzip,
    // gunzip is a transform string and all the pipes from createreadstream to
    // process.stdout has to be a transform stream. This funciton will unzip
    // the first chunk that goes in.
    csvParser,
    //Teh csv parser will convert the csv into a dictionary that we will be
    //able to work with easily. This is also a transform pipe as this will
    //take the csv chunk that we get from the gunzip function and then convert
    //it into an object. 
    filterByCountry("Italy"),
    //The filterByCountry will just filter out the countries that have the
    //country Italy
    sumProfit(),
    process.stdout,
    function (err) {
        console.log(err);
    }
);