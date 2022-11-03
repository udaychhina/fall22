const fs = require("fs")
const os = require("os")

const viewAllSupply = (coffeeType) => {
    return new Promise((resolve, reject) => {
        fs.readFile("supply.txt", "utf-8", (err, data) => {
            if (err) {
                reject("Couldn't find the supply.")
            } else {
                let lines = []
                let count = 0
                lines = data.split(os.EOL)
                lines.forEach(coffee => {
                    if (coffeeType == coffee) count += 1
                });
                resolve(count)
            }
        })
    })
}

const addSupply = (coffeeType) => {
    return new Promise((resolve, reject) => {
        fs.appendFile("supply.txt", `${os.EOL}${coffeeType}`, (err) => {
            if (err) {
                reject("Can't find the supply.")
            } else {
                resolve("Added to supply.")
            }
        })
    })
}

viewAllSupply("blonde")
    .then((msg) => console.log(msg))
    .catch((err) => console.log(err))

addSupply("blonde")
    .then((msg) => console.log(msg))
    .catch((err) => console.log(err))