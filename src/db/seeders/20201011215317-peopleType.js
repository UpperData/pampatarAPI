'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('peopleTypes', [
      {
        name: 'John',   
        StatusId:1,     
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    ], {});
  },
 
  down: (queryInterface, Sequelize) => {
   return queryInterface.bulkDelete('peopleTypes', null, {});
  }
}; 

