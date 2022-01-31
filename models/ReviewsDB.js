"use strict"

var db = require("../db")
class ReviewsDB {
    getAllReviews(callback) {db.query("select * from reviews", callback)}
    getResReviews(resId, callback) {db.query("select * from reviews left join likes on id = reviewId where restaurantId = ?", [resId], callback)}
    addReview(review, callback) {db.query(`insert into reviews (restaurantId, userId, review, rating, date, title, username) values (?, ?, ?, ?, ?, ?, ?)`, [review.getRestaurantId(), review.getUserId(), review.getReview(), review.getRating(), review.getDate(), review.getTitle(), review.getUsername()], callback)}
    editReview(review, callback) {db.query("update reviews set review = ?, rating = ?, date = ?, title = ? where _id = ?", [review.getReview(), review.getRating(), review.getDate(), review.getTitle(), review.getId()], callback)}
    deleteReview(reviewId, callback) {
        db.query("delete from likes where reviewId = ?", [reviewId])
        db.query("delete from reviews where _id = ?", [reviewId], callback)
    }
    getAllLikes(callback) {db.query("select * from itadakifood.likes", callback)}
    likeReview(reviewId, userId, callback) {db.query("insert into itadakifood.likes (userId2, reviewId) values (?, ?)", [userId, reviewId], callback)}
    removeLike(userId, reviewId, callback) {db.query("delete from itadakifood.likes where userId2 = ? and reviewId = ?", [userId, reviewId], callback)}
}

module.exports = ReviewsDB