const ServiceController = require('../controllers/serviceController');

module.exports = (server) => {
  server
    .route('/service')
    .get(ServiceController.getAll)
    .post(ServiceController.create);

  server
    .route('/service/:id')
    .get(ServiceController.getAllServiceUser)
    .put(ServiceController.update)
    .delete(ServiceController.delete);

  server
    .route('/service/addUsers')
    .post(ServiceController.addUser);

};
