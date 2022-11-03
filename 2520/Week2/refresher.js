function add(num1, num2) {
    return num1 + num2
}

//here addTwo is a higher-order function. These are functions that take other functions as their parameters
function addTwo(num1, addReference) {
    return addReference(num1, 2);
}
//The add in the line below is called a callback function. A fucntion that you pass into another function as a reference.
console.log(addTwo(7, add));

//LOOPING
const colors = ['red', 'green', 'blue'];

//this is a callback function.
function callbackFunc(value) {
    console.log(value);
}

//forEach is a higher-order function.
colors.forEach(callbackFunc)
//the forEach loop is hidden to us. The implementation of the forEach loop is hidden from us.

console.log('------------------------')

//Implementation of the forEach loop
//my code
function callbackFn(value) {
    console.log(value)
}
//my code ends

function myForEach(list, callbackFn) {
    //implement the logic for looping
    //through the list (for loop, while loop)
    for (let i = 0; i < list.length; i++) {
        const element = list[i];
        callbackFn(element)
    }
}

myForEach(colors, callbackFn);

/*
//Create a function called multiplier which takes 3 arguments:
// number1
// number2
// callback

// callback contains 2 parameters
// err
// result

// number1 and number2 must be Integers. If decimals are passed, convert them

// If the user passes in for number1 or number2 something which IS NOT a
// number, pass an error to the first argument, and leave result empty. 

// Otherwise, multiply the two numbers together and pass null for the error,
// result as the second argument. 

// Wrap all of this in a setTimeout which will execute after 4 seconds. 

*/

console.log('------------------------')

function callback(err, result) {
    if(err) {
        console.log(err.message)
    }
    else {
        console.log("The result is: ", result)
    }
}

function multiplier(number1, number2, callback) {
    setTimeout(function() {
        if(isNaN(number1) || isNaN(number2)) {
            return callback(new Error("One or more of the variables passed are not numbers."), null)
        }
        else if(!isNaN(number1) && !isNaN(number2)) {
            result = parseInt(number1) * parseInt(number2)
            return callback(null, result)
        }
        return callback(error, result)
    }, 4000)
}

multiplier("string", 5.9, callback)

console.log('------------------------')
//Function expression syntax
const greeting = function(msg) {
    return msg
}

//Arrow function syntax
const greeting2 = (msg) => {
    return msg
}

greeting('hello');

console.log('------------------------')

function printHi() {
    console.log('hi')
}

//SetTimeout goes to the background and we don't have to wait 
//for the setTimeout line to finish it's work
setTimeout(printHi, 1000)
console.log('I go first!')

//setTimeout send the callback function to a special place for the 
// callback functions called the callback queue. This waits to see if 
// the call stack is empty before sending callback frunction onto the 
// call stack and finally executing it.
