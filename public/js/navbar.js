var token = sessionStorage.getItem("token")
function signedIn () {
    if (token) {
        $("#register").addClass("gone")
        $("#login").addClass("gone")
        $("#profile").removeClass("gone")
        $("#logOut").removeClass("gone")
        $("#usernameProfileLink").text(sessionStorage.getItem("username"))
        var getuserInfo = new XMLHttpRequest()
        getuserInfo.open("get", "/getUserInfo/" + sessionStorage.getItem("userId"), true)
        getuserInfo.onload = function () {sessionStorage.setItem("userPfp", JSON.parse(getuserInfo.responseText)[0].profile_pic)
            if (JSON.parse(getuserInfo.responseText)[0].profile_pic) $("#pfp").attr("src", "userPFP/" + JSON.parse(getuserInfo.responseText)[0].profile_pic)
        }
        getuserInfo.send()
    }
}
$(window).on("load", signedIn)
$(document).ready(signedIn)
function logOut() {
    $("#register").removeClass("gone")
    $("#login").removeClass("gone")
    $("#profile").addClass("gone")
    $("#logOut").addClass("gone")
    sessionStorage.clear()
    
}