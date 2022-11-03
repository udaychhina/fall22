const ourMap = (oldArray, callback) => {
    let newArray = []
    oldArray.forEach(element => {
        newArray.push(callback(element))
    });
    return newArray
}


const callback = (num) => {
    return num * 2
}

let nums = [1, 2, 3, 4, 5]
newNums = ourMap(nums, callback)
console.log(newNums)