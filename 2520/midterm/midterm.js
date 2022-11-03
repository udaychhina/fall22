const fs = require('fs');
const os = require('os')

let allMeals = []

const readContent = (filename) => {
    return new Promise((resolve, reject) => {
        fs.readFile(filename, "utf-8", (err, data) => {
            if (err) {
                reject(err)
            } else {
                let lines = []
                lines = data.split(os.EOL)
                for (let i = 0; i < lines.length; i++) {
                    let item = []
                    item = lines[i].split(',')
                    allMeals.push({
                        type: item[0],
                        name: item[1],
                        quan: item[2],
                        price: item[3]
                    })
                };
                resolve()
            }
        })
    })
}

const getAllTypes = (allMeals) => {
    types = []
    for (let i = 0; i < allMeals.length; i++) {
        if (types.includes(allMeals[i].type)) {
            
        } else {
            types.push(allMeals[i].type)
        }
    }
    return types
}

const capitalizeFirstLetter = (string) => {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

const formatString = (allMeals, types) => {
    let formString = ``
    for (let i = 0; i < types.length; i++) {
        formString += `* ${capitalizeFirstLetter(types[i])} Items *${os.EOL}`
        for (let j = 0; j < allMeals.length; j++) {
            if (allMeals[j].type == types[i]) {
                formString += `${allMeals[j].price}  ${allMeals[j].name}, ${allMeals[j].quan}${os.EOL}`
            } else {
            }
        }
        formString += `${os.EOL}`
    }
    return formString
}

const writeContent = (filename, content) => {
    return new Promise((resolve, reject) => {
        fs.writeFile(filename, content, (err) => {
            if(err) {
                reject(err)
            } else {
                resolve("Menu.txt has been written.")
            }
        })
    })
}


const main = (filename) => {
    readContent(filename)
        .then(() => {
            let mealTypes = getAllTypes(allMeals)
            let content = formatString(allMeals, mealTypes)
            writeContent("menu.txt", content)
            .then((msg) => console.log(msg))
            .catch((err) => console.log(err))
        })
        .catch((err) => console.log(err))
}

main('menu.csv')