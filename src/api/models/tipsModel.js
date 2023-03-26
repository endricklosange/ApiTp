let db = require('../../config/database');



const tipsModel = {};

tipsModel.create = function(tips, callback) {
    db.query('INSERT INTO tabletips(`id_restaurantTable`,id_service,tips) VALUES (?,?,?)', [tips.id_restaurantTable,tips.id_service,tips.tips], callback);
};
tipsModel.getAll = function( callback) {
    db.query('SELECT rt.id, rt.name, SUM(tt.tips) as total_tips FROM restauranttable rt JOIN tabletips tt ON rt.id = tt.id_restaurantTable GROUP BY rt.id HAVING COUNT(*) > 1;', callback);
};
tipsModel.getAllUserPayment = function(callback) {
    db.query('SELECT tipspayments.id_user, SUM(tipspayments.amount) AS total_amount, users.firstname, users.lastname FROM tipspayments JOIN users ON tipspayments.id_user = users.id GROUP BY tipspayments.id_user', callback);
  };
tipsModel.getById = function(id, callback) {
    db.query('SELECT * FROM tabletips WHERE id = ?', [id], callback);
};
tipsModel.update = function(id, tips, callback) {
    db.query('UPDATE tabletips SET id_restaurantTable = ?, id_service = ?, tips = ? WHERE id = ?', [tips.id_restaurantTable,tips.id_service,tips.tips, id], callback);
};
tipsModel.createATable = function(restauranttable, callback) {
    db.query('INSERT INTO restauranttable(name) VALUES (?)', [restauranttable.name], callback);
};
tipsModel.total = function( callback) {
    db.query('SELECT * FROM total_restaurant_tips', callback);
};
tipsModel.payment = function(tipspayments, callback) {
    db.query('INSERT INTO tipspayments(id_user,amount) VALUES (?,?)', [tipspayments.id_user,tipspayments.amount], function(err, result) {
        if (err) {
            callback(err);
        } else {
            const sql = "UPDATE total_restaurant_tips SET total_tips = total_tips - ?";
            db.query(sql, [tipspayments.amount], function (err, result) {
              if (err) {
                callback(err);
              } else {
                callback(null, result);
              }
            });
        }
    });
};

tipsModel.updateTotalTips = function(callback) {
    const sql = "SELECT SUM(tips) as total_tips FROM tabletips";
    db.query(sql, function (err, result) {
      if (err) {
        callback(err);
      } else {
        const total = result[0].total_tips || 0;
        const sql = "UPDATE total_restaurant_tips SET total_tips = ?";
        db.query(sql, [total], function (err, result) {
          if (err) {
            callback(err);
          } else {
            callback(null, total);
          }
        });
      }
    });
  }
module.exports = tipsModel;
