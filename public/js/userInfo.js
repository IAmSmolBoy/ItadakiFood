if (sessionStorage.getItem("userPfp") != "null") $("#profileImg").attr("src", "./userPfp/" + sessionStorage.getItem("userPfp"))
$("#profileUsername").text("Username: " + sessionStorage.getItem("username"))
$("#delMsg").text(`Type ${sessionStorage.getItem("username")} in the input box below to confirm this action`)
$("#deleteInput").on("input", (e) => {
    if (e.target.value === sessionStorage.getItem("username")) $("#deleteBtn").prop("disabled", false)
    else $("#deleteBtn").prop("disabled", true)
})
function del() {
    var delUser = new XMLHttpRequest()
    delUser.open("delete", "/deleteUser/" + sessionStorage.getItem("userId"), true)
    delUser.setRequestHeader("Content-Type", "application/json")
    delUser.send(JSON.stringify({"pfp": sessionStorage.getItem("userPfp")}))
    window.location = "/restaurants.html"
    sessionStorage.clear()
}
$("#delForm").submit(function (e) {
    e.preventDefault()
    del()
})
$("#deleteBtn").off().click(del)
$(document).ready(function () {
    $("#logOut").click(function () {
        window.location = "/restaurants.html"
    })
})
var getUserInfo = new XMLHttpRequest()
getUserInfo.open("get", "/getUserInfo/" + sessionStorage.getItem("userId"), true)
getUserInfo.onload = function () {
    var userInfo = JSON.parse(getUserInfo.responseText)[0]
    $("#Hi").text(`Hello There, ${userInfo.first_name} ${userInfo.last_name}`)
    $("#profileGender").text("Gender: " + userInfo.gender)
    $("#profileAddress").text("Address: " + userInfo.address)
    $("#profileNumber").text("Mobile Number: " + userInfo.mobile_number)
    $("#profileEmail").text("Email: " + userInfo.email)
}
getUserInfo.send()