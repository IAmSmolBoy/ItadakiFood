if (sessionStorage.getItem("userPfp") != "null") $(".pfpImg").attr("src", "./userPFP/" + sessionStorage.getItem("userPfp"))
$("#ediProfileForm").attr("action", "/editProfile/" + sessionStorage.getItem("userId"))
var getUserInfo = new XMLHttpRequest()
getUserInfo.open("get", "/getUserInfo/" + sessionStorage.getItem("userId"), true)
getUserInfo.onload = function () {
    var userInfo = JSON.parse(getUserInfo.responseText)[0]
    $("#firstName").val(userInfo.first_name)
    $("#lastName").val(userInfo.last_name)
    $("#username").val(userInfo.username)
    $("#address").val(userInfo.address)
    $("#email").val(userInfo.email)
    $("#number").val(userInfo.mobile_number)
    if (userInfo.gender === "Male") document.getElementsByClassName("genderRadio")[0].checked = true
    else document.getElementsByClassName("genderRadio")[1].checked = true
}
getUserInfo.send()