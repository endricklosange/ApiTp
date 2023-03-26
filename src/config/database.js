let mysql = require('mysql2');

//créer la connexion
let db = mysql.createConnection({

    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'ApiJS'
})

//creer la connexion
db.connect()
// exporte la connexion
module.exports = db;
