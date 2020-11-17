'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('sizes', [{
        name: 'Small(S)',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Medium(M)',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Large(M)',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Extra Large(XL)',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('sizes', null, {});

  }
};