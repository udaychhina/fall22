const readlineSync = require('readline-sync');

// Worked out this function and formula with Jacky Hsu
// Rest of the code is mine
const convertToArray = (number) => {
    let retArray = []
    let mainModulo = 10
    let subModulo = mainModulo / 10
    let numToInsert = 0
    let breakNum = 0
    while (breakNum != number) {
        breakNum = (number % mainModulo)
        numToInsert = ((number % mainModulo) - (number % subModulo)) / subModulo
        mainModulo *= 10
        subModulo = mainModulo / 10
        retArray.push(numToInsert)
    }
    return retArray.reverse()
}

const isLegit = (num) => {
    return (num % 10 == 0)
}

const verification = (numArray) => {
    secondSum = 0
    leftOverSum = 0
    for (let i = 0; i < numArray.length; i++) {
        if (i % 2 != 0) {
            if (numArray[i] * 2 > 9) {
                twoDigitArr = convertToArray(numArray[i] * 2)
                for (const val of twoDigitArr) {
                    secondSum += val
                }
            } else {
                secondSum += numArray[i] * 2
            }
        } else {
            leftOverSum += numArray[i]
        }
    }
    let total = leftOverSum + secondSum
    if (isLegit(total)) {
        return true
    } else {
        return false
    }
}

const main = () => {
    let input = parseInt(readlineSync.question("Number: ", { limit: (input) => input > 0 }))
    numArray = convertToArray(input)
    cardNumLen = numArray.length
    if (verification(numArray.reverse()) && (
        cardNumLen == 15
        || cardNumLen == 13
        || cardNumLen == 16)) {
            numArray.reverse()
            if (numArray[0] == 4) {
                    console.log('VISA')
            } else if (numArray[0] == 5 && (
                numArray[1] == 1
                || numArray[1] == 2
                || numArray[1] == 3
                || numArray[1] == 4
                || numArray[1] == 5)) {
                    console.log('MASTERCARD')
            } else if (numArray[0] == 3 && (
                numArray[1] == 4
                || numArray[1] == 7)) {
                    console.log('AMEX')
        }
    } else {
        console.log('INVALID')
    }
}

main()