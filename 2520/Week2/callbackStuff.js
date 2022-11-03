const fs = require('fs');

// fs.writeFileSync("hello.txt", "some content");
// //the problem with this is that the whole code will pause at the line below until this has finished executing.
// const content = fs.readFileSync("hello.txt", "utf-8")
// console.log(content)

//output:
//some content
//Welcome to CIT

//The python/php/whatever language way
fs.writeFileSync("hello.txt", "some content"); //1st
fs.readFileSync("hello.txt", "utf-8"); //2nd
console.log(content); //3rd

//This is very problematic because if we have very large files, the rest 
//of the code would be waiting until everything is finished running. 
//This is called synchronous code. 


//the solution for this problem in node.js is asynchronous callbacks
fs.readFile("hello.txt", "utf-8", (err, data) => {
    if(err) {
        console.log(err);
    } else {
        console.log(data)
    }
})

console.log("Welcome to CIT");

//Output:
// Welcome to CIT
// some content

/*
There is a possibility that the callback function that is reading all the content of the file is gonna be running after 6 minutes. Because this function gets added to the callback queue, it won't run until all the synchronous code in the call stack has run.
This calls for us to keep all the slow code away from the call stack so that it doesn't take away the opportunity of other callback functions to run their results.
*/

//With asynchronous code, having both write and read one after another may cause problems since we don't know if the read will actuall read it after the whole file is done writing. 

//a solution to this new problem is to have the reading of the file nested in the write if they are dependant on one another. 
fs.writeFile("hello.txt", "Some file content", (err) => {
    if(err) {
        console.log(err);
    } else {
        //this works because this line of code will only run when the file has finished being written to.
        fs.readFile("hello.txt", "utf-8", (err, data) => {
            if(err) {
                console.log(err);
            } else {
                console.log(data)
            }
        })
    }
})

