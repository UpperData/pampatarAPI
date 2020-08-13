'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('docTypes', [{
        name: 'RUT',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
		{
        name: 'RUN',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
      {
        name: 'DNI',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }      
      ,{
        name: 'PASAPORTE',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('docTypes', null, {});

  }
};
