'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('disponibilities', [{
        name: 'Inmediata',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Por Pedido',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('disponibilities', null, {});

  }
};