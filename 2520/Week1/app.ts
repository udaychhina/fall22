// Create a function called wordPosition which takes a list of words, and returns the indices where each word shows up in the list. Take a look at the comment below to see how the output should look. Make sure to use modern javascript syntax.
const wordPosition = (words) => {
    // your code here
    let wordPos = {}
    for(let word in words) {
        if(!(words[word] in wordPos)) {
            wordPos[words[word]] = [word];
        }
        else {
            wordPos[words[word]] = wordPos[words[word]].concat([word]);
        }
    }
    return wordPos;
    }
    
    const input = [
      "buy",
      "it",
      "use",
      "it",
      "break",
      "it",
      "fix",
      "it",
      "trash",
      "it",
      "change",
      "it",
      "mail",
      "upgrade",
      "it",
    ];
    
    const output = wordPosition(input);
    console.log(output)
    
    /*
    Output should look like so:
    {
      break: [ 4 ],
      buy: [ 0 ],
      change: [10],
      fix: [ 6 ],
      it:  [1, 3, 5, 7, 9, 11, 14],
      mail: [ 12 ],
      trash: [ 8 ],
      upgrade: [ 13 ],
      use: [ 2 ],
    }
    
    */