'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('bidTypes', [{
        name: 'Servicio',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Producto',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('bidTypes', null, {});

  }
};