const UserController = require('../controllers/userController');

module.exports = (server) => {
  server
    .route('/users')
    .get(UserController.getAll)
    .post(UserController.create);

  server
    .route('/users/:id')
    .get(UserController.getById)
    .put(UserController.update)
    .delete(UserController.delete);
};
