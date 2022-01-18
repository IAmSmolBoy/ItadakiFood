"use strict"
const ReviewsDB = require("../models/ReviewsDB")
const Review = require("../models/review")
var reviewsDB = new ReviewsDB()

function getResReviews(request, respond) {
    reviewsDB.getResReviews(request.params.id, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function postReview(request, respond) {
    var now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    var review = new Review(null, request.body.review, request.body.rating, now, request.body.title, request.body.likes, request.body.restaurantId, request.body.userId, request.body.username)
    reviewsDB.addReview(review, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function editReview(request, respond) {
    var now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    var review = new Review(parseInt(request.params.id), request.body.review, request.body.rating, now, request.body.title)
    reviewsDB.editReview(review, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function deleteReview(request, respond) {
    reviewsDB.deleteReview(request.params.id, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}

module.exports = {getResReviews, postReview, editReview, deleteReview}