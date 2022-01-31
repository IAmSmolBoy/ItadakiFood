"use strict"
const ResDB = require("../models/RestaurantsDB")
const Restaurant = require("../models/restaurant")
const MulterConfig = require("../models/multerMiddleware/multerSettings")
const e = require("express")
var resDB = new ResDB()

function getAllRestaurants(request, respond) {
    resDB.getAllRestaurants(function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function postRestaurant(request, respond) {
    var restaurant = new Restaurant(null, request.body.cuisine, request.body.restaurantName, request.body.rating, request.body.cost, request.body.location, request.body.operatingHours, request.body.website)
    resDB.addRestaurant(restaurant, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}

function getResInfo(request, respond) {
    resDB.getResInfo(request.params.id, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}
function getResImages(request, respond) {
    resDB.getImages(request.params.id, function (error, result) {
        if (error) respond.json(error)
        else respond.json(result)
    })
}

function storeImage(req, res) {
    MulterConfig.multerConfig(req, res, 'public/resImages/', "res")
}

module.exports = {getAllRestaurants, postRestaurant, getResInfo, storeImage, getResImages}