'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('deliveries', [{
        name: 'TEST1',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'TEST2',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('deliveries', null, {});

  }
};