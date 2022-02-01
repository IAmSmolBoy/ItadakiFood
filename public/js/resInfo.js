var search = window.location.search.slice(12)
var getResImages = new XMLHttpRequest()
getResImages.open("GET", "/getResImages/" + search, true)
getResImages.onload = function() {
    var images = JSON.parse(getResImages.responseText)
    if (images.length != 0) {
        $("#noImages").attr("id", "images")
        for (i in images) {
            $("#images").after(`<img src="./resImages/${images[i].image}" alt="A-Roy-Thai Image" class="resImg">`)
        }
    }
    else {
        $("#gallery").css("overflow", "hidden")
    }
}
getResImages.send()

var baseRating;
var getResInfo = new XMLHttpRequest()
getResInfo.open("GET", "/getResInfo/" + search, true)
getResInfo.onload = function() {
    var data = JSON.parse(getResInfo.responseText)[0]
    $("#resName").text(data.restaurant_name)
    $("#cuisine").text("Cuisine: " + data.cuisine)
    $("#Location").text("Location: " + data.location)
    $("#OperatingHours").text("Operating Hours: " + data.operating_hours)
    $("#map").attr("src", "https://www.google.com/maps/embed/v1/place?key=:)" + data.location)
    baseRating = data.rating
    $("#Loc").text(data.location)
}
getResInfo.send()

