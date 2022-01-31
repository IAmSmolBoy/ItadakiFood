document.getElementById("loginForm").addEventListener("submit", (e) => {
    e.preventDefault()
    try {
        var loginUser = new XMLHttpRequest(), usernameInput = document.getElementById("username").value, passInput = document.getElementById("password").value
        loginUser.open("POST", "/login", true)
        loginUser.setRequestHeader("Content-Type", "application/json")
        loginUser.onload = function() {
            var token = JSON.parse(loginUser.responseText)
            if (token.token) {
                $("#profile").removeClass("gone")
                $("#logOut").removeClass("gone")
                $("#register").addClass("gone")
                $("#login").addClass("gone")
                sessionStorage.setItem("token", token.token)
                sessionStorage.setItem("username", token.username)
                sessionStorage.setItem("userId", token.userId)
                window.location = "restaurants.html"
            }
            else {
                $("#wrong").modal()
            }
        }
        loginUser.send(JSON.stringify({username: usernameInput, password: passInput}))
    }
    catch(err) {
        $("#wrong").modal()
    }
})
$("#resetPassForm").submit(function (e) {
    e.preventDefault()
    var getResetLink = new XMLHttpRequest()
    getResetLink.open("post", "/getResetLink", true)
    getResetLink.setRequestHeader("Content-Type", "application/json")
    getResetLink.onload = () => {
        $("#forgetPass").modal("hide")
        $("body").append(`
        <div id="invalidAlert" class="alert alert-warning alert-dismissible fade show" role="alert">
            ${JSON.parse(getResetLink.responseText)}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
    }
    getResetLink.send(JSON.stringify({email: $("#emailInput").val()}))
})