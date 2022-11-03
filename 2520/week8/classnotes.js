//FILE COPY THE BUFFER WAY (OR THE USUAL WAY WE HAVE BEEN DOING IT)
const {
    readFileSync,
    writeFileSync
} = require('fs')

const [,, src, dest] = process.argv

const content = readFileSync(src)

writeFileSync(dest, content)

// whenever you're reading something from your computer, the program is the
// reading all the files to the RAM. That's the content variable in this case.
// What is you're reading like a really big movie, like 45GB movie. We don't
// have enough memory in our laptops to read the large file. Even if it is a
// 4GB file. 
// ERR_FS_FILE_TOO_LARGE is thrown when generally the file is larger than
// around 2.5GB. We can adjuct this, but generally, this is what happens. 

// The solution is to use streams. Streams are used to read really large
// files. Streams are a very efficient way to read very large files. 

// Streaming is basically cutting a really large file into smaller pieces and
// sending those smaller pieces one by one. ANY FILE CAN BE STREAMED not just
// videos or music. 

// Buffers: When you use readFileSync, you load the whole file in the memory
// of the computer. That is called the buffer. "An array sitting in the memory
// of the computer and holding onto all the bytes of the data." Formally: Data
// structure 

// Streams: The data fills up overtime. Doesn't flow all at once -
// periodically. "Abstract interface for working with streaming data." IF we
// use the function createReadStream, we can read parts of the file instead of
// the whole file. 

//File COPY THE STREAM WAY
const {
    createReadStream,
    createWriteStream
} = require('fs')

const [, , src1, dest1] = process.argv
const srcStream =  createReadStream(src)
const destStream = createWriteStream(dest)
srcStream.on('data', (data) => destStream.write(data))

// Streams keep a low memory footprint of even with large amounts of data.
// Streams allow you to process data as soon as it arrives. 

// All streams are event emitters. Each of them will fire of an event. You can
// choose what you want to do with each of them. The ost common one we will
// use is the 'data' event. 
src.on('readable', () => {})
src.on('data', (chunkOfData) => {})
src.on('error', () => {})

// Readable streams: data is read from srouce automatically and chunks are
// emitted as soon as they are read. WHen they are done reading the last one
// is the 'end' event. So this is convenient to use since we can check for the
// end event to fire off to check if the stream has finished reading the data. 

// Backpressure: When writing large amounts of data you should make sure you
// handle the stop write signal and the drain event.

// When you have a really fast drive from which you are reading the data and
// the system is not able to process it fast enough. This causes a traffic jam
// and you have to handle it. 

const { createReadStream, createWriteStream } = require('fs')

const [, , src2, dest2] = process.argv
const srcStream1 = createReadStream(src)
const destStream1 = createWriteStream(dest)

// handling of the errors in 
srcStream1.on()
// skipped a couple of slides, he was going to fast. 