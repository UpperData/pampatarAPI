'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('envoiceTypes', [{
        name: 'Boelta',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Factura',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('envoiceTypes', null, {});

  }
};