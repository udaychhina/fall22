const multiplier = (n1, n2) => {
    return new Promise((resolve, reject) => {
        if (typeof n1 != "number" || typeof n2 != "number") {
            reject(new Error("Arguments must be numbers."));
        } else {
            resolve(parseInt(n1) * parseInt(n2));
        }
    })
}

multiplier(5, 4)
    .then((result) => {
        console.log(`The result is ${result}`);
    })
    .catch((error) => {
        console.log(error);
    })