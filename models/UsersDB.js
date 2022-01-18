"use strict"

var db = require("../db")
class UsersDB {
    getUserInfo(userId, callback) {db.query("select * from itadakifood.users where _id = ?", [userId], callback)}
    addUser(user, callback) {db.query(`insert into users (_id, first_name, last_name, username, password, gender, address, email, mobile_number, profile_pic, likes) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`, [user.getId(), user.getFirstName(), user.getLastName(), user.getUsername(), user.getPassword(), user.getGender(), user.getAddress(), user.getEmail(), user.getNumber(), user.getPFP(), user.getLikes()], callback)}
    editUser(user, callback) {db.query("update users set first_name = ?, last_name = ?, username = ?, password = ?, gender = ?, address = ?, email = ?, mobile_number = ?, profile_pic = ? where _id = ?", [user.getFirstName(), user.getLastName(), user.getUsername(), user.getPassword(), user.getGender(), user.getAddress(), user.getEmail(), user.getNumber(), user.getPFP(), user.getId()], callback)}
    deleteUser(userId, callback) {
        db.query("update reviews set userId = ?, username = ? where userId = ?", [null, "Deleted User", userId])
        db.query("delete from users where _id = ?", [userId], callback)
    }
    login(username, callback) {db.query("select password from itadakifood.users where username = ?", [username], callback)}
    resetPassword(password, email, callback) {db.query("update users set password = ? where email = ?", [password, email], callback)}
}

module.exports = UsersDB