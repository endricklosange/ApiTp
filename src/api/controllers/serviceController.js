const ServiceModel = require('../models/serviceModel');

const ServiceController = {};

ServiceController.getAll = function (req, res) {
  ServiceModel.getAll(function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(200);
      res.json(rows);
    }
  });
};

ServiceController.getAllServiceUser = function (req, res) {
  const id = req.params.id;
  ServiceModel.getAllServiceUser(id, function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else if (rows.length === 0) {
      res.status(404).json({ message: 'Utilisateur introuvable' });
    } else {
      res.status(200);
      res.json(rows);
    }
  });
};

ServiceController.create = function (req, res) {
  const service = {
    shiftType: req.body.shiftType,
    shiftClosed: req.body.shiftClosed,
  };

  ServiceModel.create(service, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(201);
      service.id = result.insertId;
      res.status(201).json(service);
    }
  });
};
ServiceController.addUser = function (req, res) {
  const service = {
    id_service: req.body.id_service,
    id_user: req.body.id_user,
  };
  ServiceModel.addUser(service, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(201);
      service.id = result.insertId;
      res.status(201).json(service);
    }
  });
};

ServiceController.delete = function (req, res) {
  const id = req.params.id;
  ServiceModel.delete(id, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else if (result.affectedRows === 0) {
      res.status(404).json({ message: 'Utilisateur introuvable' });
    } else {
      res.status(204).send();
    }
  });
};

module.exports = ServiceController;
