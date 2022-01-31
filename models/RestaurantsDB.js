"use strict"

var db = require("../db")
class RestaurantsDB {
    getAllRestaurants(callback) {db.query(`select * from itadakifood.restaurants order by rating desc`, callback)}
    addRestaurant(restaurant, callback) {db.query(`insert into restaurants (cuisine, restaurant_name, rating, cost, location, operating_hours, website) values (?, ?, ?, ?, ?, ?, ?)`, [restaurant.getCuisine(), restaurant.getRestaurantName(), restaurant.getRating(), restaurant.getCost(), restaurant.getLocation(), restaurant.getOperatingHours(), restaurant.getWebsite()], callback)}
    getResInfo(resId, callback) {db.query("select * from itadakifood.restaurants where _id = ?", [resId], callback)}
    getImages(resId, callback) {db.query("select image from itadakifood.assets where restaurantId2 = ?", [resId], callback)}
    addImages(resId, path, callback) {db.query("insert into itadakifood.assets (restaurantId2, image) values (?, ?)", [resId, path], callback)}
}

module.exports = RestaurantsDB