var getResReviews = new XMLHttpRequest()
getResReviews.open("GET", "/getResReviews/" + search, true)
getResReviews.onload = function() {
    var reviews = JSON.parse(getResReviews.responseText)
    for (i in reviews) baseRating += reviews[i].rating
    var finalRating = baseRating / (reviews.length + 1)
    $("#ratingNum").text(`Rating: ${finalRating.toFixed(1)}`)
    $(".starImg").each(function (i, obj) {if (i < finalRating) $(obj).attr("src", "./assets/icons8-star-selected.png")})
    if (finalRating % 1 != 0) document.getElementsByClassName("starImg")[Math.floor(finalRating)].src = "./assets/icons8-star-halved-white.png"
    $("#reviewNum").text(`${reviews.length} reviews`)
    if (!sessionStorage.getItem("token")) {
        $("#addReview").attr("data-target", "#signInModal")
    }
    else {
        $(document).ready(function () {
            $("#logOut a").click(function() {
                $("#addReview").attr("data-target", "#signInModal")
                $(".like").attr("src", "./assets/icons8-facebook-like-64.png")
            })
        })
    }
    for (i = 1; i <= 5; i++) $("#ratingStarInputContainer").append(`<input class="ratingInput" id="${i}" type="radio" name="rating" value="${i}">
    <label class="ratingInputLabel" for="${i}"><img src="./assets/icons8-star-96.png" id="${i}" alt="star" class="starInputImg"></label>`)
    var ratingInputted = 1;
    $(".starInputImg").click(function (e) {
        $(".starInputImg").attr("src", "./assets/icons8-star-96.png")
        for (i = 0; i < e.target.id; i++) document.getElementsByClassName("starInputImg")[i].src = "./assets/icons8-star-selected.png"
        ratingInputted = e.target.id
    })
    document.getElementsByClassName("ratingInput")[0].checked = true
    document.getElementsByClassName("starInputImg")[0].src = "./assets/icons8-star-selected.png"
    $("#userId").val(sessionStorage.getItem("userId"))
    $("#username").val(sessionStorage.getItem("username"))
    $("#newCommentForm").submit(function(e) {
        e.preventDefault()
        if (document.getElementById('newCommentForm').checkValidity()) {
            var addReview = new XMLHttpRequest()
            addReview.open("post", "/addReviews", true)
            addReview.setRequestHeader("Content-Type", "application/json")
            var formData = new Object()
            formData.title = $("#title").val()
            formData.review = $("#review").val()
            formData.rating = ratingInputted
            formData.username = sessionStorage.getItem("username")
            formData.userId = sessionStorage.getItem("userId")
            formData.restaurantId = search
            addReview.send(JSON.stringify(formData))
            $("#newComment").modal("hide")
            location.reload()
        }
    })
    var displayedReviewIds = [], idx = 0, displayedReviews = []
    for (i in reviews) {
        if (!displayedReviewIds.includes(reviews[i].id)) {
            displayedReviewIds.push(reviews[i].id)
            displayedReviews.push(reviews[i])
            $("#displayReviews").append(`
            <div id="review${idx}" class="reviewDetailsContainer">
                <div class="userNLikes">
                    <div class="pfpImgContainer"><div class="square userPfpImg"></div></div>
                    <div class="usernameNLikesContainer">
                        <h2 id="${reviews[i].userId2}" class="username">${reviews[i].username}</h2>
                        <h4 id="likes${idx}" class="likeNum">likes</h4>
                    </div>
                </div>
                <div class="ratingNDate">
                    <div class="ratingStarImgs"></div>
                    <h3 class="date">${reviews[i].date.slice(0, 19).replace("T", " ")}</h3>
                </div>
                <h2 class="title">${reviews[i].title}</h2>
                <h4 class="review">${reviews[i].review}</h4>
                <button class="likeBtn" value="${reviews[i].id}"><img src="./assets/icons8-facebook-like-64.png" id="${reviews[i].id}" alt="like" class="like"></button>`)
            if (i < reviews.length - 1) $(`#review${idx}`).append(`<hr>`)
            else $("#displayReviews").append(`<br>`)
            for (j = 0 ; j < reviews[i].rating; j++) document.getElementsByClassName("ratingStarImgs")[idx].innerHTML += '<img src="./assets/icons8-star-selected.png" alt="star" class="reviewStarImg">'
            for (j = reviews[i].rating; j < 5; j++) document.getElementsByClassName("ratingStarImgs")[idx].innerHTML += '<img src="./assets/icons8-star-96.png" alt="star" class="reviewStarImg">'
            idx++
        }
        if (reviews[i].userId2 === parseInt(sessionStorage.getItem("userId"))) {
            $("#" + reviews[i].id).attr("src", "./assets/icons8-facebook-like-selected.png")
            document.getElementById(reviews[i].id).classList.add("liked")
        }
    }
    var getUsers = new XMLHttpRequest()
    getUsers.open("get", "/getAllUsers", true)
    getUsers.onload = function () {
        var userInfo = JSON.parse(getUsers.responseText)
        var userIds = [], pfpList = []
        for (i in userInfo) {
            pfpList.push(userInfo[i].profile_pic)
            userIds.push(userInfo[i]._id)
        }
        for (i in displayedReviews) {
            if (pfpList[userIds.indexOf(displayedReviews[i].userId)]) {
                document.getElementsByClassName("userPfpImg")[i].style = `background-image: url("./userPFP/${pfpList[userIds.indexOf(displayedReviews[i].userId)]}")`
            }
        }
    }
    getUsers.send()
    
    var getAllLikes = new XMLHttpRequest()
    getAllLikes.open("get", "/getAllLikes", true)
    getAllLikes.onload = function () {
        var likeList = JSON.parse(getAllLikes.responseText)
        var like;
        for (i in displayedReviews) {
            like = 0
            for (j in likeList) if (displayedReviews[i].id === likeList[j].reviewId) like++
            $("#likes" + i).text(like + " like(s)")
        }
    }
    getAllLikes.send()
    $(".likeBtn").off().click(function(e) {
        const likeBtn = e.target
        if (sessionStorage.getItem("token")) {
            var method, url
            if (likeBtn.classList.contains("liked")) {
                likeBtn.src = "./assets/icons8-facebook-like-64.png"
                likeBtn.classList.remove("liked")
                method = "delete", url = "/removeLike"
            }
            else {
                likeBtn.src = "./assets/icons8-facebook-like-selected.png"
                likeBtn.classList.add("liked")
                method = "post", url = "/likeReview"
            }
            var addOrRemoveLike = new XMLHttpRequest()
            addOrRemoveLike.open(method, url, true)
            addOrRemoveLike.setRequestHeader("Content-Type", "application/json")
            console.log({userId: sessionStorage.getItem("userId"), reviewId: e.target.id})
            addOrRemoveLike.send(JSON.stringify({userId: sessionStorage.getItem("userId"), reviewId: e.target.id}))
        }
        else {
            $("#signInModal").modal()
        }
    })
}
getResReviews.send()