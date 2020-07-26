'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Status', [{
	id:1,
        name: 'Active',
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
	id:2,
        name: 'Inactive' ,
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Status', null, {});
    
  }
};
