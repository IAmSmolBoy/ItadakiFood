document.getElementsByClassName("searchDiv")[0].addEventListener("submit", function(e) {
    e.preventDefault()
    goToRestaurants()
})
$(document).ready(() => {
    $("#restaurants").attr("href", null)
    $("#restaurants").click(goToRestaurants)
})

function goToRestaurants () {
    var Link =  "restaurants.html"
    if (document.getElementsByClassName("searchbar")[0].value != "") {
        Link += "?search=" + document.getElementsByClassName("searchbar")[0].value
    }
    try {
        document.getElementsByClassName("searchDiv")[0].classList += " searchUp"
        document.getElementsByClassName("restaurantDim")[0].classList += " dimUp"
        setTimeout(() => {
            document.getElementsByClassName("searchDiv")[0].classList = "searchDiv"
            document.getElementsByClassName("restaurantDim")[0].classList = "restaurantDim"
        }, 700)
    }
    finally {
        setTimeout(() => {
            window.location.href = Link
        }, 500)
    }
}