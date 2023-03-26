const TipsModel = require('../models/tipsModel');

const TipsController = {};

TipsController.getAll = function (req, res) {
  TipsModel.getAll(function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(200);
      res.json(rows);
      console.log(rows);
    }
  });
};
TipsController.getAllUserPayment = function (req, res) {
  TipsModel.getAllUserPayment(function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(200);
      res.json(rows);
      console.log(rows);
    }
  });
};
TipsController.total = function (req, res) {
  TipsModel.total(function (err, rows) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(200);
      res.json(rows);
      console.log(rows);
    }
  });
};

TipsController.create = function (req, res) {
  const tips = {
    id_restaurantTable: req.body.id_restaurantTable,
    id_service: req.body.id_service,
    tips: req.body.tips
  };
  TipsModel.create(tips, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      tips.id = result.insertId;
      TipsModel.updateTotalTips(function (err, total) {
        if (err) {
          res.status(500).json({ error: err });
        } else {
          res.status(201).json({ tips: tips, total_tips: total });
        }
      });
    }
  });
};

TipsController.createATable = function (req, res) {
  const tips = {
    name: req.body.name,
  };
  TipsModel.createATable(tips, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(201);
      tips.id = result.insertId;
      res.status(201).json(tips);
    }
  });
};
TipsController.payment = function (req, res) {
  const tips = {
    id_user: req.body.id_user,
    amount: req.body.amount
  };
  TipsModel.payment(tips, function (err, result) {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      res.status(201);
      tips.id = result.insertId;
      res.status(201).json(tips);
    }
  });
};



module.exports = TipsController;
