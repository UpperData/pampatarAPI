'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('Products', [{
        name: 'Mesa',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Collar',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Products', null, {});

  }
};
