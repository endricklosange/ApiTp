const TipsController = require('../controllers/tipsController');

module.exports = (server) => {
  server
    .route('/tips')
    .get(TipsController.getAll)
    .post(TipsController.create);
    
  server
    .route('/tips/total')
    .get(TipsController.total)
  server
    .route('/table')
    .post(TipsController.createATable);
  server
    .route('/tips/payment')
    .get(TipsController.getAllUserPayment)
    .post(TipsController.payment)
    

  
};
