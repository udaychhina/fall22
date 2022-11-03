//imoprting a module (Node.js core modules)
const fs = require('fs').promises;

//function and a method
class Animal {
    constructor(name) {

    }
    bark = () => {
        console.log("woof");
    }
}

const dog = new Animal()
dog.bark()

fs.writeFileSync("hello.txt", "Hello CIT!");
const content2 = fs.readFileSync("hello.txt", "utf-8");
console.log(content2)

//Now this looks really good and the code is very easy to read. The problem with
//this is that it blocks the code as long as the stuff from these lines of code
//doesn't finish executing

fs.writeFile("hello.txt", "Hello CIT!", (err) => {
    if (err) {
        console.log(err)
    } else {
        fs.readFile("hello.txt", "utf-8", (err, data) => {
            if (err) {
                console.log(err);
            } else {
                console.log(data);
            }
        });
    }
});

//this is what we moved to in the second week. These are better since they don't
//keep the code blocked. The stuff happens in the background. These also created
//problems: no central error handling and too much nesting. 

// The solution to this version was promises
//Just an example with writeFile: (wrappped in a promise)

const writeFileP = (fileName, content) => {
    return new Promise((resolve, reject) => {
        fs.writeFile(fileName, content, (err) => {
            if (err) {
                reject("Can't write")
            } else {
                resolve();
            }
        })
    })
}

//Promises were an improvement but not much. The solution is:
//Async and Await. 
//Requirement: Your functions must work with promises. 

fs.writeFile("hello.txt", "hi cit")
.then(() => fs.readFile("hello.txt", "utf-8"))
.then((content) => console.log(content))
.catch((err) => console.log(err))

//to convert this to use async and await we do this:

await fs.writeFile("hello.txt", "hi cit")
const content3 = await fs.readFile("hello.txt", "utf-8");
console.log(content3)

//async and await keywords support the try {} catch {} blocks. So that is really
//good for error handling. 

try {
    await fs.writeFile("hello.txt", "hi cit")
    const content = await fs.readFile("hello.txt", "utf-8");
    console.log(content);
} catch (err) {
    console.log(err);
}

//The async part comes in like this:
// Most node.js versions can't use the await keyword unless the function is
// marked with the async keyword. 

async function doFIleOp() {
    await fs.writeFile("hello.txt", "hi cit")
    const content = await fs.readFile("hello.txt", "utf-8");
    console.log(content);
    return content;
}

const content = doFIleOp()
console.log(content)
//THIS CAN'T BE DONE. Because the return inside of a funciton marked with the
//async keyword will return a promise. So you would need to use the .then()
//function to get the content of the doFIleOp function. 

doFIleOp()
.then(content => console.log(content))
.catch(err => console.log(err))

//This is also not the best thing. because you are going back to the nesting
//issue with the promises. If we don't have the latest version of node, we can
//get around the top level await syntex (without the need for async) by doing
//this:

(async () => {
    const content = await doFIleOp();
})()

//this way you can have a lot of content in the intanting calling function. the
//() in the line above. 

//CAUTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//ALL OF THE ASYNC AWAIT STUFF WON'T WORK IF YOU DON'T IMPORT THE PORMISES
//STUFF. 