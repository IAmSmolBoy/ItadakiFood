"use strict"

var db = require("../db")
class UsersDB {
    getAllUsers(callback) {db.query("select * from itadakifood.users", callback)}
    getUserInfo(userId, callback) {db.query("select * from itadakifood.users where _id = ?", [userId], callback)}
    addUser(user, callback) {db.query(`insert into users (_id, first_name, last_name, username, password, gender, address, email, mobile_number, profile_pic, likes) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`, [user.getId(), user.getFirstName(), user.getLastName(), user.getUsername(), user.getPassword(), user.getGender(), user.getAddress(), user.getEmail(), user.getNumber(), user.getPFP(), user.getLikes()], callback)}
    editUser(user, callback) {
        if (user.getPassword()) db.query("update users set password = ? where _id = ?", [user.getPassword(), user.getId()])
        if (user.getPFP()) db.query("update users set profile_pic = ? where _id = ?", [user.getPFP(), user.getId()])
        db.query("update users set first_name = ?, last_name = ?, username = ?, gender = ?, address = ?, email = ?, mobile_number = ? where _id = ?", [user.getFirstName(), user.getLastName(), user.getUsername(), user.getGender(), user.getAddress(), user.getEmail(), user.getNumber(), user.getId()], callback)
    }
    deleteUser(userId, callback) {
        db.query("update reviews set userId = ?, username = ? where userId = ?", [null, "Deleted User", userId])
        db.query("delete from likes where userId2 = ?", [userId])
        db.query("delete from users where _id = ?", [userId], callback)
    }
    login(username, callback) {db.query("select password, profile_pic, _id from itadakifood.users where username = ?", [username], callback)}
    resetPassword(password, id, callback) {db.query("update itadakifood.users set password = ? where _id = ?", [password, id], callback)}
    getUserByEmail(email, callback) {db.query("select email, _id, password from users where email = ?", [email], callback)}
}

module.exports = UsersDB