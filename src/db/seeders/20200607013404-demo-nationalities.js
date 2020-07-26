'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Nationalities', [{
	id:1,
        name: 'Nacional',
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
	id:2,
        name: 'Extranjera' ,
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Nationalities', null, {});
    
  }
};