"use strict"
class user {
    constructor (id, first_name, last_name, username, password, gender, address, email, number, pfp, likes) {
        this.id = id
        this.firstName = first_name 
        this.lastName = last_name
        this.username = username 
        this.password = password 
        this.gender = gender
        this.address = address
        this.email = email
        this.number = number
        this.pfp = pfp
        this.likes = likes 
    }
    getId () {return this.id}
    getFirstName() {return this.firstName}
    getLastName() {return this.lastName}
    getUsername() {return this.username}
    getPassword() {return this.password}
    getGender() {return this.gender}
    getAddress() {return this.address}
    getEmail() {return this.email}
    getNumber() {return this.number}
    getPFP() {return this.pfp}
    getLikes() {return this.likes}
}
module.exports = user