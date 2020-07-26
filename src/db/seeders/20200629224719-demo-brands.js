'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Brands', [{
        name: 'Stanley',        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Truppe' ,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Acadia' ,        
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Brands', null, {});
    
  }
};