// Question 1: 

// Create a readstream that reads from your terminal, `process.stdin` and
// writes back to the terminal whatever you type(`process.stdout`).

const process = require('process')
const { EOL } = require('os')

// writeable stream with pipes

const rs = process.stdin;
const ws = process.stdout;
rs.pipe(ws)

//longer way

// rs.on('data', function(chunk) {
//     ws.write(chunk)
// })

