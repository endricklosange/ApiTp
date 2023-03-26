let db = require('../../config/database');


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
    db.query('UPDATE services SET shiftType = ?, shiftClosed = ?', [service.shiftType, service.shiftClosed, id], callback);
};

Service.delete = function(id, callback) {
    db.query('DELETE FROM serviceusers WHERE id = ?', [id], callback);
};

module.exports = Service;
