import { distance } from "./mathHelpers.js";
import process from 'node:process';
import fs from 'node:fs';

const [, , x1, y1, x2, y2] = process.argv; 

const processInput = (x1, y1, x2, y2) => {
    const dist = distance(x1, y1, x2, y2).toFixed(3);
    fs.mkdir('./dataPoints', (err) => {
        if (err) {
            console.log('The folder already exists.')
            console.log('Deleting folder...')
            fs.rmdir('./dataPoints', (err) => {
                if (err) {
                    console.log('Failed to delete, folder not empty - delete folder and run command again.')
                }
            });
        } else {
            fs.writeFile('./dataPoints/points.txt', `The user input is: (${x1}, ${y1}), (${x2}, ${y2}).`, (err) => {
                if (err) {
                    console.log("Error while writing to the file")
                } else {
                    console.log('Contents saved.');
                }
            });
            fs.appendFile('./datapoints/points.txt', `\nThe distance between your two points: (${x1}, ${y1}), (${x2}, ${y2}) is ${dist}.`, (err) => {
                if (err) {
                    console.log("Error while appending to the file.")
                }
            })
        }
    });
}

processInput(x1, y1, x2, y2);

