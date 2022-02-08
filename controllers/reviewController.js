"use strict"
const ReviewsDB = require("../models/ReviewsDB")
const Review = require("../models/review")
var reviewsDB = new ReviewsDB()

function getAllReviews(req, respond) {
    reviewsDB.getAllReviews(function (err, res) {
        if (err) respond.json(err)
        else respond.json(res)
    })
}
function getResReviews(request, respond) {
    reviewsDB.getResReviews(request.params.id, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function postReview(request, respond) {
    var now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    var review = new Review(null, request.body.review, request.body.rating, now, request.body.title, request.body.restaurantId, request.body.userId, request.body.username)
    reviewsDB.addReview(review, function (error, result) {
        if (error) console.log(error)
        else respond.json(result)
    })
}
function editReview(request, respond) {
    var now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    var review = new Review(parseInt(request.params.id), request.body.review, request.body.rating, now, request.body.title)
    console.log(request.body)
    reviewsDB.editReview(review, function (error, result) {
        if (error) respond.json(error)
        else respond.send(`<script>window.location='/resInfo.html?restaurant=${request.body.restaurantId}'</script>`)
    })
}
function deleteReview(request, respond) {
    reviewsDB.deleteReview(request.params.id, function (error, result) {
        if (error) console.log(error)
        else respond.json(result)
    })
}
function getAllLikes(req, respond) {
    reviewsDB.getAllLikes(function(err, res) {
        if (err) console.log(err)
        else respond.json(res)
    })
}
function likeReview(req, respond) {
    reviewsDB.likeReview(req.body.reviewId, req.body.userId, function (err, res) {
        if (err) console.log(err)
        else console.log(res)
    })
}
function removeLike(req, respond) {
    reviewsDB.removeLike(req.body.userId, req.body.reviewId, function (err, res) {
        if (err) console.log(err)
        else  respond.json(res)
    })
}

module.exports = {getResReviews, postReview, editReview, deleteReview, getAllLikes, likeReview, removeLike}