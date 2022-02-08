var params = new URLSearchParams(window.location.search), paramUnpacked = [], secret
for (i of params) paramUnpacked.push(i[1])
var getUserInfo = new XMLHttpRequest()
getUserInfo.open("get", "/getUserInfo/" + paramUnpacked[0], true)
getUserInfo.onload = function () {
    secret = ":)" + JSON.parse(getUserInfo.responseText)[0].password
}
getUserInfo.send()
$("#resetPassForm").submit((e) => {
    e.preventDefault()
    e.target.checkValidity()
    if ($("#resPassInput1").val() != $("#resPassInput2").val()) $("#matchPass").modal()
    else {
        var resetPass = new XMLHttpRequest()
        resetPass.open("put", "/resetPassword/" +  paramUnpacked[0], true)
        resetPass.setRequestHeader("Content-Type", "application/json")
        payload = {token: paramUnpacked[1], newPass: $("#resPassInput1").val(), secret: secret, _id:paramUnpacked[0]}
        resetPass.onload = function () {
            $("body").append(`
            <div id="resetPassAlert" class="alert alert-warning alert-dismissible fade show" role="alert">
                ${resetPass.responseText}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>`)
        }
        resetPass.send(JSON.stringify(payload))
    }
})