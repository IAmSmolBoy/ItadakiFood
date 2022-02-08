var search = window.location.search.slice(12)
var getResImages = new XMLHttpRequest()
getResImages.open("GET", "/getResImages/" + search, true)
getResImages.onload = function() {
    var images = JSON.parse(getResImages.responseText)
    if (images.length != 0) {
        $("#noImages").attr("id", "images")
        for (i in images) {
            $("#images").after(`<img src="./resImages/${images[i].image}" alt="Restaurant Image" class="resImg">`)
        }
    }
    else {
        $("#gallery").css("overflow", "hidden")
    }
}
getResImages.send()

$(document).ready(() => {
    console.log(search)
    $("#resIdUpload").val(search)
    if (!sessionStorage.getItem("token")) $("#addImgBtn").attr("data-target", "#signInModal")
})
$(window).on("load", () => {
    console.log(search)
    $("#resIdUpload").val(search)
    if (!sessionStorage.getItem("token")) $("#addImgBtn").attr("data-target", "#signInModal")
})
$("#resId").val(search)

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

$(document).ready(() => {
    if (!sessionStorage.getItem("token")) $("#addReview").attr("data-target", "#signInModal")
    else {
        $("#logOut a").click(function() {
            $("#addReview").attr("data-target", "#signInModal")
            $(".like").attr("src", "./assets/icons8-facebook-like-64.png")
        })
    }
})
$(window).on("load", () => {
    if (!sessionStorage.getItem("token")) $("#addReview").attr("data-target", "#signInModal")
    else {
        $("#logOut a").click(function() {
            $("#addReview").attr("data-target", "#signInModal")
            $(".like").attr("src", "./assets/icons8-facebook-like-64.png")
        })
    }
})

