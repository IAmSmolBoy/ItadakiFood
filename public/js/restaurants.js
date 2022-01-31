function displayRes(resList) {
    $(".Table").empty()
    for (i in resList) {
        if (i % 3 === 0) $(".Table").append(`<div id="card-deck${i / 3}" class="card-deck">`)
            $(`#card-deck${Math.floor(i / 3)}`).append(`
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title resName" id="${resList[i]._id}">${resList[i].restaurant_name}</h5>
                    <ul id="resList${resList[i]._id}" class="resList">
                        <li class="resInfo">Cuisine: ${resList[i].cuisine}</li>
                        <li class="resInfo">Operating Hours: ${resList[i].operating_hours}</li>
                        <li class="resInfo">Average Rating: ${resList[i].rating}</li>
                    </ul>
                </div>
            </div>`)
        if (resList[i].website) $(`#resList${resList[i]._id}`).append(`<li class="resInfo"><a target=_blank class="btn btn-info resBtns" href="${resList[i].website}">website</a></li>`)
        if (resList[i].email) $(`#resList${resList[i]._id}`).append(`<li class="resInfo"><a class="btn btn-info resBtns" href="mailto:${resList[i].email}">Email</a></li>`)
    }
}
var getRestaurants = new XMLHttpRequest()
getRestaurants.open("get", "/getRestaurants", true)
getRestaurants.onload = function () {
    var restaurants = filteredList = JSON.parse(getRestaurants.responseText), searchList = [], filters = [], search = window.location.search.slice(8)
    $(".searchbar").val(search)
    for (i in restaurants) {
        if (restaurants[i].restaurant_name.toLowerCase().includes(search.toLowerCase())) searchList.push(restaurants[i])
        if (!filters.includes(restaurants[i].cuisine)) {
            filters.push(restaurants[i].cuisine)
            $(".filterList").append(`<li class="filters"><input type="checkbox" value="${restaurants[i].cuisine}" class="filterInput"><label for="" class="filterLabel">${restaurants[i].cuisine}</label></li>`)
        }
    }
    displayRes(searchList)
    $(".resName").click(function() {
        window.open("resInfo.html?restaurant=" + $(this).attr("id"), "_blank")
    })
    $(".filterInput").click(function (e) {
        filteredList = []
        if ($(":checked").length > 1) {
            $(":checked").prop("checked", false)
            e.target.checked = true
        }
        if ($(":checked").length) {
            for (i in restaurants) if (restaurants[i].cuisine === $(this).val()) filteredList.push(restaurants[i])
        }
        else filteredList = restaurants
        displayRes(filteredList.filter(x => searchList.includes(x)))
    })
    $(".searchbar").on("input", function () {
        searchList = []
        if ($(this).val() != "") {
            for (i in restaurants) if (restaurants[i].restaurant_name.toLowerCase().includes($(this).val().toLowerCase())) searchList.push(restaurants[i])
        }
        else searchList = restaurants
        displayRes(searchList.filter(x => filteredList.includes(x)))
    })
}
getRestaurants.send()