// The difference between aynchronous functions and synchronous functions is
// that one of them blocks the IO while the other one doesn't. Asynchronous
// functions send the code to the background and wait for it to execute. They
// then call the callback function after the code has finished executing in the
// background. This enables the rest of the code in the file to be executed
// without having to wait for the function to executing the code. On the other
// hand, synchronous functions will block the rest of the code from running
// while they wait for their code to finish executing. 

const fs = require("fs");

fs.writeFileSync("text.txt", oneMillionWords)
// the code below will not run until the writefilesync function has finished
// writing all the one million words to the file. This blocks the IO. 
let addition = 5 + 5;
console.log(addition);


fs.writeFile("text.txt", oneMillionWords, (err) => {
    if (err) {
        console.log(err)
    } else {
        console.log("The file was written.")
    }
});
// in this case, the code below will run without waiting for the writefile
// function to finish writing the contents to the text file. The writing thing
// will be done in the background where it doesn't block the funtction of the
// rest of the code. 
let subtraction = 5 - 4;
console.log(subtraction);