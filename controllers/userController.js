"use strict"
const UsersDB = require("../models/UsersDB")
const User = require("../models/user")
const bcrypt = require("bcrypt")
var usersDB = new UsersDB()

function getUserInfo(request, respond) {
    usersDB.getUserInfo(parseInt(request.params.id), function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function postUser(request, respond) {
    var user = new User(null, request.body.firstName, request.body.lastName, request.body.username, bcrypt.hashSync(request.body.password, 10), request.body.gender, request.body.address, request.body.email, request.body.number, request.body.pfp, 0)
    usersDB.addUser(user, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function editUser(request, respond) {
    var user = new User(parseInt(request.params.id), request.body.firstName, request.body.lastName, request.body.username, bcrypt.hashSync(request.body.password, 10), request.body.gender, request.body.address, request.body.email, request.body.number, request.body.pfp, 0)
    usersDB.editUser(user, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function deleteUser(request, respond) {
    usersDB.deleteUser(parseInt(request.params.id), function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}

function login(request, respond) {
    usersDB.login(request.body.username, function (error, result) {
        if (error) respond.json(error)
        else {
            if (bcrypt.compareSync(request.body.password, result[0].password)) respond.json("Logging In")
            else respond.json("Incorrect Username or Password")
        }
    })
}

function resetPassword(request, respond) {
    usersDB.resetPassword(bcrypt.hashSync(request.body.password, 10), request.body.email, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}

module.exports = {getUserInfo, postUser, editUser, deleteUser, login, resetPassword}