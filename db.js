var mysql = require('mysql')
var connection = mysql.createConnection({ 
    host: ":)",
    port: ":)",
    user: ":)",
    password: ":)",
    database: "itadakifood"
})
connection.connect(err => {
    if (err) throw err
    console.log("Connected to ItadakiFood DB")
})
module.exports = connection