var getResReviews = new XMLHttpRequest()
getResReviews.open("GET", "/getResReviews/" + search, true)
getResReviews.onload = function() {
    var reviews = JSON.parse(getResReviews.responseText)
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
    var displayedReviewIds = [], displayedReviews = []
    for (i in reviews) {
        if (!displayedReviewIds.includes(reviews[i].id)) {
            baseRating += reviews[i].rating
            displayedReviewIds.push(reviews[i].id)
            displayedReviews.push(reviews[i])
            $("#displayReviews").append(`
            <div id="review${displayedReviews.length - 1}" class="reviewDetailsContainer">
                <div class="userNLikes">
                    <div class="pfpImgContainer"><div class="square userPfpImg"></div></div>
                    <div class="usernameNLikesContainer">
                        <h2 id="${reviews[i].userId2}" class="username">${reviews[i].username}</h2>
                        <h4 id="likesCounter${displayedReviews.length - 1}" class="likeNum">likes</h4>
                    </div>
                </div>
                <div class="ratingNDate">
                    <div class="ratingStarImgs"></div>
                    <h3 class="date">${reviews[i].date.slice(0, 19).replace("T", " ")}</h3>
                </div>
                <h2 class="title">${reviews[i].title}</h2>
                <h4 class="review">${reviews[i].review}</h4>
                <div id="reviewBtns">
                    <img src="./assets/icons8-edit-384.png" id="edit${displayedReviews.length - 1}" alt="editBtn" class="editBtn reviewBtn">
                    <img src="./assets/icons8-delete-384.png" id="del${displayedReviews.length - 1}" alt="deleteBtn" class="deleteBtn reviewBtn">
                    <img src="./assets/icons8-facebook-like-64.png" id="like${displayedReviews.length - 1}" alt="like" class="likeBtn reviewBtn">
                </div>`)
            if (i < reviews.length - 1) $(`#review${displayedReviews.length - 1}`).append(`<hr>`)
            else $("#displayReviews").append(`<br>`)
            for (j = 0 ; j < reviews[i].rating; j++) document.getElementsByClassName("ratingStarImgs")[displayedReviews.length - 1].innerHTML += '<img src="./assets/icons8-star-selected.png" alt="star" class="reviewStarImg">'
            for (j = reviews[i].rating; j < 5; j++) document.getElementsByClassName("ratingStarImgs")[displayedReviews.length - 1].innerHTML += '<img src="./assets/icons8-star-96.png" alt="star" class="reviewStarImg">'
            if (reviews[i].userId2 === parseInt(sessionStorage.getItem("userId"))) {
                $("#like" + reviews[i].id).attr("src", "./assets/icons8-facebook-like-selected.png")
                $("#like" + reviews[i].id).addClass("liked")
            }
        }
    }
    var finalRating = baseRating / (displayedReviews.length + 1)
    $("#ratingNum").text(`Rating: ${finalRating.toFixed(1)}`)
    $(".starImg").each(function (i, obj) {if (i < finalRating) $(obj).attr("src", "./assets/icons8-star-selected.png")})
    if (finalRating % 1 != 0) document.getElementsByClassName("starImg")[Math.floor(finalRating)].src = "./assets/icons8-star-halved.png"
    $("#reviewNum").text(`${displayedReviews.length} reviews`)

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
            for (j in likeList) {
                if (displayedReviews[i].id === likeList[j].reviewId) like++
            }
            
            $("#likesCounter" + i).text(like + " like(s)")
        }
        for (j in likeList) {
            if (parseInt(sessionStorage.getItem("userId")) === likeList[j].userId2) {
                $("#like" + displayedReviewIds.indexOf(likeList[j].reviewId)).attr("src", "./assets/icons8-facebook-like-selected.png")
                $("#like" + displayedReviewIds.indexOf(likeList[j].reviewId)).addClass("liked")
                console.log(displayedReviewIds.indexOf(likeList[j].reviewId))
            }
        }
    }
    getAllLikes.send()

    $(".reviewBtn").off().click(function (e) {
        if (sessionStorage.getItem("token")) {
            if (e.target.classList.contains("likeBtn")) likeFunc(e)
            else if (parseInt(sessionStorage.getItem("userId")) === displayedReviews[e.target.id.replace(/[^0-9.]/g, "")].userId) {
                if (e.target.classList.contains("editBtn")) editFunc(e)
                else deleteFunc(e)
            }
            else {
                $("#signInTitle").text("Unable to edit or delete review")
                $("#signInBody").text("You are only allowed to edit or delete reviews made by yourself")
                $("#signInModal").modal()
                $('#signInModal').on('hidden.bs.modal', () => {
                    $("#signInTitle").text("Sign In")
                    $("#signInBody").text("This function is only accessible when signed in.")
                })
            }
        }
        else {
            $("#signInModal").modal()
        }
    })
    function likeFunc(e) {
        const likeBtn = e.target
        var method, url
        var likeCounter = $("#likesCounter" + likeBtn.id.replace(/[^0-9.]/g, ""))
        var newLikes = parseInt(likeCounter.text().replace(/[^0-9.]/g, ""))
        if (likeBtn.classList.contains("liked")) {
            likeBtn.src = "./assets/icons8-facebook-like-64.png"
            likeBtn.classList.remove("liked")
            method = "delete", url = "/removeLike"
            newLikes--
        }
        else {
            likeBtn.src = "./assets/icons8-facebook-like-selected.png"
            likeBtn.classList.add("liked")
            method = "post", url = "/likeReview"
            newLikes++
        }
        likeCounter.text(newLikes + " like(s)")
        var addOrRemoveLike = new XMLHttpRequest()
        addOrRemoveLike.open(method, url, true)
        addOrRemoveLike.setRequestHeader("Content-Type", "application/json")
        addOrRemoveLike.send(JSON.stringify({userId: parseInt(sessionStorage.getItem("userId")), reviewId: parseInt(displayedReviewIds[likeBtn.id.replace(/[^0-9.]/g, "")])}))
    }
    function editFunc (e) {
        $("#editComment").modal()
        var review = displayedReviews[e.target.id.replace(/[^0-9.]/g, "")]
        $("#editCommentForm").attr("action", "/editReviews/" + displayedReviewIds[e.target.id.replace(/[^0-9.]/g, "")])
        $("#editTitle").val(review.title)
        $("#editReview").val(review.review)
        $("#resIdInput").val(search)
        $("#editratingStarInputContainer").empty()
        for (i = 1; i <= 5; i++) $("#editratingStarInputContainer").append(`<input class="editratingInput" id="editRating${i}" type="radio" name="rating" value="${i}">
        <label class="ratingInputLabel" for="editRating${i}"><img src="./assets/icons8-star-96.png" id="${i}" alt="star" class="editstarInputImg"></label>`)
        var ratingInputted = 1;
        $(".editstarInputImg").click(function (ev) {
            $(".editstarInputImg").attr("src", "./assets/icons8-star-96.png")
            for (i = 0; i < ev.target.id.replace(/[^0-9.]/g, ""); i++) document.getElementsByClassName("editstarInputImg")[i].src = "./assets/icons8-star-selected.png"
            ratingInputted = ev.target.id.replace(/[^0-9.]/g, "")
        })
        console.log(review.rating, document.getElementsByClassName("editratingInput"), document.getElementsByClassName("editratingInput")[review.rating - 1])
        document.getElementsByClassName("editratingInput")[review.rating - 1].checked = true
        for (i = 0; i < review.rating; i++) {
            document.getElementsByClassName("editstarInputImg")[i].src = "./assets/icons8-star-selected.png"
        }
        $("#editCommentForm").submit(() => {
            location.reload()
        })
    }
    function deleteFunc(e) {
        $("#delReviewModal").modal()
        $("#delBtn").val(e.target.id.replace(/[^0-9.]/g, ""))
        $("#delReviewModal").on("hidden.bs.modal", () => {
            $("#delBtn").val("")
        })
        console.log($("#delBtn").val())
    }
    $("#delBtn").off().click((e) => {
        if ($("#delBtn").val() != "") {
            delReview = new XMLHttpRequest()
            delReview.open("delete", "/deleteReviews/" + displayedReviewIds[$("#delBtn").val()])
            delReview.onload = function () {
                console.log(delReview.responseText)
                location.reload()
            }
            delReview.send()
        }
    })
}
getResReviews.send()
$("#uploadImgInput").on("change", (e) => {
    const [file] = document.getElementById("uploadImgInput").files
    if (file) {
        document.getElementById("previewImg").src = URL.createObjectURL(file)
    }
})