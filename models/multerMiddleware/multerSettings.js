"use strict"
const multer = require("multer")
const ResDB = require("../RestaurantsDB")
var resDB = new ResDB()
const UsersDB = require("../UsersDB")
var usersDB = new UsersDB()
const User = require("../user")
const bcrypt = require("bcrypt")
var db = require("../../db")
const jwt = require("jsonwebtoken")
var secret = ":)"
function multerConfig (req, res, path, table) {
    var lastId, sql
    if (table === "res") {
        sql = "select max(_id) as id from itadakiFood.assets"
    }
    else if (table === "addUser" || table === "editUser") {
        sql = "select max(_id) as id from itadakiFood.users"
    }
    db.query(sql, (err, response) => {
        if (err) {
            console.log(err)
        }
        else {
            lastId = response[0].id
            if (table === "editUser") lastId = parseInt(req.params.id)
            var upload = multer({
                storage: multer.diskStorage({
                    destination: function (req, file, cb) {
                      cb(null, path)
                    },
                    filename: function (req, file, cb) {
                        var name = file.originalname, dotIndex = file.originalname.indexOf(".")
                        cb(null, name.slice(0, dotIndex) + (lastId + 1) + name.slice(dotIndex))
                    }
                  }),
                fileFilter: function(req, file, cb) {
                    if (!file.originalname.match(/\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF)$/)) cb(null, false);
                    else cb(null, true)
                }
            }).single('image');
            upload(req, res, function (err) {
                if (err instanceof multer.MulterError) {
                   console.log(err);
                } else if (err) {
                   console.log(err);
                }
                else {
                    var name, imageName, dotIndex;
                    if (req.file) {
                        name = req.file.originalname, dotIndex = name.indexOf(".")
                        imageName = name.slice(0, dotIndex) + (lastId + 1) + name.slice(dotIndex)
                    }
                    if (table === "res") {
                        console.log(imageName, name, dotIndex, req.body.resId)
                        resDB.addImages(req.body.resId, imageName, function (error, result) {
                            if (error) console.log(error)
                            else res.send(`<script>window.location='resInfo.html?restaurant=${req.body.resId}'</script>`)
                        })
                    }
                    else if (table === "addUser") {
                        var user = new User(null, req.body.firstName, req.body.lastName, req.body.username, bcrypt.hashSync(req.body.password, 10), req.body.gender, req.body.address, req.body.email, req.body.number, imageName, 0)
                        usersDB.addUser(user, function (err, result) {
                            if (err) {
                                console.log(err)
                                if (err.errno === 1062) res.send(`<script>window.location='register.html?usernameTaken'</script>`)
                                else console.log(err)
                            } 
                            else res.send("<script>window.location='login.html'</script>")
                        })
                    }
                    else if(table === "editUser") {
                        try {
                            console.log(req.body)
                            console.log(jwt.verify(req.body.token, secret))
                            var password;
                            if (req.body.password) password = bcrypt.hashSync(req.body.password, 10)
                            var user = new User(parseInt(req.params.id), req.body.firstName, req.body.lastName, req.body.username, password, req.body.gender, req.body.address, req.body.email, req.body.number, imageName, 0)
                            usersDB.editUser(user, function (error, result) {
                                if (error) console.log(error)
                                else res.send("<script>window.location='../userInfo.html'</script>")
                            })
                        }
                        catch (err) {
                            console.log(err)
                        }
                    }
                }
            })
        }
    })
    
}
module.exports = {multerConfig}