"use strict"
class review {
    constructor (id, review, rating, date, title, restaurantId = 0, userId = 0, username = "", likes = 0) {
        this.id = id
        this.restaurantId = restaurantId
        this.userId = userId
        this.review = review
        this.rating = rating
        this.likes = likes
        this.date = date
        this.title = title
        this.username = username
    }
    getId () {return this.id}
    getRestaurantId () {return this.restaurantId}
    getUserId () {return this.userId}
    getReview () {return this.review}
    getRating () {return this.rating}
    getLikes () {return this.likes}
    getDate () {return this.date}
    getTitle () {return this.title}
    getUsername () {return this.username}
}
module.exports = review