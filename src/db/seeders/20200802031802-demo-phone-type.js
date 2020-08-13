'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('phoneTypes', [{
        name: 'Movil',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
		{
        name: 'Casa',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
      {
        name: 'Empresa',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }      
      ], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('phoneTypes', null, {});

  }
};
