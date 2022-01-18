"use strict"
const ResDB = require("../models/RestaurantsDB")
const Restaurant = require("../models/restaurant")
const multer = require("multer")
const res = require("express/lib/response")
var resDB = new ResDB()

function getAllRestaurants(request, respond) {
    resDB.getAllRestaurants(request.params.order, function (error, result) {
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

function storeImage(req, res) {
    var upload = multer({
        storage: multer.diskStorage({
            destination: function (req, file, cb) {
              cb(null, 'public/images/')
            },
            filename: function (req, file, cb) {
                cb(null, file.originalname)
            }
          }),
        fileFilter: function(req, file, cb) {
            if (!file.originalname.match(/\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF)$/)) cb(null, false);
            else cb(null, true)
        }
    }).single('image');
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
           res.send(err);
        } else if (err) {
           res.send(err);
        }
        else {
            var imageName = req.file.originalname
            resDB.addImages(req.body.resId, imageName, function (error, result) {
                if (error) res.json(error)
                else res.json(result)
            })
        }
    })
}

module.exports = {getAllRestaurants, postRestaurant, getResInfo, storeImage}