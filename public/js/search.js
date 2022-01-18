document.getElementsByClassName("searchDiv")[0].addEventListener("submit", function(e) {
    e.preventDefault()
    goToRestaurants()
})

function goToRestaurants () {
    var Link =  "restaurants.html"
    if (document.getElementsByClassName("searchbar")[0].value != "") {
        Link += "?search=" + document.getElementsByClassName("searchbar")[0].value
    }
    window.location.href = Link
}