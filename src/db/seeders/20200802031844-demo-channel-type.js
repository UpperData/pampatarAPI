'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('salesChannels', [{
        name: 'Redes Sociales',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
		{
        name: 'Vendo Personalmente',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
      {
        name: 'Otro Marketplace',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      } ,
      {
        name: 'Por medio de un aliado comercial',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }     
      ], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('salesChannels', null, {});

  }
};
