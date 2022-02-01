var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var resController = require("./controllers/restaurantController")
var reviewController = require("./controllers/reviewController")
var userController = require("./controllers/userController")

var indexRouter = require('./routes/index');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);


app.get("/getRestaurants", resController.getAllRestaurants)
app.get("/getResInfo/:id", resController.getResInfo)
app.get("/getResImages/:id", resController.getResImages)
app.post("/addRestaurants", resController.postRestaurant)
app.post("/uploadImages", resController.storeImage)
app.get("/getResReviews/:id", reviewController.getResReviews)
app.post("/addReviews", reviewController.postReview)
app.put("/editReviews/:id", reviewController.editReview)
app.delete("/deleteReviews/:id", reviewController.deleteReview)
app.get("/getAllLikes", reviewController.getAllLikes)
app.post("/likeReview", reviewController.likeReview)
app.delete("/removeLike", reviewController.removeLike)
app.get("/getAllUsers", userController.getAllUsers)
app.get("/getUserInfo/:id", userController.getUserInfo)
app.post("/login", userController.login)
app.post("/addUsers", userController.postUser)
app.post("/editProfile/:id", userController.editUser)
app.post("/getResetLink", userController.getResetLink)
app.put("/resetPassword/:id", userController.resetPassword)
app.delete("/deleteUser/:id", userController.deleteUser)

module.exports = app;