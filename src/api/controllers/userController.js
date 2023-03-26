const User = require('../models/userModel');

const UserController = {};

UserController.getAll = function (req, res) {
  User.getAll(function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(200);
      res.json(rows);
    }
  });
};

UserController.getById = function (req, res) {
  const id = req.params.id;
  User.getById(id, function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else if (rows.length === 0) {
      res.status(404).json({ message: 'Utilisateur introuvable' });
    } else {
      res.status(200);
      res.json(rows[0]);
    }
  });
};

UserController.create = function (req, res) {
  const user = {
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    status: req.body.status,
    active: req.body.active
  };

  User.create(user, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(201);
      user.id = result.insertId;
      res.status(201).json(user);
    }
  });
};

UserController.update = function (req, res) {
  const id = req.params.id;
  const user = {
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    status: req.body.status,
    active: req.body.active
  };
  User.update(id, user, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else if (result.affectedRows === 0) {
      res.status(404).json({ message: 'Utilisateur introuvable' });
    } else {
      user.id = id;
      res.json(user);
    }
  });
};

UserController.delete = function (req, res) {
  const id = req.params.id;
  User.delete(id, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else if (result.affectedRows === 0) {
      res.status(404).json({ message: 'Utilisateur introuvable' });
    } else {
      res.status(204).send();
    }
  });
};

module.exports = UserController;
