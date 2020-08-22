'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('materials', [{
        name: 'Madera',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Plastico',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Lana',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('materials', null, {});

  }
};