const ServiceController = require('../controllers/serviceController');

module.exports = (server) => {
  server
    .route('/service')
    .get(ServiceController.getAll)
    .post(ServiceController.create);

  server
    .route('/service/:id')
    .get(ServiceController.getAllServiceUser)
    .delete(ServiceController.delete);

  server
    .route('/service/users')
    .post(ServiceController.addUser);

};
