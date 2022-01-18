"use strict"
class restaurant {
    constructor (id, cuisine, restaurant_name, rating, cost, location, operating_hours, website) {
        this.id = id
        this.cuisine = cuisine
        this.restaurant_name = restaurant_name
        this.rating = rating.toFixed(1)
        this.cost = cost.toFixed(1)
        this.location = location
        this.operating_hours = operating_hours
        this.website = website
    }
    getId () {return this.id}
    getCuisine () {return this.cuisine}
    getRestaurantName () {return this.restaurant_name}
    getRating () {return this.rating}
    getCost () {return this.cost}
    getLocation () {return this.location}
    getOperatingHours () {return this.operating_hours}
    getWebsite () {return this.website}
}
module.exports = restaurant