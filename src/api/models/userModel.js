let db = require('../../config/database');

const mysql = require('mysql');


const User = {};

User.getAll = function(callback) {
    db.query('SELECT * FROM users', callback);
};

User.getById = function(id, callback) {
    db.query('SELECT * FROM users WHERE id = ?', [id], callback);
};

User.create = function(user, callback) {
    db.query('INSERT INTO users (firstname, lastname, status, active) VALUES (?, ?, ?, ?)', [user.firstname, user.lastname, user.status, user.active], callback);
};

User.update = function(id, user, callback) {
    db.query('UPDATE users SET firstname = ?, lastname = ?, status = ?, active = ? WHERE id = ?', [user.firstname, user.lastname, user.status, user.active, id], callback);
};

User.delete = function(id, callback) {
    db.query('DELETE FROM users WHERE id = ?', [id], callback);
};

module.exports = User;