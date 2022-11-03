const fs = require('fs');
const process = require('process');
const path = require('path');

const [, , username, password] = process.argv

const register = (username, password) => {
    return new Promise((resolve, reject) => {
        fs.readFile('database.txt', "utf8", (err, filecontent) => {
            if (err) {
                console.log("Failed to access database.")
            }
            else if (password.includes(':') || username.includes(':')) {
                reject(new Error("The password and username cannot contain ':'."))
            }
            else {
                if (filecontent.includes(`${username}:`)) {
                    //username exist in content
                    reject(new Error("Username already exists."))
                } else {
                    //username is good
                    data = `${username}:${password}\n`
                    fs.appendFile("database.txt", data, (err) => {
                        if (err) {
                            console.log(err)
                        } else {
                            resolve("User registeration successful ")
                        }
                    })
                }
            }
        })
    })
}

const createABlog = (blogName) => {
    return new Promise((resolve, reject) => {
        fs.mkdir(blogName, (err) => {
            if (err && err.code === "EEXIST") {
                reject(new Error("Blog with that name already exists."))
            } else if (err) {
                reject(err)
            } else {
                resolve("Blog created successfully.")
            }
        })
    })
}

const createPost = (postTitle, postContent, blogName) => {
    return new Promise((resolve, reject) => {
        if (postTitle.includes(" ")) {
            postTitle = postTitle.replace(" ", "_")
        }
        //define function for making new file names.
        const fileNameIncrement = (postTitle, writeContent, blogName, increment = 0) => {
            fs.writeFile(`${blogName}/${postTitle}`, writeContent, { encoding: "utf-8", flag: "wx" }, (err) => {
                if (err && err.code === "EEXIST") {
                    increment = increment + 1;
                    let fileBaseName = path.basename(postTitle, path.extname(postTitle));
                    let baseNameNoBracket = ""
                    if (fileBaseName.includes('(')) {
                        baseNameNoBracket = fileBaseName.substring(0, fileBaseName.indexOf('('));
                    } else {
                        baseNameNoBracket = fileBaseName
                    }
                    let newFilename = `${baseNameNoBracket}(${increment || ""})`;
                    newFilename = `${newFilename}${path.extname(postTitle)}`
                    fileNameIncrement(newFilename, writeContent, blogName, increment)
                } else {
                    resolve("Post created.")
                }
            })
        }
        let writeContent = "";
        likeCounter = 1
        writeContent += `likes:${likeCounter}\n`
        writeContent += `likedBy: you\n`
        writeContent += `${postContent}`
        fs.stat(blogName, (err, stats) => {
            if (err) {
                return reject("The dir doesn't exist");
            } else {
                fileNameIncrement(postTitle, writeContent, blogName)
            }
        })
    })
}

const likePost = (blogName, postTitle, username) => {
    return new Promise((resolve, reject) => {
        fs.readFile('database.txt', "utf-8", (err, data) => {
            if (err) {
                reject("Failed to access the database.");
            } else {
                if (data.includes(`${username}:`)) {
                    fs.readFile(`${blogName}/${postTitle}.txt`, "utf-8", (err, data) => {
                        if (err) {
                            reject(err);
                        } else {
                            let writeContent = "";
                            let lines = data.split('\n');
                            lines[0] = `${lines[0].split(':')[0].toString()}:${parseInt(lines[0].split(':')[1]) + 1}\n`
                            lines[1] += `, ${username}\n`;
                            lines.forEach(line => {
                                writeContent += line;
                            });
                            fs.writeFile(`${blogName}/${postTitle}.txt`, writeContent, (err) => {
                                if (err) {
                                    reject(err);
                                } else {
                                    resolve("Post liked!");
                                }
                            });
                        }
                    });
                }
            }
        });
    });
}


//calling sections (aka call centers )

register(username, password)
    .then((msg) => console.log(msg))
    .catch((err) => console.log(err))

createABlog(blogName)
    .then((msg) => console.log(msg))
    .catch((errmsg) => console.log(errmsg))

createPost(postTitle, postContent, blogName)
    .then((msg) => { console.log(msg) })
    .catch((err) => { console.log(err) })

likePost(blogName, postTitle, username)
    .then((msg) => console.log(msg))
    .catch((err) => console.log(err))