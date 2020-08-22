'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('reasons', [{
        name: 'Festividades',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Estacional',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Destacados',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('reasons', null, {});

  }
};