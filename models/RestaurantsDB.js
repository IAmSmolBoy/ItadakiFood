"use strict"

var db = require("../db")
class RestaurantsDB {
    getAllRestaurants(order, callback) {db.query(`select * from itadakifood.restaurants order by ${order} desc`, callback)}
    addRestaurant(restaurant, callback) {db.query(`insert into restaurants (cuisine, restaurant_name, rating, cost, location, operating_hours, website) values (?, ?, ?, ?, ?, ?, ?)`, [restaurant.getCuisine(), restaurant.getRestaurantName(), restaurant.getRating(), restaurant.getCost(), restaurant.getLocation(), restaurant.getOperatingHours(), restaurant.getWebsite()], callback)}
    getResInfo(resId, callback) {db.query("select itadakifood.restaurants.*, itadakifood.assets.image from itadakifood.restaurants left join itadakifood.assets on itadakifood.assets.restaurantId2 = itadakifood.restaurants._id where itadakifood.restaurants._id = ?", [resId], callback)}
    addImages(resId, path, callback) {db.query("insert into itadakifood.assets (restaurantId2, image) values (?, ?)", [resId, path], callback)}
}

module.exports = RestaurantsDB