try {
    document.getElementsByClassName("pfpInput")[0].addEventListener("change", (e) => {
        const [file] = document.getElementsByClassName("pfpInput")[0].files
        if (file) {
            document.getElementsByClassName("pfpImg")[0].src = URL.createObjectURL(file)
        }
    })
}
finally {
    document.getElementById("showPassInput").addEventListener("click", (e) => {
        const password = document.getElementsByClassName("password")[0]
        if (password.type === "password") {
            password.type = "text"
        }
        else {
            password.type = "password"
        }
    })
    if (window.location.search.slice(1) === "usernameTaken") $("#usernameTaken").modal()
}