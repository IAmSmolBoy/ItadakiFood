"use strict"

var db = require("../db")
class ReviewsDB {
    getResReviews(resId, callback) {db.query("select * from itadakifood.reviews where restaurantId = ?", [resId], callback)}
    addReview(review, callback) {db.query(`insert into reviews (restaurantId, userId, review, rating, likes, date, title, username) values (?, ?, ?, ?, ?, ?, ?, ?)`, [review.getRestaurantId(), review.getUserId(), review.getReview(), review.getRating(), review.getLikes(), review.getDate(), review.getTitle(), review.getUsername()], callback)}
    editReview(review, callback) {db.query("update reviews set review = ?, rating = ?, date = ?, title = ? where _id = ?", [review.getReview(), review.getRating(), review.getDate(), review.getTitle(), review.getId()], callback)}
    deleteReview(reviewId, callback) {db.query("delete from reviews where _id = ?", [reviewId], callback)}
}

module.exports = ReviewsDB