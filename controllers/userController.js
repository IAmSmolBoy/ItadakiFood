"use strict"
const UsersDB = require("../models/UsersDB")
const fs = require("fs")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")
const MulterConfig = require("../models/multerMiddleware/multerSettings")
const sgMail = require('@sendgrid/mail')
const sendgrid = ":)"
var secret = ":)"
var usersDB = new UsersDB()

function getAllUsers(req, respond) {
    usersDB.getAllUsers(function (err, res) {
        if (err) console.log(err)
        else respond.json(res)
    })
}
function getUserInfo(request, respond) {
    usersDB.getUserInfo(parseInt(request.params.id), function (error, result) {
        if (error) console.log(error)
        else respond.json(result)
    })
}
function postUser(request, respond) {
    MulterConfig.multerConfig(request, respond, 'public/userPFP/', "addUser")
}
function editUser(request, respond) {
    if (request.body.pfp && fs.existsSync("./public/userPFP/" + request.body.pfp)) {
        fs.unlink("./public/userPFP/" + request.body.pfp, (err) => {
            if (err) console.log(err)
            else console.log("Deleted")
        })
    }
    MulterConfig.multerConfig(request, respond, 'public/userPFP/', "editUser")
}
function deleteUser(request, respond) {
    if (fs.existsSync("./public/userPFP/" + request.body.pfp)) {
        fs.unlink("./public/userPFP/" + request.body.pfp, (err) => {
            if (err) console.log(err)
            else console.log("Deleted")
        })
    }
    usersDB.deleteUser(parseInt(request.params.id), function (error, result) {
        if (error) console.log(error)
        else respond.send("<script>window.location='restaurants.html'</script>")
    })
}
function login(request, respond) {
    usersDB.login(request.body.username, function (error, result) {
        if (error) respond.json(error)
        else {
            try {
                if (bcrypt.compareSync(request.body.password, result[0].password)) {
                    var token = jwt.sign(request.body.username, secret)
                    respond.json({token: token, pfp: result[0].profile_pic, username: request.body.username, userId: result[0]._id})
                }
                else {
                    respond.json("")
                }
            }
            catch(err) {
                respond.json("")
            }
        }
    })
}
function resetPassword(req, respond) {
    try {
        var payload = jwt.verify(req.body.token, req.body.secret)
        usersDB.resetPassword(bcrypt.hashSync(req.body.newPass, 10), req.body._id, function (err, res) {
            if (err) console.log(err)
            else respond.json(res)
        })
    } catch (error) {
        console.log(error)
    }
}

function getResetLink(req, respond) {
    usersDB.getUserByEmail(req.body.email, function (err, res) {
        if (err) console.log(err)
        else if (res.length != 0) {
            var token = jwt.sign({email: res[0].email, userId: res[0]._id}, secret + res[0].password, {expiresIn: "15m"})
            sgMail.setApiKey(sendgrid)
            const msg = {
                to: res[0].email,
                from: 'noreplyItadakiFood@gmail.com',
                subject: 'Reset Password',
                text: `This link will allow you to reset your password. If this was not you, ignore the link. http://127.0.0.1:8080/resetPassword.html?userId=${res[0]._id}&token=${token}`,
                html: `<strong>This link will allow you to reset your password. If this was not you, ignore the link.<br><a href="http://127.0.0.1:8080/resetPassword.html?userId=${res[0]._id}&token=${token}">http://127.0.0.1:8080/resetPassword.html?userId=${res[0]._id}&token=${token}</a></strong>`
            }
            sgMail.send(msg)
                .then(() => {
                    respond.json('Email sent')
                })
                .catch((error) => {
                    console.error(error)
                })
        }
        else {
            respond.json("User not found")
        }
    })
}

module.exports = {getAllUsers, getUserInfo, postUser, editUser, deleteUser, login, resetPassword, getResetLink}