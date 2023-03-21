let db = require('../../config/database');

const mysql = require('mysql');


const Service = {};

Service.getAll = function(callback) {
    db.query('SELECT * FROM services', callback);
};
Service.getAllServiceUser = function(id,callback) {
    db.query('SELECT * FROM serviceusers WHERE id_service = ?', [id], callback);
};

Service.create = function(service, callback) {
    db.query('INSERT INTO services(`shiftType`,`shiftClosed`) VALUES (?,?)', [service.shiftType, service.shiftClosed], callback);
};
Service.addUser = function(service, callback) {
    db.query('INSERT INTO serviceusers(id_service,id_user) VALUES (?,?)', [service.id_service, service.id_user], callback);
};
Service.update = function(id, service, callback) {
    db.query('UPDATE services SET firstname = ?, lastname = ?, status = ?, active = ? WHERE id = ?', [service.firstname, service.lastname, service.status, service.active, id], callback);
};

Service.delete = function(id, callback) {
    db.query('DELETE FROM services WHERE id = ?', [id], callback);
};

module.exports = Service;
