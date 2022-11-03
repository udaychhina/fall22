// Add DOM selectors to target input and UL movie list
var inp = document.querySelector("input");
var myMovieList = document.querySelector("ul");
var filter = document.querySelector("input#filter")
var tableCard = document.getElementById('movieHistoryCard')
let searchInput = ''
var movies = {}

// Example of a simple function that clears the input after a user types something in
function clearInput() {
    inp.value = "";
}

//FILTER MOVIES

function showList() {
    myMovieList.innerHTML = '';
}

filter.addEventListener('input', (event) => {
    searchInput = event.target.value.toLowerCase()
})

var matchedMovies = Object.keys(movies).filter((movie) => movie)


//ENTER KEY
inp.addEventListener("keypress", (event) => {
    console.log("entered")
    if(event.key === "Enter") {
        event.preventDefault()
        addMovie()
    }
})
function clearMovies() {
    // To delete all children of the <ul></ul> (meaning all <li>'s)..we can wipe out the <ul>'s innerHTML
    myMovieList.innerHTML = '';
}

function addMovieToObject(movieName) {
    movieArray = []
    // debugger;
    for (const movie of Object.keys(movies)) {
        movieArray.push(movie.toLowerCase())
    }
    if (movieArray.includes(movieName.toLowerCase())) {
        movies[movieName]++;
    } else {
        movies[movieName] = 1;
    }
}

// This function is executed when the user clicks [ADD MOVIE] button.
function addMovie() {
    // Step 1: Get value of input
    var userTypedText = inp.value;
    if(userTypedText == "") {
        return alert('The movie name cannot be empty.')
    } else {
        addMovieToObject(userTypedText)
    }

    let m = "";
    Object.keys(movies).forEach(movie => {
        m += `<li>${movie}</li>`
    });
    myMovieList.innerHTML = m
    showTable()
    clearInput();
}

function showTable() {
    var tableHTML = "<table><tr><th>Movies</th><th>Count</th></tr>"
    for([movie, count] of Object.entries(movies)) {
        tableHTML += `<tr><td>${movie}</td><td>${count}</td></tr>`
    }
    tableHTML += "</table>"
    tableCard.innerHTML = tableHTML
}

