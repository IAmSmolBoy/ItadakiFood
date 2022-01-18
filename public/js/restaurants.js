var search = window.location.search.slice(8)
var getRestaurants = new XMLHttpRequest()
getRestaurants.open("GET", "/getRestaurants/rating", true)
getRestaurants.onload = function() {
    var restaurants = JSON.parse(getRestaurants.responseText)
    for (i in restaurants) {
        
    }

    for (i in restaurants) {
        if (i % 3 === 0) {
            document.getElementsByClassName("Table")[0].innerHTML += `<div id="card-deck${i / 3}" class="card-deck">`
        }
        document.getElementById("card-deck" + Math.floor(i / 3)).innerHTML += `
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${restaurants[i].restaurant_name}</h5>
                <ul id="resList${i}" class="resList">
                    <li class="resInfo">Cuisine: ${restaurants[i].cuisine}</li>
                    <li class="resInfo">Operating Hours: ${restaurants[i].operating_hours}</li>
                    <li class="resInfo">Average Rating: ${restaurants[i].rating}</li>
                    <li class="resInfo">Cost: ${restaurants[i].cost}</li>
                </ul>
            </div>
        </div>`
        if (restaurants[i].website) {
            document.getElementById("resList" + (i)).innerHTML += `<li class="resInfo"><a class="btn btn-info" href="${restaurants[i].website}">website</a></li>`
        }
    }

    var cuisines = []
    document.getElementsByClassName("filterNSort")[0].innerHTML += '<ul class="filterList"></ul>'
    for (i in restaurants) {
        if (!cuisines.includes(restaurants[i].cuisine)) {
            cuisines.push(restaurants[i].cuisine)
            document.getElementsByClassName("filterList")[0].innerHTML += `
            <li class="filters"><input type="checkbox" value="${restaurants[i].cuisine}" class="filterInput"><label for="" class="filterLabel">${restaurants[i].cuisine}</label></li>`
        }
    }
    for (i = 0; i < document.getElementsByClassName("filterInput").length; i++) {
        document.getElementsByClassName("filterInput")[i].addEventListener("click", (e) => {
            if (e.target.checked) {
                for (j = 0; j < document.getElementsByClassName("filterInput").length; j++) {
                    if (document.getElementsByClassName("filterInput")[j] != e.target) {
                        document.getElementsByClassName("filterInput")[j].checked = false
                    }
                }

            }
        })
    }
}
getRestaurants.send()