const fs = require('fs').promises;
const { EOL } = require('os');

const processAndFormat = (csv) => {
    return fs.readFile(csv, "utf-8").then((data) => {
        const splitData = data.split(EOL);
        const itemObject = {}
        for (const element of splitData) {
            let [mealType, name, quantity, price] = element.split(',')
            const mealObj = { name, quantity, price }
            if (itemObject[mealType]) {
                itemObject[mealType].push(mealObj)
            } else {
                itemObject[mealType] = [mealObj]
            }
        }
        let formattedContent = "";
        for (const key in itemObject) {
            let meals = itemObject[key]
            const upperCaseMealName = key.toUpperCase().slice(1)
            formattedContent += `** ${upperCaseMealName} Items **${EOL}`
            meals.forEach((m) => {
                formattedContent += `${m.price} ${m.name}, ${m.quantity}${EOL}`
            });
        }
        return formattedContent;
    })
}

processAndFormat("menu.csv")
    .then((formattedContent) => fs.writeFile("menu.txt", formattedContent))
    .then(() => console.log("Menu.txt has been created."))
    .catch((err) => console.log(err))